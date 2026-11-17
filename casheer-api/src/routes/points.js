import { Router } from 'express';
import { z } from 'zod';
import { query } from '../db/pool.js';
import { requireAuth, requireRole } from '../middleware/auth.js';
import { ApiError } from '../middleware/error.js';
import { getEmployeeAssignedPoints } from '../services/auth.service.js';

const router = Router();
router.use(requireAuth);

const PointBody = z.object({
  code:            z.number().int().positive(),
  name:            z.string().min(1).max(200),
  service_percent: z.number().min(0).max(100).default(0),
  min_charge:      z.number().min(0).default(0),
  printer_name:    z.string().max(100).nullable().optional(),
  weekday_mask:    z.number().int().min(0).max(127).default(127),
  m_status:        z.number().int().min(0).max(1).default(1),
  active:          z.boolean().optional().default(true),
});

// Return only points assigned to the authenticated employee.
router.get('/', async (req, res, next) => {
  try {
    const points = await getEmployeeAssignedPoints(req.user.sub);
    res.json({ points });
  } catch (e) { next(e); }
});

// Admin-only: list all points (active + inactive).
router.get('/all', requireRole('ADMIN'), async (_req, res, next) => {
  try {
    const { rows } = await query(`SELECT * FROM points ORDER BY code`);
    res.json({ points: rows });
  } catch (e) { next(e); }
});

router.post('/', requireRole('ADMIN'), async (req, res, next) => {
  try {
    const p = PointBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const d = p.data;
    const { rows } = await query(
      `INSERT INTO points
         (code, name, service_percent, min_charge, printer_name, weekday_mask, m_status, active)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
       RETURNING *`,
      [d.code, d.name, d.service_percent, d.min_charge, d.printer_name ?? null, d.weekday_mask, d.m_status, d.active],
    );
    res.status(201).json({ point: rows[0] });
  } catch (e) { next(e); }
});

router.patch('/:id', requireRole('ADMIN'), async (req, res, next) => {
  try {
    const p = PointBody.partial().safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const fields = [];
    const vals = [];
    for (const k of ['code','name','service_percent','min_charge','printer_name','weekday_mask','m_status','active']) {
      if (k in p.data) { vals.push(p.data[k]); fields.push(`${k} = $${vals.length}`); }
    }
    if (fields.length === 0) throw new ApiError(400, 'NO_FIELDS', 'no fields to update');
    vals.push(req.params.id);
    const { rows } = await query(
      `UPDATE points SET ${fields.join(', ')} WHERE id = $${vals.length} RETURNING *`,
      vals,
    );
    if (!rows[0]) throw new ApiError(404, 'NOT_FOUND', 'point not found');
    res.json({ point: rows[0] });
  } catch (e) { next(e); }
});

router.get('/:id', async (req, res, next) => {
  try {
    const { rows } = await query(
      `SELECT p.*
         FROM points p
         JOIN employee_point_permissions epp
           ON epp.point_id = p.id AND epp.employee_id = $2
        WHERE p.id = $1 AND p.active = TRUE
        LIMIT 1`,
      [req.params.id, req.user.sub],
    );
    if (!rows[0]) {
      const { rows: exists } = await query(`SELECT 1 FROM points WHERE id = $1`, [req.params.id]);
      if (exists[0]) {
        throw new ApiError(403, 'PORT_NOT_ASSIGNED', 'هذا المنفذ غير مخصص لهذا الموظف');
      }
      throw new ApiError(404, 'NOT_FOUND', 'point not found');
    }
    res.json({ point: rows[0] });
  } catch (e) { next(e); }
});

export default router;
