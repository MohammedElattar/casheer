import { Router } from 'express';
import { z } from 'zod';
import { query, withTx } from '../db/pool.js';
import { requireAuth } from '../middleware/auth.js';
import { ApiError } from '../middleware/error.js';
import { resolveAndValidateShiftDate } from '../util/money.js';
import { getShiftCloseSummary } from '../services/shift-report.service.js';
import { renderShiftInvoicesPdf, renderShiftItemsPdf } from '../services/print.service.js';

const router = Router();
router.use(requireAuth);

const OpenShiftBody = z.object({
  point_id:   z.string().uuid(),
  shift_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).optional(),
  shift_kind: z.number().int().min(1).max(3),
});

router.post('/', async (req, res, next) => {
  try {
    const p = OpenShiftBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const shiftDate = resolveAndValidateShiftDate(p.data.shift_kind, p.data.shift_date);
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
      // Atomic upsert: open or reuse existing shift.
      const { rows } = await client.query(
        `INSERT INTO shifts (shift_date, shift_kind, employee_id, point_id)
         VALUES ($1,$2,$3,$4)
         ON CONFLICT (shift_date, shift_kind, employee_id, point_id)
         DO UPDATE SET closed_at = NULL
         RETURNING id, shift_date::text AS shift_date, shift_kind, employee_id, point_id, started_at, closed_at`,
        [shiftDate, p.data.shift_kind, employee_id, p.data.point_id],
      );
      return rows[0];
    });
    res.status(201).json({ shift: result });
  } catch (e) { next(e); }
});

// Full shift closing summary (`نموذج إغلاق وردية منفذ` — POINT_CLOSE)
router.get('/:id/close-preview', async (req, res, next) => {
  try {
    const summary = await getShiftCloseSummary(req.params.id);
    res.json(summary);
  } catch (e) { next(e); }
});

// Printable PDF report of shift invoices & client breakdown (المدنى / المشترك / النزيل)
router.get('/:id/report/invoices-pdf', async (req, res, next) => {
  try {
    const pdf = await renderShiftInvoicesPdf(req.params.id);
    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', `inline; filename="shift-invoices-${req.params.id}.pdf"`);
    res.send(pdf);
  } catch (e) { next(e); }
});

// Printable PDF report of dispensed items in the shift (بيان الأصناف المنصرفة بالوردية)
router.get('/:id/report/items-pdf', async (req, res, next) => {
  try {
    const pdf = await renderShiftItemsPdf(req.params.id);
    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', `inline; filename="shift-items-${req.params.id}.pdf"`);
    res.send(pdf);
  } catch (e) { next(e); }
});

router.post('/:id/close', async (req, res, next) => {
  try {
    const { rows } = await query(
      `UPDATE shifts SET closed_at = now()
        WHERE id = $1
        RETURNING id, shift_date::text AS shift_date, shift_kind, employee_id, point_id, started_at, closed_at`,
      [req.params.id],
    );
    if (!rows[0]) throw new ApiError(404, 'SHIFT_NOT_FOUND', 'shift not found');
    const summary = await getShiftCloseSummary(req.params.id);
    res.json({ shift: rows[0], summary });
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
