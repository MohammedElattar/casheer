import { Router } from 'express';
import { z } from 'zod';
import { query, withTx } from '../db/pool.js';
import { requireAuth } from '../middleware/auth.js';
import { ApiError } from '../middleware/error.js';

const router = Router();
router.use(requireAuth);

const OpenShiftBody = z.object({
  point_id:   z.string().uuid(),
  shift_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  shift_kind: z.number().int().min(1),
});

router.post('/', async (req, res, next) => {
  try {
    const p = OpenShiftBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const employee_id = req.user.sub;
    const result = await withTx(async (client) => {
      // Permission check (replaces legacy emp_point lookup).
      const { rows: perm } = await client.query(
        `SELECT 1 FROM employee_point_permissions
          WHERE employee_id = $1 AND point_id = $2 AND shift_kind = $3`,
        [employee_id, p.data.point_id, p.data.shift_kind],
      );
      if (!perm[0]) throw new ApiError(403, 'NOT_ASSIGNED',
        'employee not assigned to this point/shift');
      // Reuse existing shift if open.
      const { rows: existing } = await client.query(
        `SELECT * FROM shifts
          WHERE employee_id=$1 AND point_id=$2 AND shift_date=$3 AND shift_kind=$4
          LIMIT 1`,
        [employee_id, p.data.point_id, p.data.shift_date, p.data.shift_kind],
      );
      if (existing[0]) return existing[0];
      const { rows } = await client.query(
        `INSERT INTO shifts (shift_date, shift_kind, employee_id, point_id)
         VALUES ($1,$2,$3,$4) RETURNING *`,
        [p.data.shift_date, p.data.shift_kind, employee_id, p.data.point_id],
      );
      return rows[0];
    });
    res.status(201).json({ shift: result });
  } catch (e) { next(e); }
});

router.post('/:id/close', async (req, res, next) => {
  try {
    const { rows } = await query(
      `UPDATE shifts SET closed_at = now() WHERE id = $1 RETURNING *`,
      [req.params.id],
    );
    if (!rows[0]) throw new ApiError(404, 'SHIFT_NOT_FOUND', 'shift not found');
    res.json({ shift: rows[0] });
  } catch (e) { next(e); }
});

router.get('/:id', async (req, res, next) => {
  try {
    const { rows } = await query(`SELECT * FROM shifts WHERE id = $1`, [req.params.id]);
    if (!rows[0]) throw new ApiError(404, 'SHIFT_NOT_FOUND', 'shift not found');
    res.json({ shift: rows[0] });
  } catch (e) { next(e); }
});

export default router;
