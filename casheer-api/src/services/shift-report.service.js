import { query } from '../db/pool.js';
import { ApiError } from '../middleware/error.js';

const SHIFT_NAMES = {
  1: 'صباحي',
  2: 'مسائي',
  3: 'ليلي',
};

/**
 * Compute full shift closing summary (`نموذج إغلاق وردية منفذ` — POINT_CLOSE)
 * Breakdown by:
 *   - Cash / Immediate invoices (إجمالي الفواتير النقدية):
 *       1. المدنى (CIVILIAN)
 *       2. المشترك (MEMBER)
 *   - Deferred / Room invoices (إجمالي الفواتير الآجلة):
 *       3. النزيل (GUEST — charged to hotel room at Reception)
 *   - Grand total (الإجمالي العام)
 *   - List of PAID invoices in the shift
 *   - List of Dispensed Items (الأصناف المنصرفة في الوردية)
 */
export async function getShiftCloseSummary(shift_id) {
  const { rows: shRows } = await query(
    `SELECT s.id, s.shift_date::text AS shift_date, s.shift_kind, s.started_at, s.closed_at,
            e.id AS employee_id, e.code AS employee_code, e.name AS employee_name, e.role AS employee_role,
            p.id AS point_id, p.code AS point_code, p.name AS point_name, p.service_percent
       FROM shifts s
       JOIN employees e ON e.id = s.employee_id
       JOIN points p    ON p.id = s.point_id
      WHERE s.id = $1`,
    [shift_id],
  );
  const shiftRow = shRows[0];
  if (!shiftRow) {
    throw new ApiError(404, 'SHIFT_NOT_FOUND', 'الوردية غير موجودة');
  }

  // Group PAID invoices by client_type (CIVILIAN, MEMBER, GUEST) for this shift (or same employee+point+date)
  const { rows: groupRows } = await query(
    `SELECT COALESCE(client_type, 'CIVILIAN') AS client_type,
            COUNT(*)::int                     AS count,
            COALESCE(SUM(subtotal), 0)::numeric(12,2)        AS subtotal,
            COALESCE(SUM(service_amount), 0)::numeric(12,2)  AS service_amount,
            COALESCE(SUM(discount_amount), 0)::numeric(12,2) AS discount_amount,
            COALESCE(SUM(total), 0)::numeric(12,2)           AS total
       FROM invoices
      WHERE status = 'PAID'
        AND (
          shift_id = $1
          OR (point_id = $2 AND inv_date = $3 AND (employee_id = $4 OR paid_by_employee_id = $4))
        )
      GROUP BY COALESCE(client_type, 'CIVILIAN')`,
    [shift_id, shiftRow.point_id, shiftRow.shift_date, shiftRow.employee_id],
  );

  const emptyBucket = () => ({
    count: 0,
    subtotal: '0.00',
    service_amount: '0.00',
    discount_amount: '0.00',
    total: '0.00',
  });

  const byClient = {
    CIVILIAN: emptyBucket(),
    MEMBER:   emptyBucket(),
    GUEST:    emptyBucket(),
  };

  for (const r of groupRows) {
    const key = r.client_type in byClient ? r.client_type : 'CIVILIAN';
    byClient[key] = {
      count:           Number(r.count),
      subtotal:        Number(r.subtotal).toFixed(2),
      service_amount:  Number(r.service_amount).toFixed(2),
      discount_amount: Number(r.discount_amount).toFixed(2),
      total:           Number(r.total).toFixed(2),
    };
  }

  const sumBuckets = (a, b) => ({
    count:           a.count + b.count,
    subtotal:        (Number(a.subtotal) + Number(b.subtotal)).toFixed(2),
    service_amount:  (Number(a.service_amount) + Number(b.service_amount)).toFixed(2),
    discount_amount: (Number(a.discount_amount) + Number(b.discount_amount)).toFixed(2),
    total:           (Number(a.total) + Number(b.total)).toFixed(2),
  });

  // Cash total = المدنى + المشترك
  const cash_total = sumBuckets(byClient.CIVILIAN, byClient.MEMBER);
  // Deferred total = النزيل (غرف الريسبشن)
  const deferred_total = { ...byClient.GUEST };
  // Grand total = Cash + Deferred
  const grand_total = sumBuckets(cash_total, deferred_total);

  // Count any still-OPEN or CANCELLED invoices in this shift
  const { rows: statusCounts } = await query(
    `SELECT status, COUNT(*)::int AS count
       FROM invoices
      WHERE shift_id = $1
      GROUP BY status`,
    [shift_id],
  );
  const open_invoices_count = statusCounts.find((s) => s.status === 'OPEN')?.count ?? 0;
  const cancelled_invoices_count = statusCounts.find((s) => s.status === 'CANCELLED')?.count ?? 0;

  // Detailed PAID invoices list for this shift
  const { rows: invoices } = await query(
    `SELECT id, serial_no, ser_no, inv_date::text AS inv_date,
            client_type, mem_id, mem_bar, mem_name, mem_rank,
            room_no, h_no, guest_name,
            table_no, person_count,
            subtotal, service_percent, service_amount,
            discount_percent, discount_amount, total,
            status, paid_at
       FROM invoices
      WHERE status = 'PAID'
        AND (
          shift_id = $1
          OR (point_id = $2 AND inv_date = $3 AND (employee_id = $4 OR paid_by_employee_id = $4))
        )
      ORDER BY ser_no ASC NULLS LAST, serial_no ASC`,
    [shift_id, shiftRow.point_id, shiftRow.shift_date, shiftRow.employee_id],
  );

  // Dispensed items in this shift (الأصناف المنصرفة بالوردية)
  const { rows: items_dispensed } = await query(
    `SELECT i.code AS item_code,
            i.name AS item_name,
            it.name AS type_name,
            il.unit_price::numeric(10,2) AS unit_price,
            SUM(il.qty)::numeric(10,3)   AS qty_sold,
            SUM(il.line_total)::numeric(12,2) AS total_sold
       FROM invoice_lines il
       JOIN invoices inv  ON inv.id = il.invoice_id
       JOIN items i       ON i.id   = il.item_id
       JOIN item_types it ON it.id  = i.type_id
      WHERE inv.status = 'PAID'
        AND (
          inv.shift_id = $1
          OR (inv.point_id = $2 AND inv.inv_date = $3 AND (inv.employee_id = $4 OR inv.paid_by_employee_id = $4))
        )
      GROUP BY i.code, i.name, it.name, il.unit_price
      ORDER BY i.code ASC`,
    [shift_id, shiftRow.point_id, shiftRow.shift_date, shiftRow.employee_id],
  );

  const items_total_qty = items_dispensed.reduce((acc, it) => acc + Number(it.qty_sold), 0);
  const items_subtotal  = items_dispensed.reduce((acc, it) => acc + Number(it.total_sold), 0).toFixed(2);

  return {
    shift: {
      id:         shiftRow.id,
      shift_date: shiftRow.shift_date,
      shift_kind: shiftRow.shift_kind,
      shift_name: SHIFT_NAMES[shiftRow.shift_kind] || String(shiftRow.shift_kind),
      started_at: shiftRow.started_at,
      closed_at:  shiftRow.closed_at,
    },
    employee: {
      id:   shiftRow.employee_id,
      code: shiftRow.employee_code,
      name: shiftRow.employee_name,
      role: shiftRow.employee_role,
    },
    point: {
      id:              shiftRow.point_id,
      code:            shiftRow.point_code,
      name:            shiftRow.point_name,
      service_percent: shiftRow.service_percent,
    },
    breakdown: {
      civilian:       byClient.CIVILIAN,
      member:         byClient.MEMBER,
      cash_total,
      guest:          byClient.GUEST,
      deferred_total,
      grand_total,
    },
    open_invoices_count,
    cancelled_invoices_count,
    invoices,
    items_dispensed: items_dispensed.map((it) => ({
      item_code:  it.item_code,
      item_name:  it.item_name,
      type_name:  it.type_name,
      unit_price: Number(it.unit_price).toFixed(2),
      qty_sold:   Number(it.qty_sold),
      total_sold: Number(it.total_sold).toFixed(2),
    })),
    items_total_qty,
    items_subtotal,
  };
}
