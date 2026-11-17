import { Router } from 'express';
import { z } from 'zod';
import { query, withTx } from '../db/pool.js';
import { requireAuth } from '../middleware/auth.js';
import { ApiError } from '../middleware/error.js';
import { getInvoice } from '../services/invoice.service.js';
import { resolveAndValidateShiftDate } from '../util/money.js';

const router = Router();
router.use(requireAuth);

const SubmitCaptainOrderBody = z.object({
  point_id:        z.string().uuid().optional(),
  point_code:      z.number().int().positive().optional(),
  inv_date:        z.string().regex(/^\d{4}-\d{2}-\d{2}$/).optional(),
  shift_type:      z.number().int().min(1).max(3).default(1),
  table_number:    z.number().int().positive(),
  noofperson:      z.number().int().positive().optional().nullable(),
  remarks:         z.string().max(1000).optional().nullable(),
  kitchen_notify:  z.string().max(10).default('1'),
  halawany_notify: z.string().max(10).default('0'),
  items: z.array(
    z.object({
      good_code: z.union([z.number().int().positive(), z.string().min(1)]),
      quantity:  z.number().positive().max(9999),
      remarks:   z.string().max(500).optional().nullable(),
    }),
  ).min(1),
});

// List M2_INV captain orders for a point/date
router.get('/', async (req, res, next) => {
  try {
    const where = [];
    const params = [];
    const push = (clause, val) => {
      params.push(val);
      where.push(clause.replace('?', `$${params.length}`));
    };

    if (req.query.point_code) {
      push('m.point_code = ?', Number(req.query.point_code));
    } else if (req.query.point_id) {
      push('p.id = ?', req.query.point_id);
    }
    if (req.query.inv_date) {
      push('m.inv_date = ?', req.query.inv_date);
    }

    const { rows } = await query(
      `SELECT m.*,
              i.status AS invoice_status,
              i.serial_no AS invoice_serial_no,
              i.ser_no AS invoice_ser_no,
              i.total AS invoice_total,
              COALESCE(
                json_agg(
                  json_build_object(
                    'serial', d.serial,
                    'good_code', d.good_code,
                    'good_name', d.good_name,
                    'quantity', d.quantity,
                    'canceled', d.canceled,
                    'inv_i_serial', d.inv_i_serial,
                    'remarks', d.remarks
                  ) ORDER BY d.serial
                ) FILTER (WHERE d.serial IS NOT NULL),
                '[]'::json
              ) AS details
         FROM m2_inv m
         LEFT JOIN points p ON p.code = m.point_code
         LEFT JOIN invoices i ON i.id = m.invoice_id
         LEFT JOIN m2_inv_details d ON d.inv_serial = m.inv_serial AND d.pointcode = m.point_code
        ${where.length ? 'WHERE ' + where.join(' AND ') : ''}
        GROUP BY m.inv_serial, i.id
        ORDER BY m.inv_serial DESC
        LIMIT 100`,
      params,
    );
    res.json({ captain_orders: rows });
  } catch (e) { next(e); }
});

