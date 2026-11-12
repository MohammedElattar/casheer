import { query, pool } from './pool.js';
import { hashPassword } from '../services/auth.service.js';

async function main() {
  console.log('[seed] starting');

  // Admin employee.
  const pw = await hashPassword('admin123');
  await query(
    `INSERT INTO employees (code, name, password_hash, role, active)
     VALUES ('admin','Administrator',$1,'ADMIN',TRUE)
     ON CONFLICT (code) DO NOTHING`,
    [pw],
  );
  const cashierPw = await hashPassword('cashier123');
  await query(
    `INSERT INTO employees (code, name, password_hash, role, active)
     VALUES ('100','كاشير 1',$1,'CASHIER',TRUE)
     ON CONFLICT (code) DO NOTHING`,
    [cashierPw],
  );

  // Point.
  await query(
    `INSERT INTO points (code, name, service_percent, min_charge, printer_name, weekday_mask, m_status)
     VALUES (1,'المطعم الرئيسي',10.00,0,'THERMAL-1',127,1)
     ON CONFLICT (code) DO NOTHING`,
  );

  // Item types.
  await query(
    `INSERT INTO item_types (code, name) VALUES
       (1,'مشروبات'),
       (2,'مأكولات'),
       (3,'حلويات')
     ON CONFLICT (code) DO NOTHING`,
  );

  // Items.
  await query(
    `WITH t AS (SELECT code, id FROM item_types)
     INSERT INTO items (code, name, type_id, default_price)
     VALUES
       (101,'شاي',       (SELECT id FROM t WHERE code=1), 10.00),
       (102,'قهوة',      (SELECT id FROM t WHERE code=1), 15.00),
       (103,'عصير برتقال',(SELECT id FROM t WHERE code=1), 20.00),
       (201,'فول',       (SELECT id FROM t WHERE code=2), 25.00),
       (202,'طعمية',     (SELECT id FROM t WHERE code=2), 20.00),
       (203,'جبنة',      (SELECT id FROM t WHERE code=2), 30.00),
       (301,'بقلاوة',    (SELECT id FROM t WHERE code=3), 35.00),
       (302,'كنافة',     (SELECT id FROM t WHERE code=3), 40.00)
     ON CONFLICT (code) DO NOTHING`,
  );

  // Give cashier 100 permission at point 1, shift kind 1.
  await query(
    `INSERT INTO employee_point_permissions (employee_id, point_id, shift_kind)
     SELECT e.id, p.id, 1
       FROM employees e, points p
      WHERE e.code = '100' AND p.code = 1
     ON CONFLICT DO NOTHING`,
  );

  console.log('[seed] done');
  console.log('[seed] login with code=admin pw=admin123 or code=100 pw=cashier123');
  await pool.end();
}

main().catch((e) => { console.error(e); process.exit(1); });
