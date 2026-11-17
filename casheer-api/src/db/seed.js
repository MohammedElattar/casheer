import { query, pool } from './pool.js';
import { hashPassword } from '../services/auth.service.js';

async function main() {
  console.log('[seed] starting');

  const adminPw   = await hashPassword('admin123');
  const cashierPw = await hashPassword('cashier123');
  const empPw     = await hashPassword('123456');

  // Employees.
  await query(
    `INSERT INTO employees (code, name, password_hash, role, active) VALUES
       ('admin', 'Administrator',         $1, 'ADMIN',   TRUE),
       ('333',   'Admin',                 $1, 'ADMIN',   TRUE),
       ('100',   'كاشير المطعم الرئيسي',   $2, 'CASHIER', TRUE),
       ('1001',  'أحمد محمود',            $3, 'CASHIER', TRUE),
       ('1002',  'محمد علي',              $3, 'CASHIER', TRUE),
       ('1003',  'حسن إبراهيم',           $3, 'CASHIER', TRUE),
       ('1004',  'موظف بدون منافذ',       $3, 'CASHIER', TRUE),
       ('1005',  'كاشير تيك اواى بيتزا',   $3, 'CASHIER', TRUE)
     ON CONFLICT (code) DO UPDATE
       SET name = EXCLUDED.name,
           active = TRUE`,
    [adminPw, cashierPw, empPw],
  );

  // Points (Ports 1..6) — 12% service charge (خدمة 12%).
  await query(
    `INSERT INTO points (code, name, service_percent, min_charge, printer_name, weekday_mask, m_status) VALUES
       (1, 'المطعم الرئيسي',         12.00, 0, 'THERMAL-1', 127, 1),
       (2, 'تيك اواى وجبات الدار',   12.00, 0, 'STAR-1',    127, 1),
       (3, 'كافيتريا الشاطئ',        12.00, 0, 'THERMAL-2', 127, 1),
       (4, 'مطعم الأسماك',           12.00, 0, 'THERMAL-3', 127, 1),
       (5, 'تيك اواى بيتزا وحلويات',  12.00, 0, 'STAR-2',    127, 1),
       (6, 'استقبال الفندق',         12.00, 0, 'THERMAL-4', 127, 1)
     ON CONFLICT (code) DO UPDATE
       SET name = EXCLUDED.name,
           service_percent = EXCLUDED.service_percent,
           active = TRUE`,
  );

  // Item types.
  await query(
    `INSERT INTO item_types (code, name) VALUES
       (1,'مشروبات'),
       (2,'مأكولات'),
       (3,'حلويات'),
       (4,'بيتزا وتيك أواي')
     ON CONFLICT (code) DO NOTHING`,
  );

  // Items.
  await query(
    `WITH t AS (SELECT code, id FROM item_types)
     INSERT INTO items (code, name, type_id, default_price)
     VALUES
       (101,'شاي',                (SELECT id FROM t WHERE code=1), 10.00),
       (102,'قهوة',               (SELECT id FROM t WHERE code=1), 15.00),
       (103,'عصير برتقال',        (SELECT id FROM t WHERE code=1), 20.00),
       (201,'فول',                (SELECT id FROM t WHERE code=2), 25.00),
       (202,'طعمية',              (SELECT id FROM t WHERE code=2), 20.00),
       (203,'جبنة',               (SELECT id FROM t WHERE code=2), 30.00),
       (301,'بقلاوة',             (SELECT id FROM t WHERE code=3), 35.00),
       (302,'كنافة',              (SELECT id FROM t WHERE code=3), 40.00),
       (401,'بيتزا مارجريتا',     (SELECT id FROM t WHERE code=4), 85.00),
       (402,'بيتزا سوبر سوبريم',  (SELECT id FROM t WHERE code=4), 110.00),
       (403,'بيتزا سي فود المحروسة',(SELECT id FROM t WHERE code=4), 140.00)
     ON CONFLICT (code) DO NOTHING`,
  );

  // Members (مشتركين — MAIN_MEMB & MEMB_BAR for QR Card Scanner Device)
  await query(
    `INSERT INTO main_memb (mem_serial, mem_name, rank_name, tel, mobil, active) VALUES
       (1001, 'لواء بحري / طارق عبد الرحمن', 'لواء بحري',   '035401122', '01001112233', TRUE),
       (1002, 'عميد بحري / خالد مصطفى',     'عميد بحري',   '035403344', '01002223344', TRUE),
       (1003, 'عقيد بحري / عمرو الشناوي',    'عقيد بحري',   '035405566', '01223334455', TRUE),
       (1004, 'مقدم بحري / كريم الجندي',     'مقدم بحري',   '035407788', '01114445566', TRUE)
     ON CONFLICT (mem_serial) DO UPDATE
       SET mem_name  = EXCLUDED.mem_name,
           rank_name = EXCLUDED.rank_name,
           active    = TRUE`,
  );

  await query(
    `INSERT INTO memb_bar (m_bar, mem_serial, mem_id, m_kind, m_year, m_typ, discount_percent, flg_ok) VALUES
       ('QR-MEM-1001', 1001, 20261001, 1, 2026, 1, 15.00, 1),
       ('QR-MEM-1002', 1002, 20261002, 1, 2026, 1, 15.00, 1),
       ('QR-MEM-1003', 1003, 20261003, 1, 2026, 1, 10.00, 1),
       ('QR-MEM-1004', 1004, 20261004, 2, 2026, 1, 10.00, 1)
     ON CONFLICT (m_bar) DO UPDATE
       SET mem_serial       = EXCLUDED.mem_serial,
           mem_id           = EXCLUDED.mem_id,
           discount_percent = EXCLUDED.discount_percent,
           flg_ok           = 1`,
  );

  // Hotel Rooms & Active Reservations (نزلاء الفندق — ROOMS, HAGZ_TBL, ROOM_ACCOUNT)
  await query(
    `INSERT INTO rooms (room_no, level_code, room_type, status) VALUES
       (101, 1, 'جناح ملكي إطلالة بحر', 1),
       (205, 2, 'غرفة مزدوجة مميزة',    1),
       (304, 3, 'شاليه عائلي',         1),
       (410, 4, 'غرفة فردية',          1)
     ON CONFLICT (room_no) DO UPDATE
       SET room_type = EXCLUDED.room_type,
           status    = 1`,
  );

  await query(
    `INSERT INTO hagz_tbl (h_no, h_name, room_no, h_from, h_to, tel_no, eskan_typ, out_flag) VALUES
       ('H-2026-101', 'لواء / محمود عبد العزيز',   101, CURRENT_DATE - 1, CURRENT_DATE + 4, '01005556677', 1, 0),
       ('H-2026-205', 'عميد / شريف الدسوقي',       205, CURRENT_DATE - 2, CURRENT_DATE + 2, '01226667788', 1, 0),
       ('H-2026-304', 'دكتور / هاني سليم وعائلته', 304, CURRENT_DATE,     CURRENT_DATE + 5, '01118889900', 2, 0),
       ('H-2026-410', 'مهندس / سامح فوزي',         410, CURRENT_DATE,     CURRENT_DATE + 3, '01009990011', 2, 0)
     ON CONFLICT (h_no) DO UPDATE
       SET h_name   = EXCLUDED.h_name,
           room_no  = EXCLUDED.room_no,
           out_flag = 0`,
  );

  await query(
    `INSERT INTO room_account (h_no, room_no, r_date, price, rest_q, r_rem) VALUES
       ('H-2026-101', 101, CURRENT_DATE, 1200.00, 0.00, 'إقامة غرفة 101'),
       ('H-2026-205', 205, CURRENT_DATE,  850.00, 0.00, 'إقامة غرفة 205'),
       ('H-2026-304', 304, CURRENT_DATE, 1500.00, 0.00, 'إقامة شاليه 304'),
       ('H-2026-410', 410, CURRENT_DATE,  650.00, 0.00, 'إقامة غرفة 410')
     ON CONFLICT (h_no, room_no, r_date) DO NOTHING`,
  );

  // Employee -> Port assignments:
  // - admin : Ports 1..6
  // - 333   : Ports 1, 2, 3
  // - 100   : Port 1 (المطعم الرئيسي — يستقبل من الكابتن أوردر فقط)
  // - 1001  : Ports 1, 3, 5
  // - 1002  : Ports 2, 4
  // - 1003  : Ports 1, 2, 6
  // - 1004  : No ports assigned
  // - 1005  : Port 5 (كاشير تيك اواى بيتزا وحلويات — له صلاحية الأصناف مباشرة بدون كابتن أوردر)
  const assignments = [
    { empCode: 'admin', pointCodes: [1, 2, 3, 4, 5, 6] },
    { empCode: '333',   pointCodes: [1, 2, 3] },
    { empCode: '100',   pointCodes: [1] },
    { empCode: '1001',  pointCodes: [1, 3, 5] },
    { empCode: '1002',  pointCodes: [2, 4] },
    { empCode: '1003',  pointCodes: [1, 2, 6] },
    { empCode: '1005',  pointCodes: [5] },
  ];

  for (const { empCode, pointCodes } of assignments) {
    await query(
      `DELETE FROM employee_point_permissions
        WHERE employee_id = (SELECT id FROM employees WHERE code = $1)`,
      [empCode],
    );
    for (const ptCode of pointCodes) {
      for (const shiftKind of [1, 2, 3]) {
        await query(
          `INSERT INTO employee_point_permissions (employee_id, point_id, shift_kind)
           SELECT e.id, p.id, $3
             FROM employees e, points p
            WHERE e.code = $1 AND p.code = $2
           ON CONFLICT DO NOTHING`,
          [empCode, ptCode, shiftKind],
        );
      }
    }
  }

  // Ensure 1004 has 0 assigned ports.
  await query(
    `DELETE FROM employee_point_permissions
      WHERE employee_id = (SELECT id FROM employees WHERE code = '1004')`,
  );

  console.log('[seed] done');
  await pool.end();
}

main().catch((e) => { console.error(e); process.exit(1); });