// Submit a Captain Order -> inserts into M2_INV and M2_INV_DETAILS,
// which triggers automatic synchronization into `invoices` (OPEN) and `invoice_lines`.
router.post('/', async (req, res, next) => {
  try {
    const p = SubmitCaptainOrderBody.safeParse(req.body);
    if (!p.success) {
      throw new ApiError(400, 'INVALID_BODY', 'invalid captain order payload', p.error.issues);
    }
    const data = p.data;
    const effectiveDate = resolveAndValidateShiftDate(data.shift_type, data.inv_date);

    const result = await withTx(async (client) => {
      // Resolve point_code from point_id or point_code
      let pointCode = data.point_code;
      let pointId   = data.point_id;

      if (!pointCode && pointId) {
        const { rows: pts } = await client.query(
          `SELECT id, code FROM points WHERE id = $1 AND active = TRUE`,
          [pointId],
        );
        if (!pts[0]) throw new ApiError(404, 'POINT_NOT_FOUND', 'point not found');
        pointCode = pts[0].code;
      } else if (pointCode && !pointId) {
        const { rows: pts } = await client.query(
          `SELECT id, code FROM points WHERE code = $1 AND active = TRUE`,
          [pointCode],
        );
        if (!pts[0]) throw new ApiError(404, 'POINT_NOT_FOUND', 'point not found');
        pointId = pts[0].id;
      } else if (!pointCode && !pointId) {
        throw new ApiError(400, 'POINT_REQUIRED', 'point_id or point_code is required');
      }

      // Check employee port permission
      const { rows: perm } = await client.query(
        `SELECT 1 FROM employee_point_permissions
          WHERE employee_id = $1 AND point_id = $2
          LIMIT 1`,
        [req.user.sub, pointId],
      );
      if (!perm[0]) {
        throw new ApiError(403, 'PORT_NOT_ASSIGNED', 'employee not assigned to this point');
      }

      // 1. Insert header into M2_INV (trigger creates/attaches OPEN invoice in `invoices`)
      const { rows: m2Rows } = await client.query(
        `INSERT INTO m2_inv
           (inv_date, table_number, remarks, point_code, user_id, noofperson, shift_type, kitchen_notify, halawany_notify)
         VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
         RETURNING *`,
        [
          effectiveDate,
          data.table_number,
          data.remarks ?? null,
          pointCode,
          req.user.code,
          data.noofperson ?? null,
          data.shift_type,
          data.kitchen_notify,
          data.halawany_notify,
        ],
      );
      const m2Order = m2Rows[0];

      // 2. Insert line items into M2_INV_DETAILS (trigger populates `invoice_lines` and recomputes totals)
      const m2Details = [];
      for (let i = 0; i < data.items.length; i++) {
        const it = data.items[i];
        const serial = i + 1;
        const { rows: dRows } = await client.query(
          `INSERT INTO m2_inv_details
             (inv_serial, serial, good_code, quantity, remarks, curr_user_id, pointcode)
           VALUES ($1, $2, $3, $4, $5, $6, $7)
           RETURNING *`,
          [
            m2Order.inv_serial,
            serial,
            String(it.good_code),
            it.quantity,
            it.remarks ?? null,
            req.user.code,
            pointCode,
          ],
        );
        m2Details.push(dRows[0]);
      }

      return { m2Order, m2Details };
    });

    const synced = await getInvoice(result.m2Order.invoice_id);
    res.status(201).json({
      m2_order:   result.m2Order,
      m2_details: result.m2Details,
      invoice:    synced.invoice,
      lines:      synced.lines,
    });
  } catch (e) { next(e); }
});

// Cancel a line item in M2_INV_DETAILS (flips canceled = '1', trigger removes from invoice_lines & recomputes)
router.patch('/:invSerial/details/:serial/cancel', async (req, res, next) => {
  try {
    const invSerial = Number(req.params.invSerial);
    const serial    = Number(req.params.serial);

    const { rows: m2Rows } = await query(
      `SELECT * FROM m2_inv WHERE inv_serial = $1`,
      [invSerial],
    );
    if (!m2Rows[0]) throw new ApiError(404, 'M2_ORDER_NOT_FOUND', 'captain order not found');

    const { rows: upd } = await query(
      `UPDATE m2_inv_details
          SET canceled = '1',
              request_del_stat = '1',
              user_request_del = $3
        WHERE inv_serial = $1 AND serial = $2
        RETURNING *`,
      [invSerial, serial, req.user.code],
    );
    if (!upd[0]) throw new ApiError(404, 'M2_DETAIL_NOT_FOUND', 'captain order item not found');

    const synced = await getInvoice(m2Rows[0].invoice_id);
    res.json({
      m2_detail: upd[0],
      invoice:   synced.invoice,
      lines:     synced.lines,
    });
  } catch (e) { next(e); }
});

export default router;
