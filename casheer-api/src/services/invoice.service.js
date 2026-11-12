import { withTx, query } from '../db/pool.js';
import { ApiError } from '../middleware/error.js';
import { computeTotals, floor2, isPointOpenOn } from '../util/money.js';

/**
 * Open a new invoice in a shift.
 * Dual counter: serial_no := MAX(serial_no)+1 WHERE (point_id, inv_date).
 * Caller must be inside the right shift.
 *
 * @returns created invoice row.
 */
export async function openInvoice({
  point_id, inv_date, shift_id, employee_id,
  inv_type = 1, madf_type = 1, table_no = null, person_count = null,
}) {
  return withTx(async (client) => {
    // Point weekday gate.
    const { rows: pts } = await client.query(
      `SELECT id, service_percent, weekday_mask, m_status, active FROM points WHERE id = $1`,
      [point_id],
    );
    const point = pts[0];
    if (!point)           throw new ApiError(404, 'POINT_NOT_FOUND', 'point not found');
    if (!point.active)    throw new ApiError(400, 'POINT_INACTIVE', 'point inactive');
    if (point.m_status !== 1) throw new ApiError(400, 'POINT_DISABLED', 'point m_status is 0');
    if (!isPointOpenOn(point.weekday_mask, new Date(inv_date))) {
      throw new ApiError(400, 'POINT_CLOSED_TODAY', 'point not open this weekday');
    }

    // Next serial_no for this (point, date).
    const { rows: sn } = await client.query(
      `SELECT COALESCE(MAX(serial_no), 0) + 1 AS n
         FROM invoices WHERE point_id = $1 AND inv_date = $2`,
      [point_id, inv_date],
    );
    const serial_no = sn[0].n;

    const { rows } = await client.query(
      `INSERT INTO invoices
         (serial_no, point_id, inv_date, shift_id, employee_id,
          inv_type, madf_type, table_no, person_count,
          service_percent, status)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,'OPEN')
       RETURNING *`,
      [serial_no, point_id, inv_date, shift_id, employee_id,
       inv_type, madf_type, table_no, person_count, point.service_percent],
    );
    return rows[0];
  });
}

async function assertEditable(client, invoice_id) {
  const { rows } = await client.query(
    `SELECT * FROM invoices WHERE id = $1 FOR UPDATE`,
    [invoice_id],
  );
  const inv = rows[0];
  if (!inv)                    throw new ApiError(404, 'INVOICE_NOT_FOUND', 'invoice not found');
  if (inv.status !== 'OPEN')   throw new ApiError(400, 'INVOICE_LOCKED', `invoice status is ${inv.status}`);
  return inv;
}

async function recomputeTotals(client, invoice) {
  const { rows } = await client.query(
    `SELECT COALESCE(SUM(line_total), 0) AS subtotal
       FROM invoice_lines WHERE invoice_id = $1`,
    [invoice.id],
  );
  const totals = computeTotals({
    subtotal:         rows[0].subtotal,
    servicePercent:   invoice.service_percent,
    discountPercent:  invoice.discount_percent,
  });
  const { rows: upd } = await client.query(
    `UPDATE invoices
        SET subtotal        = $2,
            service_amount  = $3,
            discount_amount = $4,
            total           = $5
      WHERE id = $1
      RETURNING *`,
    [invoice.id, totals.subtotal, totals.service_amount, totals.discount_amount, totals.total],
  );
  return upd[0];
}

export async function addLine(invoice_id, { item_id, qty, unit_price_override = null, note = null }) {
  return withTx(async (client) => {
    const inv = await assertEditable(client, invoice_id);

    // Resolve price: override > point-specific > item default.
    let unit_price = unit_price_override;
    if (unit_price == null) {
      const { rows } = await client.query(
        `SELECT COALESCE(pi.price, i.default_price) AS price
           FROM items i
           LEFT JOIN point_items pi ON pi.item_id = i.id AND pi.point_id = $2
          WHERE i.id = $1 AND i.active = TRUE`,
        [item_id, inv.point_id],
      );
      if (!rows[0]) throw new ApiError(404, 'ITEM_NOT_FOUND', 'item not found or inactive');
      unit_price = rows[0].price;
    }
    if (!(qty > 0 && qty <= 9999)) {
      throw new ApiError(400, 'INVALID_QTY', 'qty must be > 0 and <= 9999');
    }
    const line_total = floor2(Number(qty) * Number(unit_price));

    const { rows: lineNo } = await client.query(
      `SELECT COALESCE(MAX(line_no), 0) + 1 AS n FROM invoice_lines WHERE invoice_id = $1`,
      [invoice_id],
    );
    const line_no = lineNo[0].n;

    const { rows: line } = await client.query(
      `INSERT INTO invoice_lines
         (invoice_id, line_no, item_id, qty, unit_price, line_total, note)
       VALUES ($1,$2,$3,$4,$5,$6,$7)
       RETURNING *`,
      [invoice_id, line_no, item_id, qty, unit_price, line_total, note],
    );
    const invoice = await recomputeTotals(client, inv);
    return { line: line[0], invoice };
  });
}

