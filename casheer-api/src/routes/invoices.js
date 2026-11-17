import { Router } from 'express';
import { z } from 'zod';
import * as svc from '../services/invoice.service.js';
import { renderInvoicePdf } from '../services/print.service.js';
import { requireAuth } from '../middleware/auth.js';
import { ApiError } from '../middleware/error.js';
import { query } from '../db/pool.js';

const router = Router();

router.use(requireAuth);

// List invoices, optionally filtered by shift_id or (point_id + inv_date) + status.
router.get('/', async (req, res, next) => {
  try {
    const where = [];
    const params = [];
    const push = (clause, val) => { params.push(val); where.push(clause.replace('?', `$${params.length}`)); };
    if (req.query.shift_id)  push('shift_id = ?', req.query.shift_id);
    if (req.query.point_id)  push('point_id = ?', req.query.point_id);
    if (req.query.inv_date)  push('inv_date = ?', req.query.inv_date);
    if (req.query.status)    push('status   = ?', req.query.status);
    const sql = `
      SELECT id, serial_no, ser_no, point_id, inv_date, shift_id, employee_id,
             inv_type, madf_type, table_no, person_count,
             service_percent, discount_percent,
             client_type, mem_id, mem_serial, mem_bar, mem_name, mem_rank,
             room_no, h_no, guest_name,
             status, subtotal, service_amount, discount_amount, total,
             note, created_at, paid_at,
             (SELECT COUNT(*)::int FROM invoice_lines il WHERE il.invoice_id = invoices.id) AS lines_count,
             EXISTS(SELECT 1 FROM m2_inv m WHERE m.invoice_id = invoices.id) AS is_captain_order
        FROM invoices
       ${where.length ? 'WHERE ' + where.join(' AND ') : ''}
       ORDER BY created_at DESC
       LIMIT 500`;
    const { rows } = await query(sql, params);
    res.json({ invoices: rows });
  } catch (e) { next(e); }
});

const OpenBody = z.object({
  point_id:    z.string().uuid(),
  inv_date:    z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  shift_id:    z.string().uuid(),
  inv_type:    z.number().int().min(1).max(5).default(1),
  madf_type:   z.number().int().min(1).max(3).default(1),
  table_no:    z.number().int().positive().nullable().optional(),
  person_count:z.number().int().positive().nullable().optional(),
  client_type: z.enum(['CIVILIAN', 'MEMBER', 'GUEST']).optional(),
  barcode:     z.string().nullable().optional(),
  room_no:     z.number().int().positive().nullable().optional(),
  h_no:        z.string().nullable().optional(),
});

router.post('/', async (req, res, next) => {
  try {
    const p = OpenBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const invoice = await svc.openInvoice({
      ...p.data, employee_id: req.user.sub,
    });
    res.status(201).json({ invoice });
  } catch (e) { next(e); }
});

router.get('/:id', async (req, res, next) => {
  try {
    const result = await svc.getInvoice(req.params.id);
    res.json(result);
  } catch (e) { next(e); }
});

const UpdateClientBody = z.object({
  client_type: z.enum(['CIVILIAN', 'MEMBER', 'GUEST']),
  barcode:     z.string().nullable().optional(),
  room_no:     z.number().int().positive().nullable().optional(),
  h_no:        z.string().nullable().optional(),
});

router.patch('/:id/client', async (req, res, next) => {
  try {
    const p = UpdateClientBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad client body', p.error.issues);
    const invoice = await svc.updateInvoiceClient(req.params.id, p.data);
    res.json({ invoice });
  } catch (e) { next(e); }
});

const AddLineBody = z.object({
  item_id: z.string().uuid(),
  qty:     z.number().positive().max(9999),
  unit_price_override: z.number().nonnegative().nullable().optional(),
  note:    z.string().max(200).nullable().optional(),
});

router.post('/:id/lines', async (req, res, next) => {
  try {
    const p = AddLineBody.safeParse(req.body);
    if (!p.success) throw new ApiError(400, 'INVALID_BODY', 'bad body', p.error.issues);
    const result = await svc.addLine(req.params.id, p.data);
    res.status(201).json(result);
  } catch (e) { next(e); }
});

router.patch('/:id/lines/:lineId', async (req, res, next) => {
  try {
    const qty = Number(req.body?.qty);
    if (!(qty > 0)) throw new ApiError(400, 'INVALID_QTY', 'qty required');
    const result = await svc.updateLineQty(req.params.id, req.params.lineId, qty);
    res.json(result);
  } catch (e) { next(e); }
});

router.delete('/:id/lines/:lineId', async (req, res, next) => {
  try {
    const result = await svc.removeLine(req.params.id, req.params.lineId);
    res.json(result);
  } catch (e) { next(e); }
});

router.patch('/:id/discount', async (req, res, next) => {
  try {
    const dp = Number(req.body?.discount_percent);
    const result = await svc.updateDiscount(req.params.id, dp);
    res.json({ invoice: result });
  } catch (e) { next(e); }
});

router.post('/:id/close', async (req, res, next) => {
  try {
    const invoice = await svc.closeInvoice(req.params.id, req.user.sub);
    res.json({ invoice });
  } catch (e) { next(e); }
});

router.post('/:id/cancel', async (req, res, next) => {
  try {
    const reason = typeof req.body?.reason === 'string' ? req.body.reason : null;
    const invoice = await svc.cancelInvoice(req.params.id, req.user.sub, reason);
    res.json({ invoice });
  } catch (e) { next(e); }
});

// PDF print. Returns application/pdf. Client is free to call twice for two copies.
router.get('/:id/pdf', async (req, res, next) => {
  try {
    const pdf = await renderInvoicePdf(req.params.id);
    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition',
      `inline; filename="invoice-${req.params.id}.pdf"`);
    res.send(pdf);
  } catch (e) { next(e); }
});

export default router;
