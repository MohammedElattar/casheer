import { Router } from 'express';
import { query } from '../db/pool.js';
import { requireAuth } from '../middleware/auth.js';
import { ApiError } from '../middleware/error.js';

const router = Router();
router.use(requireAuth);

// List active members (for quick QR simulator / lookup)
router.get('/members', async (_req, res, next) => {
  try {
    const { rows } = await query(
      `SELECT b.m_bar, b.mem_serial, b.mem_id, b.m_kind, b.m_year, b.m_typ,
              b.discount_percent, b.flg_ok,
              m.mem_name, m.rank_name, m.tel, m.mobil
         FROM memb_bar b
         JOIN main_memb m ON m.mem_serial = b.mem_serial
        WHERE m.active = TRUE AND b.flg_ok = 1
        ORDER BY b.mem_serial`,
    );
    res.json({ members: rows });
  } catch (e) { next(e); }
});

// Scan / lookup a member card by QR / Barcode (m_bar), mem_id, or mem_serial
router.get('/members/scan', async (req, res, next) => {
  try {
    const raw = String(req.query.code || '').trim();
    if (!raw) {
      throw new ApiError(400, 'BARCODE_REQUIRED', 'أدخل باركود أو امسح QR كارنيه المشترك');
    }
    const numericCode = /^\d+$/.test(raw) ? Number(raw) : -1;
    const { rows } = await query(
      `SELECT b.m_bar, b.mem_serial, b.mem_id, b.m_kind, b.m_year, b.m_typ,
              b.discount_percent, b.flg_ok,
              m.mem_name, m.rank_name, m.tel, m.mobil
         FROM memb_bar b
         JOIN main_memb m ON m.mem_serial = b.mem_serial
        WHERE m.active = TRUE
          AND b.flg_ok = 1
          AND (UPPER(b.m_bar) = UPPER($1) OR b.mem_id = $2 OR b.mem_serial = $2)
        LIMIT 1`,
      [raw, numericCode],
    );
    if (!rows[0]) {
      throw new ApiError(404, 'MEMBER_NOT_FOUND', 'كارنيه المشترك غير مسجل أو غير ساري الصلاحية');
    }
    res.json({ member: rows[0] });
  } catch (e) { next(e); }
});

// List occupied hotel rooms (HAGZ_TBL + ROOMS + ROOM_ACCOUNT summary)
router.get('/rooms', async (_req, res, next) => {
  try {
    const { rows } = await query(
      `SELECT h.h_no, h.h_name AS guest_name, h.room_no, h.h_from::text AS h_from, h.h_to::text AS h_to,
              h.tel_no, h.eskan_typ,
              r.level_code, r.room_type,
              COALESCE((
                SELECT SUM(ra.rest_q)
                  FROM room_account ra
                 WHERE ra.h_no = h.h_no AND ra.room_no = h.room_no
              ), 0)::numeric(12,2) AS reception_rest_total
         FROM hagz_tbl h
         JOIN rooms r ON r.room_no = h.room_no
        WHERE h.out_flag = 0 AND r.status = 1
        ORDER BY h.room_no`,
    );
    res.json({ rooms: rows });
  } catch (e) { next(e); }
});

// Reception restaurant folio (CUST_REST + ROOM_ACCOUNT)
router.get('/reception-folio', async (req, res, next) => {
  try {
    const params = [];
    let where = '';
    if (req.query.room_no) {
      params.push(Number(req.query.room_no));
      where = `WHERE cr.room_no = $1`;
    }
    const { rows: charges } = await query(
      `SELECT cr.*
         FROM cust_rest cr
         ${where}
        ORDER BY cr.created_at DESC
        LIMIT 100`,
      params,
    );
    const { rows: accounts } = await query(
      `SELECT ra.h_no, ra.room_no, ra.r_date::text AS r_date, ra.price, ra.rest_q, ra.r_rem,
              h.h_name AS guest_name
         FROM room_account ra
         JOIN hagz_tbl h ON h.h_no = ra.h_no
        WHERE h.out_flag = 0
        ORDER BY ra.room_no, ra.r_date DESC`,
    );
    res.json({ charges, room_accounts: accounts });
  } catch (e) { next(e); }
});

export default router;