export async function updateLineQty(invoice_id, line_id, qty) {
  return withTx(async (client) => {
    const inv = await assertEditable(client, invoice_id);
    if (!(qty > 0 && qty <= 9999)) throw new ApiError(400, 'INVALID_QTY', 'qty must be > 0 and <= 9999');
    const { rows } = await client.query(
      `UPDATE invoice_lines
          SET qty = $3,
              line_total = FLOOR($3 * unit_price * 100) / 100
        WHERE invoice_id = $1 AND id = $2
        RETURNING *`,
      [invoice_id, line_id, qty],
    );
    if (!rows[0]) throw new ApiError(404, 'LINE_NOT_FOUND', 'line not found');
    const invoice = await recomputeTotals(client, inv);
    return { line: rows[0], invoice };
  });
}

export async function removeLine(invoice_id, line_id) {
  return withTx(async (client) => {
    const inv = await assertEditable(client, invoice_id);
    const { rowCount } = await client.query(
      `DELETE FROM invoice_lines WHERE invoice_id = $1 AND id = $2`,
      [invoice_id, line_id],
    );
    if (rowCount === 0) throw new ApiError(404, 'LINE_NOT_FOUND', 'line not found');
    const invoice = await recomputeTotals(client, inv);
    return { invoice };
  });
}

export async function updateDiscount(invoice_id, discount_percent) {
  return withTx(async (client) => {
    const inv = await assertEditable(client, invoice_id);
    if (!(discount_percent >= 0 && discount_percent <= 100)) {
      throw new ApiError(400, 'INVALID_DISCOUNT', 'discount_percent must be 0..100');
    }
    const { rows } = await client.query(
      `UPDATE invoices SET discount_percent = $2 WHERE id = $1 RETURNING *`,
      [invoice_id, discount_percent],
    );
    return recomputeTotals(client, rows[0]);
  });
}

/**
 * Close (pay) an invoice: assigns ser_no (per-paid counter) and flips status.
 */
export async function closeInvoice(invoice_id, paid_by_employee_id) {
  return withTx(async (client) => {
    const inv = await assertEditable(client, invoice_id);
    const { rows: countRows } = await client.query(
      `SELECT COUNT(*)::int AS n FROM invoice_lines WHERE invoice_id = $1`,
      [invoice_id],
    );
    if (countRows[0].n === 0) {
      throw new ApiError(400, 'EMPTY_INVOICE', 'cannot close invoice with no lines');
    }
    // Next ser_no scoped to (point, date, PAID subset).
    const { rows: sn } = await client.query(
      `SELECT COALESCE(MAX(ser_no), 0) + 1 AS n
         FROM invoices
        WHERE point_id = $1 AND inv_date = $2 AND status = 'PAID'`,
      [inv.point_id, inv.inv_date],
    );
    const ser_no = sn[0].n;
    const { rows } = await client.query(
      `UPDATE invoices
          SET status              = 'PAID',
              ser_no              = $2,
              paid_at             = now(),
              paid_by_employee_id = $3
        WHERE id = $1
        RETURNING *`,
      [invoice_id, ser_no, paid_by_employee_id],
    );
    return rows[0];
  });
}

/**
 * Cancel invoice: delete lines, zero totals, keep invoice row for audit.
 */
export async function cancelInvoice(invoice_id, cancelled_by_employee_id, reason = null) {
  return withTx(async (client) => {
    const { rows } = await client.query(
      `SELECT * FROM invoices WHERE id = $1 FOR UPDATE`,
      [invoice_id],
    );
    const inv = rows[0];
    if (!inv)                     throw new ApiError(404, 'INVOICE_NOT_FOUND', 'invoice not found');
    if (inv.status === 'CANCELLED') return inv;   // idempotent
    if (inv.status === 'PAID')    throw new ApiError(400, 'INVOICE_PAID',
                                      'paid invoices must be refunded, not cancelled');
    await client.query(`DELETE FROM invoice_lines WHERE invoice_id = $1`, [invoice_id]);
    const { rows: upd } = await client.query(
      `UPDATE invoices
          SET status                   = 'CANCELLED',
              subtotal                 = 0,
              service_amount           = 0,
              discount_amount          = 0,
              total                    = 0,
              cancelled_at             = now(),
              cancelled_by_employee_id = $2,
              cancel_reason            = $3
        WHERE id = $1
        RETURNING *`,
      [invoice_id, cancelled_by_employee_id, reason],
    );
    return upd[0];
  });
}

export async function getInvoice(invoice_id) {
  const { rows: invs } = await query(`SELECT * FROM invoices WHERE id = $1`, [invoice_id]);
  if (!invs[0]) throw new ApiError(404, 'INVOICE_NOT_FOUND', 'invoice not found');
  const { rows: lines } = await query(
    `SELECT il.*, i.code AS item_code, i.name AS item_name
       FROM invoice_lines il
       JOIN items i ON i.id = il.item_id
      WHERE il.invoice_id = $1
      ORDER BY il.line_no`,
    [invoice_id],
  );
  return { invoice: invs[0], lines };
}

export async function listInvoicesByShift(shift_id) {
  const { rows } = await query(
    `SELECT id, serial_no, ser_no, status, total, created_at, paid_at
       FROM invoices WHERE shift_id = $1 ORDER BY serial_no`,
    [shift_id],
  );
  return rows;
}
