import { withTx, query } from '../db/pool.js';
import { ApiError } from '../middleware/error.js';
import { computeTotals, floor2, isPointOpenOn } from '../util/money.js';

async function lookupMemberByCode(client, rawCode) {
  const code = String(rawCode || '').trim();
  if (!code) {
    throw new ApiError(400, 'BARCODE_REQUIRED', 'أدخل باركود أو امسح QR كارنيه المشترك');
  }
  const numericCode = /^\d+$/.test(code) ? Number(code) : -1;
  const { rows } = await client.query(
    `SELECT b.m_bar, b.mem_serial, b.mem_id, b.m_kind, b.m_year, b.m_typ,
            b.discount_percent, b.flg_ok,
            m.mem_name, m.rank_name
       FROM memb_bar b
       JOIN main_memb m ON m.mem_serial = b.mem_serial
      WHERE m.active = TRUE
        AND b.flg_ok = 1
        AND (UPPER(b.m_bar) = UPPER($1) OR b.mem_id = $2 OR b.mem_serial = $2)
      LIMIT 1`,
    [code, numericCode],
  );
  if (!rows[0]) {
    throw new ApiError(404, 'MEMBER_NOT_FOUND', 'كارنيه المشترك غير مسجل أو غير ساري الصلاحية');
  }
  return rows[0];
}

async function lookupOccupiedRoom(client, { room_no, h_no }) {
  if (!room_no && !h_no) {
    throw new ApiError(400, 'ROOM_REQUIRED', 'اختر رقم الغرفة للنزيل لتحويل الفاتورة للريسبشن');
  }
  const { rows } = await client.query(
    `SELECT h.h_no, h.h_name AS guest_name, h.room_no, r.room_type
       FROM hagz_tbl h
       JOIN rooms r ON r.room_no = h.room_no
      WHERE h.out_flag = 0
        AND r.status = 1
        AND ($1::int IS NULL OR h.room_no = $1)
        AND ($2::text IS NULL OR h.h_no = $2)
      ORDER BY h.created_at DESC
      LIMIT 1`,
    [room_no ? Number(room_no) : null, h_no || null],
  );
  if (!rows[0]) {
    throw new ApiError(404, 'ROOM_NOT_OCCUPIED', 'الغرفة غير مشغولة حالياً أو لا يوجد حجز نشط لها بالريسبشن');
  }
  return rows[0];
}

/**
 * Open a new invoice in a shift.
 * Dual counter: serial_no := MAX(serial_no)+1 WHERE (point_id, inv_date).
 * Supports the 3 client types: CIVILIAN (مدنى), MEMBER (مشترك - QR scan), GUEST (نزيل - Room Reception).
 */
