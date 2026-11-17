import { Router } from 'express';
import { z } from 'zod';
import { query, withTx } from '../db/pool.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { ApiError } from '../middleware/error.js';
import { hashPassword } from '../services/auth.service.js';

const router = Router();
router.use(requireAuth);
router.use(requireRole('ADMIN'));

// List all employees with their assigned point IDs and codes.
router.get('/', async (_req, res, next) => {
  try {
    const { rows } = await query(
      `SELECT e.id, e.code, e.name, e.role, e.active, e.created_at,
              COALESCE(
                ARRAY_AGG(DISTINCT epp.point_id) FILTER (WHERE epp.point_id IS NOT NULL),
                '{}'
              ) AS point_ids,
              COALESCE(
                ARRAY_AGG(DISTINCT p.code ORDER BY p.code) FILTER (WHERE p.code IS NOT NULL),
                '{}'
              ) AS point_codes
         FROM employees e
         LEFT JOIN employee_point_permissions epp ON epp.employee_id = e.id
         LEFT JOIN points p ON p.id = epp.point_id
        GROUP BY e.id
        ORDER BY e.code`,
    );
    res.json({ employees: rows });
  } catch (e) { next(e); }
});

const CreateEmployeeBody = z.object({
  code:      z.string().min(1).max(50),
  name:      z.string().min(1).max(200),
  password:  z.string().min(4).max(100),
  role:      z.enum(['CASHIER', 'SUPERVISOR', 'ADMIN']).default('CASHIER'),
  active:    z.boolean().optional().default(true),
  point_ids: z.array(z.string().uuid()).optional().default([]),
});

router.post('/', async (req, res, next) => {
  try {
    const p = CreateEmployeeBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const { code, name, password, role, active, point_ids } = p.data;
    const pwHash = await hashPassword(password);

    const emp = await withTx(async (client) => {
      const { rows } = await client.query(
        `INSERT INTO employees (code, name, password_hash, role, active)
         VALUES ($1,$2,$3,$4,$5)
         RETURNING id, code, name, role, active, created_at`,
        [code.trim(), name.trim(), pwHash, role, active],
      );
      const created = rows[0];
      for (const ptId of point_ids) {
        for (const sk of [1, 2, 3]) {
          await client.query(
            `INSERT INTO employee_point_permissions (employee_id, point_id, shift_kind)
             VALUES ($1, $2, $3) ON CONFLICT DO NOTHING`,
            [created.id, ptId, sk],
          );
        }
      }
      return created;
    });
    res.status(201).json({ employee: emp });
  } catch (e) { next(e); }
});

const UpdateEmployeeBody = z.object({
  name:      z.string().min(1).max(200).optional(),
  password:  z.string().min(4).max(100).optional(),
  role:      z.enum(['CASHIER', 'SUPERVISOR', 'ADMIN']).optional(),
  active:    z.boolean().optional(),
  point_ids: z.array(z.string().uuid()).optional(),
});

router.patch('/:id', async (req, res, next) => {
  try {
    const p = UpdateEmployeeBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const d = p.data;

    const updated = await withTx(async (client) => {
      const fields = [];
      const vals = [];
      if (d.name !== undefined)   { vals.push(d.name.trim()); fields.push(`name = $${vals.length}`); }
      if (d.role !== undefined)   { vals.push(d.role);        fields.push(`role = $${vals.length}`); }
      if (d.active !== undefined) { vals.push(d.active);      fields.push(`active = $${vals.length}`); }
      if (d.password) {
        const pwHash = await hashPassword(d.password);
        vals.push(pwHash);
        fields.push(`password_hash = $${vals.length}`);
      }

      let empRow;
      if (fields.length > 0) {
        vals.push(req.params.id);
        const { rows } = await client.query(
          `UPDATE employees SET ${fields.join(', ')} WHERE id = $${vals.length}
           RETURNING id, code, name, role, active, created_at`,
          vals,
        );
        empRow = rows[0];
      } else {
        const { rows } = await client.query(
          `SELECT id, code, name, role, active, created_at FROM employees WHERE id = $1`,
          [req.params.id],
        );
        empRow = rows[0];
      }

      if (!empRow) throw new ApiError(404, 'EMPLOYEE_NOT_FOUND', 'employee not found');

      if (d.point_ids !== undefined) {
        await client.query(`DELETE FROM employee_point_permissions WHERE employee_id = $1`, [empRow.id]);
        for (const ptId of d.point_ids) {
          for (const sk of [1, 2, 3]) {
            await client.query(
              `INSERT INTO employee_point_permissions (employee_id, point_id, shift_kind)
               VALUES ($1, $2, $3) ON CONFLICT DO NOTHING`,
              [empRow.id, ptId, sk],
            );
          }
        }
      }
      return empRow;
    });

    res.json({ employee: updated });
  } catch (e) { next(e); }
});

export default router;
