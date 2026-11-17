import { Router } from 'express';
import { query } from '../db/pool.js';
import { requireAuth } from '../middleware/auth.js';

const router = Router();
router.use(requireAuth);

// Day summary for a point: PAID count, OPEN count, CANCELLED count, totals + client breakdown (المدنى / المشترك / النزيل).
router.get('/day-summary', async (req, res, next) => {
  try {
    const { point_id, inv_date } = req.query;
    if (!point_id || !inv_date) {
      return res.status(400).json({ error: { code: 'MISSING_PARAMS',
        message: 'point_id and inv_date required' }});
    }
    const { rows } = await query(
      `SELECT status,
              COUNT(*)::int   AS count,
              COALESCE(SUM(subtotal),       0) AS subtotal_sum,
              COALESCE(SUM(service_amount), 0) AS service_sum,
              COALESCE(SUM(discount_amount),0) AS discount_sum,
              COALESCE(SUM(total),          0) AS total_sum
         FROM invoices
        WHERE point_id = $1 AND inv_date = $2
        GROUP BY status`,
      [point_id, inv_date],
    );
    const empty = { count: 0, subtotal_sum: 0, service_sum: 0, discount_sum: 0, total_sum: 0 };
    const buckets = { OPEN: { ...empty }, PAID: { ...empty }, CANCELLED: { ...empty } };
    for (const r of rows) buckets[r.status] = r;

    // Breakdown of PAID invoices by client_type (CIVILIAN, MEMBER, GUEST)
    const { rows: clientRows } = await query(
      `SELECT COALESCE(client_type, 'CIVILIAN') AS client_type,
              COUNT(*)::int                     AS count,
              COALESCE(SUM(total), 0)::numeric(12,2) AS total_sum
         FROM invoices
        WHERE point_id = $1 AND inv_date = $2 AND status = 'PAID'
        GROUP BY COALESCE(client_type, 'CIVILIAN')`,
      [point_id, inv_date],
    );
    const cMap = {
      CIVILIAN: { count: 0, total_sum: '0.00' },
      MEMBER:   { count: 0, total_sum: '0.00' },
      GUEST:    { count: 0, total_sum: '0.00' },
    };
    for (const r of clientRows) {
      const k = r.client_type in cMap ? r.client_type : 'CIVILIAN';
      cMap[k] = { count: Number(r.count), total_sum: Number(r.total_sum).toFixed(2) };
    }
    const cashTotal = (Number(cMap.CIVILIAN.total_sum) + Number(cMap.MEMBER.total_sum)).toFixed(2);
    const deferredTotal = Number(cMap.GUEST.total_sum).toFixed(2);
    const grandTotal = (Number(cashTotal) + Number(deferredTotal)).toFixed(2);

    res.json({
      point_id,
      inv_date,
      buckets,
      client_breakdown: {
        civilian:       cMap.CIVILIAN,
        member:         cMap.MEMBER,
        cash_total:     { count: cMap.CIVILIAN.count + cMap.MEMBER.count, total_sum: cashTotal },
        guest:          cMap.GUEST,
        deferred_total: { count: cMap.GUEST.count, total_sum: deferredTotal },
        grand_total:    { count: cMap.CIVILIAN.count + cMap.MEMBER.count + cMap.GUEST.count, total_sum: grandTotal },
      },
    });
  } catch (e) { next(e); }
});

// Items sold on a day at a point.
router.get('/items-sold', async (req, res, next) => {
  try {
    const { point_id, inv_date } = req.query;
    if (!point_id || !inv_date) {
      return res.status(400).json({ error: { code: 'MISSING_PARAMS',
        message: 'point_id and inv_date required' }});
    }
    const { rows } = await query(
      `SELECT i.id AS item_id, i.code AS item_code, i.name AS item_name,
              it.name AS type_name,
              SUM(il.qty)::numeric        AS qty_sold,
              SUM(il.line_total)::numeric AS total_sold
         FROM invoice_lines il
         JOIN invoices inv ON inv.id = il.invoice_id
         JOIN items    i   ON i.id   = il.item_id
         JOIN item_types it ON it.id = i.type_id
        WHERE inv.point_id = $1
          AND inv.inv_date = $2
          AND inv.status   = 'PAID'
        GROUP BY i.id, i.code, i.name, it.name
        ORDER BY total_sold DESC`,
      [point_id, inv_date],
    );
    res.json({ point_id, inv_date, items: rows });
  } catch (e) { next(e); }
});

// Shift summary
router.get('/shift-summary', async (req, res, next) => {
  try {
    const { shift_id } = req.query;
    if (!shift_id) {
      return res.status(400).json({ error: { code: 'MISSING_PARAMS', message: 'shift_id required' }});
    }
    const { rows } = await query(
      `SELECT status, COUNT(*)::int AS count, COALESCE(SUM(total),0) AS total_sum
         FROM invoices WHERE shift_id = $1 GROUP BY status`,
      [shift_id],
    );
    res.json({ shift_id, rows });
  } catch (e) { next(e); }
});

export default router;