export async function openInvoice({
  point_id, inv_date, shift_id, employee_id,
  inv_type = 1, madf_type = 1, table_no = null, person_count = null,
  client_type = 'CIVILIAN', barcode = null, room_no = null, h_no = null,
}) {
  return withTx(async (client) => {
    // Verify employee is assigned to this point.
    const { rows: perm } = await client.query(
      `SELECT 1 FROM employee_point_permissions
        WHERE employee_id = $1 AND point_id = $2
        LIMIT 1`,
      [employee_id, point_id],
    );
    if (!perm[0]) {
      throw new ApiError(403, 'PORT_NOT_ASSIGNED', 'employee not assigned to this point');
    }

    // Verify shift exists and ensure invoice working date matches shift's working date.
    const { rows: shRows } = await client.query(
      `SELECT id, shift_date::text AS shift_date, point_id, closed_at
         FROM shifts WHERE id = $1`,
      [shift_id],
    );
    const shift = shRows[0];
    if (!shift) throw new ApiError(404, 'SHIFT_NOT_FOUND', 'shift not found');
    if (shift.closed_at) throw new ApiError(400, 'SHIFT_CLOSED', 'shift is closed');
    if (shift.point_id !== point_id) {
      throw new ApiError(400, 'SHIFT_POINT_MISMATCH', 'shift does not belong to this point');
    }
    const effectiveInvDate = shift.shift_date;
    if (inv_date && inv_date.slice(0, 10) !== effectiveInvDate) {
      throw new ApiError(
        400,
        'SHIFT_DATE_MISMATCH',
        `invoice date (${inv_date}) must match shift working date (${effectiveInvDate})`,
      );
    }

    // Point weekday gate.
    const { rows: pts } = await client.query(
      `SELECT id, service_percent, weekday_mask, m_status, active FROM points WHERE id = $1`,
      [point_id],
    );
    const point = pts[0];
    if (!point)           throw new ApiError(404, 'POINT_NOT_FOUND', 'point not found');
    if (!point.active)    throw new ApiError(400, 'POINT_INACTIVE', 'point inactive');
    if (point.m_status !== 1) throw new ApiError(400, 'POINT_DISABLED', 'point m_status is 0');
    if (!isPointOpenOn(point.weekday_mask, new Date(effectiveInvDate))) {
      throw new ApiError(400, 'POINT_CLOSED_TODAY', 'point not open this weekday');
    }

    // Next serial_no for this (point, date).
    const { rows: sn } = await client.query(
      `SELECT COALESCE(MAX(serial_no), 0) + 1 AS n
         FROM invoices WHERE point_id = $1 AND inv_date = $2`,
      [point_id, effectiveInvDate],
    );
    const serial_no = sn[0].n;

    let effectiveClientType = client_type || 'CIVILIAN';
    let effectiveInvType = inv_type;
    let effectiveMadfType = madf_type;
    let effectiveDiscountPercent = 0;
    let mem_id = null;
    let mem_serial = null;
    let mem_bar = null;
    let mem_name = null;
    let mem_rank = null;
    let resolvedRoomNo = null;
    let resolvedHNo = null;
    let guest_name = null;

    if (effectiveClientType === 'MEMBER') {
      const member = await lookupMemberByCode(client, barcode);
      effectiveInvType = 1;
      effectiveMadfType = 1;
      effectiveDiscountPercent = Number(member.discount_percent || 0);
      mem_id = member.mem_id;
      mem_serial = member.mem_serial;
      mem_bar = member.m_bar;
      mem_name = member.mem_name;
      mem_rank = member.rank_name;
    } else if (effectiveClientType === 'GUEST') {
      const room = await lookupOccupiedRoom(client, { room_no, h_no });
      effectiveInvType = 2; // غرف / نزيل فندق
      effectiveMadfType = 2; // آجل على حساب الغرفة بالريسبشن
      resolvedRoomNo = room.room_no;
      resolvedHNo = room.h_no;
      guest_name = room.guest_name;
    } else {
      effectiveClientType = 'CIVILIAN';
      effectiveMadfType = 1;
    }

    // Service charge: 12% on dining points (skip only for employee meal inv_type === 5).
    const effectiveServicePercent =
      effectiveInvType === 5 ? 0 : Number(point.service_percent);

    const { rows } = await client.query(
      `INSERT INTO invoices
         (serial_no, point_id, inv_date, shift_id, employee_id,
          inv_type, madf_type, table_no, person_count,
          service_percent, discount_percent,
          client_type, mem_id, mem_serial, mem_bar, mem_name, mem_rank,
          room_no, h_no, guest_name,
          status)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,'OPEN')
       RETURNING *`,
      [
        serial_no, point_id, effectiveInvDate, shift_id, employee_id,
        effectiveInvType, effectiveMadfType, table_no, person_count,
        effectiveServicePercent, effectiveDiscountPercent,
        effectiveClientType, mem_id, mem_serial, mem_bar, mem_name, mem_rank,
        resolvedRoomNo, resolvedHNo, guest_name,
      ],
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

/**
 * Update client type on an OPEN invoice:
 * - CIVILIAN (مدنى): standard customer, 0% member discount, 12% service charge, paid at cashier
 * - MEMBER   (مشترك): scans QR / Barcode from memb_bar + main_memb, sets member info & member discount %
 * - GUEST    (نزيل): links occupied room from hagz_tbl, sets madf_type = 2 (charged to room at Reception)
 */
export async function updateInvoiceClient(invoice_id, { client_type, barcode = null, room_no = null, h_no = null }) {
  return withTx(async (client) => {
    const inv = await assertEditable(client, invoice_id);
    const { rows: pts } = await client.query(
      `SELECT service_percent FROM points WHERE id = $1`,
      [inv.point_id],
    );
    const pointService = Number(pts[0]?.service_percent ?? 12);
    const effectiveServicePercent = pointService > 0 ? pointService : 12;

    if (client_type === 'MEMBER') {
      const member = await lookupMemberByCode(client, barcode);
      const { rows } = await client.query(
        `UPDATE invoices
            SET client_type      = 'MEMBER',
                inv_type         = 1,
                madf_type        = 1,
                mem_id           = $2,
                mem_serial       = $3,
                mem_bar          = $4,
                mem_name         = $5,
                mem_rank         = $6,
                discount_percent = $7,
                service_percent  = $8,
                room_no          = NULL,
                h_no             = NULL,
                guest_name       = NULL
          WHERE id = $1
          RETURNING *`,
        [
          invoice_id,
          member.mem_id,
          member.mem_serial,
          member.m_bar,
          member.mem_name,
          member.rank_name,
          Number(member.discount_percent || 0),
          effectiveServicePercent,
        ],
      );
      return recomputeTotals(client, rows[0]);
    }

    if (client_type === 'GUEST') {
      const room = await lookupOccupiedRoom(client, { room_no, h_no });
      const { rows } = await client.query(
        `UPDATE invoices
            SET client_type      = 'GUEST',
                inv_type         = 2,
                madf_type        = 2,
                room_no          = $2,
                h_no             = $3,
                guest_name       = $4,
                discount_percent = 0,
                service_percent  = $5,
                mem_id           = NULL,
                mem_serial       = NULL,
                mem_bar          = NULL,
                mem_name         = NULL,
                mem_rank         = NULL
          WHERE id = $1
          RETURNING *`,
        [invoice_id, room.room_no, room.h_no, room.guest_name, effectiveServicePercent],
      );
      return recomputeTotals(client, rows[0]);
    }

    if (client_type === 'CIVILIAN') {
      const { rows } = await client.query(
        `UPDATE invoices
            SET client_type      = 'CIVILIAN',
                inv_type         = 1,
                madf_type        = 1,
                discount_percent = 0,
                service_percent  = $2,
                mem_id           = NULL,
                mem_serial       = NULL,
                mem_bar          = NULL,
                mem_name         = NULL,
                mem_rank         = NULL,
                room_no          = NULL,
                h_no             = NULL,
                guest_name       = NULL
          WHERE id = $1
          RETURNING *`,
        [invoice_id, effectiveServicePercent],
      );
      return recomputeTotals(client, rows[0]);
    }

    throw new ApiError(400, 'INVALID_CLIENT_TYPE', 'client_type must be CIVILIAN, MEMBER, or GUEST');
  });
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
 * If the client is a Hotel Guest (نزيل — client_type = 'GUEST'), automatically posts
 * the invoice total to Reception's ROOM_ACCOUNT.REST_Q and CUST_REST tables.
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
    if (inv.client_type === 'GUEST' && (!inv.room_no || !inv.h_no)) {
      throw new ApiError(400, 'ROOM_REQUIRED', 'يجب تحديد غرفة النزيل قبل ترحيل الفاتورة للريسبشن');
    }
    if (inv.client_type === 'MEMBER' && !inv.mem_id) {
      throw new ApiError(400, 'MEMBER_REQUIRED', 'يجب مسح QR الكارنيه للمشترك قبل إغلاق الفاتورة');
    }

    // Check point min_charge invariant.
    const { rows: ptRows } = await client.query(
      `SELECT code, name, min_charge FROM points WHERE id = $1`,
      [inv.point_id],
    );
    const point = ptRows[0];
    const minCharge = Number(point?.min_charge ?? 0);
    if (minCharge > 0 && Number(inv.subtotal) < minCharge) {
      throw new ApiError(
        400,
        'BELOW_MIN_CHARGE',
        `subtotal (${inv.subtotal}) is below point minimum charge (${minCharge})`,
      );
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
    const closedInv = rows[0];

    // If Hotel Guest (نزيل), post restaurant charge to Reception (CUST_REST + ROOM_ACCOUNT.REST_Q)
    if (closedInv.client_type === 'GUEST' && closedInv.room_no && closedInv.h_no) {
      const { rows: shRows } = await client.query(
        `SELECT shift_kind FROM shifts WHERE id = $1`,
        [closedInv.shift_id],
      );
      const shiftTyp = shRows[0]?.shift_kind ?? 1;

      await client.query(
        `INSERT INTO cust_rest
           (invoice_id, serial_no, ser_no, point_code, point_name, inv_date, shift_typ,
            room_no, h_no, guest_name, inv_tot)
         VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
         ON CONFLICT (invoice_id) DO NOTHING`,
        [
          closedInv.id,
          closedInv.serial_no,
          closedInv.ser_no,
          point?.code ?? 1,
          point?.name ?? '',
          closedInv.inv_date,
          shiftTyp,
          closedInv.room_no,
          closedInv.h_no,
          closedInv.guest_name ?? '',
          closedInv.total,
        ],
      );

      const remNote = `فاتورة مطعم #${closedInv.ser_no} (${point?.name ?? ''})`;
      await client.query(
        `INSERT INTO room_account (h_no, room_no, r_date, price, rest_q, r_rem, updated_at)
         VALUES ($1, $2, $3, 0, $4, $5, now())
         ON CONFLICT (h_no, room_no, r_date)
         DO UPDATE SET
           rest_q     = room_account.rest_q + EXCLUDED.rest_q,
           r_rem      = CASE
                          WHEN room_account.r_rem IS NULL OR room_account.r_rem = '' THEN EXCLUDED.r_rem
                          ELSE room_account.r_rem || ' | ' || EXCLUDED.r_rem
                        END,
           updated_at = now()`,
        [closedInv.h_no, closedInv.room_no, closedInv.inv_date, closedInv.total, remNote],
      );
    }

    return closedInv;
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
    `SELECT id, serial_no, ser_no, status, total, client_type, mem_name, room_no, guest_name, created_at, paid_at
       FROM invoices WHERE shift_id = $1 ORDER BY serial_no`,
    [shift_id],
  );
  return rows;
}
