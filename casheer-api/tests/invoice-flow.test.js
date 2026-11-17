// End-to-end API test for the full invoice lifecycle.
// Requires:
//   - DB running (docker compose up -d db)
//   - npm run migrate && npm run seed executed first
// Run: npm test
import test from 'node:test';
import assert from 'node:assert/strict';
import request from 'supertest';
import { createApp } from '../src/app.js';
import { pool } from '../src/db/pool.js';
import { formatLocalDate, getTodayAndYesterday } from '../src/util/money.js';

const app = createApp();

async function loginAs(code, password) {
  const r = await request(app).post('/api/v1/auth/login').send({ code, password });
  assert.equal(r.status, 200, `login as ${code} failed: ${r.text}`);
  return r.body;
}

async function cleanSlate() {
  // Wipe only invoices + lines + shifts + captain orders so seed data (points, items, employees) stays.
  await pool.query(`DELETE FROM cust_rest`);
  await pool.query(`UPDATE room_account SET rest_q = 0`);
  await pool.query(`DELETE FROM m2_inv_details`);
  await pool.query(`DELETE FROM m2_inv`);
  await pool.query(`DELETE FROM m2_serial_reservation`);
  await pool.query(`DELETE FROM invoice_lines`);
  await pool.query(`DELETE FROM invoices`);
  await pool.query(`DELETE FROM shifts`);
  await pool.query(`DELETE FROM refresh_tokens`);
}

test('invoice happy path: open → add line → close → pay → ser_no assigned', async (t) => {
  await cleanSlate();
  const { access } = await loginAs('100', 'cashier123');
  const auth = { Authorization: `Bearer ${access}` };

  // Pick first point and first item
  const { body: ptBody } = await request(app).get('/api/v1/points').set(auth);
  const point = ptBody.points[0];
  assert.ok(point, 'no point seeded');

  // Open shift
  const todayIso = formatLocalDate();
  const { body: shiftBody, status: shiftStatus } =
    await request(app).post('/api/v1/shifts').set(auth).send({
      point_id: point.id, shift_date: todayIso, shift_kind: 1,
    });
  assert.equal(shiftStatus, 201, `open shift failed: ${JSON.stringify(shiftBody)}`);
  const shift = shiftBody.shift;

  // Open invoice
  const { body: invBody, status: invStatus } =
    await request(app).post('/api/v1/invoices').set(auth).send({
      point_id: point.id, inv_date: todayIso, shift_id: shift.id,
      inv_type: 1, madf_type: 1,
    });
  assert.equal(invStatus, 201, `open invoice failed: ${JSON.stringify(invBody)}`);
  const inv = invBody.invoice;
  assert.equal(inv.status, 'OPEN');
  assert.equal(inv.ser_no, null);
  assert.ok(inv.serial_no >= 1);

  // Get items for this point
  const { body: itemsBody } = await request(app).get(`/api/v1/items?point_id=${point.id}`).set(auth);
  const item = itemsBody.items[0];
  assert.ok(item, 'no item seeded');

  // Add 3 of this item
  const addR = await request(app).post(`/api/v1/invoices/${inv.id}/lines`).set(auth).send({
    item_id: item.id, qty: 3,
  });
  assert.equal(addR.status, 201);
  assert.equal(Number(addR.body.invoice.subtotal),  Number(item.price) * 3);
  assert.equal(Number(addR.body.line.qty),          3);

  // Close
  const closeR = await request(app).post(`/api/v1/invoices/${inv.id}/close`).set(auth);
  assert.equal(closeR.status, 200);
  assert.equal(closeR.body.invoice.status, 'PAID');
  assert.equal(closeR.body.invoice.ser_no, 1);     // first paid for this (point, date)

  // Attempt to add another line to the paid invoice -> should fail with INVOICE_LOCKED
  const lockedR = await request(app).post(`/api/v1/invoices/${inv.id}/lines`).set(auth).send({
    item_id: item.id, qty: 1,
  });
  assert.equal(lockedR.status, 400);
  assert.equal(lockedR.body.error.code, 'INVOICE_LOCKED');
});

test('floor-rounding: service and discount use FLOOR(x*100)/100', async (t) => {
  await cleanSlate();
  const { access } = await loginAs('100', 'cashier123');
  const auth = { Authorization: `Bearer ${access}` };
  const todayIso = formatLocalDate();
  const { body: ptBody } = await request(app).get('/api/v1/points').set(auth);
  const point = ptBody.points[0];
  const { body: shiftBody } = await request(app).post('/api/v1/shifts').set(auth).send({
    point_id: point.id, shift_date: todayIso, shift_kind: 1,
  });
  const { body: invBody } = await request(app).post('/api/v1/invoices').set(auth).send({
    point_id: point.id, inv_date: todayIso, shift_id: shiftBody.shift.id,
  });
  const inv = invBody.invoice;

  // Pick an item with odd-looking pricing
  const { body: itemsBody } = await request(app).get(`/api/v1/items?point_id=${point.id}`).set(auth);
  const item = itemsBody.items.find((i) => Number(i.price) > 0);

  // Force subtotal = 123.45 by adding a quantity
  const qty = 123.45 / Number(item.price);
  await request(app).post(`/api/v1/invoices/${inv.id}/lines`).set(auth).send({
    item_id: item.id, qty, unit_price_override: Number(item.price),
  });

  // Apply 5% discount (should produce floor(sub * 0.05 * 100)/100)
  const discR = await request(app).patch(`/api/v1/invoices/${inv.id}/discount`).set(auth).send({
    discount_percent: 5,
  });
  assert.equal(discR.status, 200);
  const res = discR.body.invoice;
  // service_percent is 12 from seed
  const sub = Number(res.subtotal);
  const svcPer = Number(res.service_percent);
  assert.equal(svcPer, 12);
  const svc = Math.floor(sub * svcPer / 100 * 100) / 100;
  const dsc = Math.floor(sub * 5  / 100 * 100) / 100;
  const tot = Math.floor((sub + svc - dsc) * 100) / 100;
  assert.equal(Number(res.service_amount),  svc);
  assert.equal(Number(res.discount_amount), dsc);
  assert.equal(Number(res.total),           tot);
});

test('dual counter: ser_no is per-point-per-date for PAID invoices only', async (t) => {
  await cleanSlate();
  const { access } = await loginAs('100', 'cashier123');
  const auth = { Authorization: `Bearer ${access}` };
  const todayIso = formatLocalDate();
  const { body: ptBody } = await request(app).get('/api/v1/points').set(auth);
  const point = ptBody.points[0];
  const { body: shiftBody } = await request(app).post('/api/v1/shifts').set(auth).send({
    point_id: point.id, shift_date: todayIso, shift_kind: 1,
  });
  const { body: itemsBody } = await request(app).get(`/api/v1/items?point_id=${point.id}`).set(auth);
  const item = itemsBody.items[0];

  // 3 invoices: A paid, B open, C paid
  async function openAndAdd() {
    const { body } = await request(app).post('/api/v1/invoices').set(auth).send({
      point_id: point.id, inv_date: todayIso, shift_id: shiftBody.shift.id,
    });
    await request(app).post(`/api/v1/invoices/${body.invoice.id}/lines`).set(auth).send({
      item_id: item.id, qty: 1,
    });
    return body.invoice;
  }
  const A = await openAndAdd();
  const B = await openAndAdd();
  const C = await openAndAdd();
  assert.deepEqual([A.serial_no, B.serial_no, C.serial_no], [1, 2, 3]);

  const { body: closeA } = await request(app).post(`/api/v1/invoices/${A.id}/close`).set(auth);
  const { body: closeC } = await request(app).post(`/api/v1/invoices/${C.id}/close`).set(auth);
  assert.equal(closeA.invoice.ser_no, 1);
  assert.equal(closeC.invoice.ser_no, 2);   // B is open, so C gets ser_no=2 not 3
});

test('employee-based assigned ports: lookup + backend port validation + session binding', async () => {
  await cleanSlate();

  // 1. Dynamic lookup of assigned ports per employee
  const r1001 = await request(app).get('/api/v1/auth/employee-ports/1001');
  assert.equal(r1001.status, 200);
  assert.deepEqual(r1001.body.points.map((p) => p.code), [1, 3, 5]);

  const r1002 = await request(app).get('/api/v1/auth/employee-ports/1002');
  assert.equal(r1002.status, 200);
  assert.deepEqual(r1002.body.points.map((p) => p.code), [2, 4]);

  const r1003 = await request(app).get('/api/v1/auth/employee-ports/1003');
  assert.equal(r1003.status, 200);
  assert.deepEqual(r1003.body.points.map((p) => p.code), [1, 2, 6]);

  const r1004 = await request(app).get('/api/v1/auth/employee-ports/1004');
  assert.equal(r1004.status, 200);
  assert.deepEqual(r1004.body.points, []);

  // 2. Employee 1001 cannot log into unassigned Port 2
  const port2 = r1002.body.points.find((p) => p.code === 2);
  const forbiddenLogin = await request(app).post('/api/v1/auth/login').send({
    code: '1001',
    password: '123456',
    point_id: port2.id,
    shift_kind: 1,
  });
  assert.equal(forbiddenLogin.status, 403);
  assert.equal(forbiddenLogin.body.error.code, 'PORT_NOT_ASSIGNED');

  // 3. Employee 1004 (no assigned ports) cannot log in
  const noPortLogin = await request(app).post('/api/v1/auth/login').send({
    code: '1004',
    password: '123456',
  });
  assert.equal(noPortLogin.status, 403);
  assert.equal(noPortLogin.body.error.code, 'NO_ASSIGNED_PORTS');

  // 4. Employee 1001 logs into assigned Port 3 -> session stores point + shift
  const port3 = r1001.body.points.find((p) => p.code === 3);
  const okLogin = await request(app).post('/api/v1/auth/login').send({
    code: '1001',
    password: '123456',
    point_id: port3.id,
    shift_kind: 1,
  });
  assert.equal(okLogin.status, 200);
  assert.equal(okLogin.body.point.code, 3);
  assert.equal(okLogin.body.shift.point_id, port3.id);

  // 5. /auth/me and /points reflect only employee 1001's session & assigned ports
  const auth = { Authorization: `Bearer ${okLogin.body.access}` };
  const me = await request(app).get('/api/v1/auth/me').set(auth);
  assert.equal(me.status, 200);
  assert.equal(me.body.point.code, 3);

  const pts = await request(app).get('/api/v1/points').set(auth);
  assert.deepEqual(pts.body.points.map((p) => p.code), [1, 3, 5]);
});

test('night shift date handling: yesterday allowed ONLY for night shift (3) and enforced across invoices', async () => {
  await cleanSlate();
  const { today, yesterday } = getTodayAndYesterday();

  const r1001 = await request(app).get('/api/v1/auth/employee-ports/1001');
  const port1 = r1001.body.points.find((p) => p.code === 1);

  // 1. Normal shift (shift_kind = 1) with yesterday's date must be rejected
  const badNormalLogin = await request(app).post('/api/v1/auth/login').send({
    code: '1001',
    password: '123456',
    point_id: port1.id,
    shift_kind: 1,
    shift_date: yesterday,
  });
  assert.equal(badNormalLogin.status, 400);
  assert.equal(badNormalLogin.body.error.code, 'INVALID_SHIFT_DATE');

  // 2. Night shift (shift_kind = 3) with arbitrary past date (e.g. 2020-01-01) must be rejected
  const badArbitraryNightLogin = await request(app).post('/api/v1/auth/login').send({
    code: '1001',
    password: '123456',
    point_id: port1.id,
    shift_kind: 3,
    shift_date: '2020-01-01',
  });
  assert.equal(badArbitraryNightLogin.status, 400);
  assert.equal(badArbitraryNightLogin.body.error.code, 'INVALID_SHIFT_DATE');

  // 3. Night shift (shift_kind = 3) with yesterday's date succeeds
  const okNightLogin = await request(app).post('/api/v1/auth/login').send({
    code: '1001',
    password: '123456',
    point_id: port1.id,
    shift_kind: 3,
    shift_date: yesterday,
  });
  assert.equal(okNightLogin.status, 200);
  const shift = okNightLogin.body.shift;
  assert.equal(shift.shift_kind, 3);
  assert.equal(String(shift.shift_date).slice(0, 10), yesterday);

  const auth = { Authorization: `Bearer ${okNightLogin.body.access}` };

  // 4. Opening an invoice on this night shift with today's date (mismatching shift_date) is rejected
  const badInv = await request(app).post('/api/v1/invoices').set(auth).send({
    point_id: port1.id,
    inv_date: today,
    shift_id: shift.id,
  });
  assert.equal(badInv.status, 400);
  assert.equal(badInv.body.error.code, 'SHIFT_DATE_MISMATCH');

  // 5. Opening an invoice on this night shift with yesterday's working date succeeds and records under yesterday
  const okInv = await request(app).post('/api/v1/invoices').set(auth).send({
    point_id: port1.id,
    inv_date: yesterday,
    shift_id: shift.id,
  });
  assert.equal(okInv.status, 201);
  assert.equal(String(okInv.body.invoice.inv_date).slice(0, 10), yesterday);
});

test('captain order flow: M2_INV + M2_INV_DETAILS trigger auto-creates OPEN invoice, appends to same table, cancels item, and cashier closes bill', async () => {
  await cleanSlate();
  const { today } = getTodayAndYesterday();

  const { access, point } = await loginAs('100', 'cashier123');
  const auth = { Authorization: `Bearer ${access}` };

  const { body: itemsBody } = await request(app)
    .get(`/api/v1/items?point_id=${point.id}`)
    .set(auth);
  const item1 = itemsBody.items[0];
  const item2 = itemsBody.items[1];

  // 1. Captain submits order on Table #7 with 2 of item1 and 1 of item2
  const capRes1 = await request(app)
    .post('/api/v1/captain-orders')
    .set(auth)
    .send({
      point_id: point.id,
      point_code: point.code,
      inv_date: today,
      shift_type: 1,
      table_number: 7,
      noofperson: 4,
      remarks: 'ترابيزة التراس',
      items: [
        { good_code: item1.code, quantity: 2, remarks: 'بدون سكر' },
        { good_code: item2.code, quantity: 1, remarks: 'سخن' },
      ],
    });
  assert.equal(capRes1.status, 201, `captain order failed: ${capRes1.text}`);
  assert.equal(capRes1.body.m2_order.inv_number, 1);
  assert.equal(capRes1.body.invoice.status, 'OPEN');
  assert.equal(capRes1.body.invoice.serial_no, 1);
  assert.equal(capRes1.body.invoice.ser_no, null);
  assert.equal(capRes1.body.invoice.table_no, 7);
  assert.equal(capRes1.body.invoice.person_count, 4);
  assert.equal(capRes1.body.lines.length, 2);
  assert.equal(capRes1.body.m2_details[0].inv_i_serial, 1);
  assert.equal(capRes1.body.m2_details[1].inv_i_serial, 2);

  const invoiceId = capRes1.body.invoice.id;

  // 2. Captain submits a second order on the same open Table #7 -> appends to same OPEN invoice!
  const capRes2 = await request(app)
    .post('/api/v1/captain-orders')
    .set(auth)
    .send({
      point_code: point.code,
      inv_date: today,
      shift_type: 1,
      table_number: 7,
      items: [
        { good_code: item1.code, quantity: 1, remarks: 'إضافي' },
      ],
    });
  assert.equal(capRes2.status, 201);
  assert.equal(capRes2.body.invoice.id, invoiceId);
  assert.equal(capRes2.body.lines.length, 3);

  // 3. Captain cancels line 1 of the second order via M2_INV_DETAILS -> removes from invoice_lines & recomputes
  const cancelDetailRes = await request(app)
    .patch(`/api/v1/captain-orders/${capRes2.body.m2_order.inv_serial}/details/1/cancel`)
    .set(auth);
  assert.equal(cancelDetailRes.status, 200);
  assert.equal(cancelDetailRes.body.lines.length, 2);

  // 4. Cashier lists OPEN invoices on this point and sees Table #7 marked as is_captain_order
  const openList = await request(app)
    .get(`/api/v1/invoices?point_id=${point.id}&inv_date=${today}&status=OPEN`)
    .set(auth);
  assert.equal(openList.status, 200);
  assert.equal(openList.body.invoices.length, 1);
  assert.equal(openList.body.invoices[0].table_no, 7);
  assert.equal(openList.body.invoices[0].is_captain_order, true);
  assert.equal(openList.body.invoices[0].lines_count, 2);

  // 5. Cashier closes (pays) the invoice -> status becomes PAID and ser_no = 1 is assigned
  const closeRes = await request(app)
    .post(`/api/v1/invoices/${invoiceId}/close`)
    .set(auth);
  assert.equal(closeRes.status, 200);
  assert.equal(closeRes.body.invoice.status, 'PAID');
  assert.equal(closeRes.body.invoice.ser_no, 1);
});

test('3 client types (مدنى / مشترك QR scan / نزيل Room Reception) + 12% service charge', async () => {
  await cleanSlate();
  const { today } = getTodayAndYesterday();

  const { access, point, shift } = await loginAs('100', 'cashier123');
  const auth = { Authorization: `Bearer ${access}` };

  const { body: itemsBody } = await request(app)
    .get(`/api/v1/items?point_id=${point.id}`)
    .set(auth);
  const item = itemsBody.items[0]; // 10.00 EGP

  // 1. Scan member QR card endpoint
  const scanRes = await request(app)
    .get('/api/v1/clients/members/scan?code=QR-MEM-1001')
    .set(auth);
  assert.equal(scanRes.status, 200);
  assert.equal(scanRes.body.member.m_bar, 'QR-MEM-1001');
  assert.equal(Number(scanRes.body.member.discount_percent), 15);

  // 2. Open invoice as CIVILIAN (مدنى), add 100 EGP subtotal -> 12% service = 112.00 total
  const civOpen = await request(app)
    .post('/api/v1/invoices')
    .set(auth)
    .send({
      point_id: point.id,
      inv_date: today,
      shift_id: shift.id,
      client_type: 'CIVILIAN',
    });
  assert.equal(civOpen.status, 201);
  const invId = civOpen.body.invoice.id;
  assert.equal(civOpen.body.invoice.client_type, 'CIVILIAN');
  assert.equal(Number(civOpen.body.invoice.service_percent), 12);

  const addLineRes = await request(app)
    .post(`/api/v1/invoices/${invId}/lines`)
    .set(auth)
    .send({ item_id: item.id, qty: 10, unit_price_override: 10 });
  assert.equal(addLineRes.status, 201);
  assert.equal(Number(addLineRes.body.invoice.subtotal), 100);
  assert.equal(Number(addLineRes.body.invoice.service_amount), 12);
  assert.equal(Number(addLineRes.body.invoice.total), 112);

  // 3. Switch invoice client to MEMBER (مشترك) by scanning QR-MEM-1001 -> 15% member discount + 12% service => 97.00
  const memPatch = await request(app)
    .patch(`/api/v1/invoices/${invId}/client`)
    .set(auth)
    .send({ client_type: 'MEMBER', barcode: 'QR-MEM-1001' });
  assert.equal(memPatch.status, 200);
  assert.equal(memPatch.body.invoice.client_type, 'MEMBER');
  assert.equal(memPatch.body.invoice.mem_bar, 'QR-MEM-1001');
  assert.equal(Number(memPatch.body.invoice.service_percent), 12);
  assert.equal(Number(memPatch.body.invoice.discount_percent), 15);
  assert.equal(Number(memPatch.body.invoice.service_amount), 12);
  assert.equal(Number(memPatch.body.invoice.discount_amount), 15);
  assert.equal(Number(memPatch.body.invoice.total), 97);

  // 4. Switch invoice client to GUEST (نزيل) on Room #101 -> madf_type = 2, 12% service, total = 112.00, close -> posts to Reception (ROOM_ACCOUNT.REST_Q & CUST_REST)
  const guestPatch = await request(app)
    .patch(`/api/v1/invoices/${invId}/client`)
    .set(auth)
    .send({ client_type: 'GUEST', room_no: 101 });
  assert.equal(guestPatch.status, 200);
  assert.equal(guestPatch.body.invoice.client_type, 'GUEST');
  assert.equal(guestPatch.body.invoice.room_no, 101);
  assert.equal(guestPatch.body.invoice.h_no, 'H-2026-101');
  assert.equal(guestPatch.body.invoice.madf_type, 2);
  assert.equal(Number(guestPatch.body.invoice.total), 112);

  const closeGuest = await request(app)
    .post(`/api/v1/invoices/${invId}/close`)
    .set(auth);
  assert.equal(closeGuest.status, 200);
  assert.equal(closeGuest.body.invoice.status, 'PAID');

  // Verify Reception Folio received the 112.00 EGP restaurant charge on Room 101
  const folioRes = await request(app)
    .get('/api/v1/clients/reception-folio?room_no=101')
    .set(auth);
  assert.equal(folioRes.status, 200);
  assert.equal(folioRes.body.charges.length, 1);
  assert.equal(Number(folioRes.body.charges[0].inv_tot), 112);
  assert.equal(folioRes.body.charges[0].room_no, 101);

  const room101 = folioRes.body.room_accounts.find((r) => r.room_no === 101);
  assert.ok(room101);
  assert.equal(Number(room101.rest_q), 112);

  // 5. Open & close a CIVILIAN invoice (50 EGP + 12% service = 56 EGP) and a MEMBER invoice (100 EGP + 12% service - 15% discount = 97 EGP)
  const civ2 = await request(app).post('/api/v1/invoices').set(auth).send({
    point_id: point.id, inv_date: today, shift_id: shift.id, client_type: 'CIVILIAN',
  });
  await request(app).post(`/api/v1/invoices/${civ2.body.invoice.id}/lines`).set(auth).send({
    item_id: item.id, qty: 5, unit_price_override: 10,
  });
  await request(app).post(`/api/v1/invoices/${civ2.body.invoice.id}/close`).set(auth);

  const mem2 = await request(app).post('/api/v1/invoices').set(auth).send({
    point_id: point.id, inv_date: today, shift_id: shift.id, client_type: 'MEMBER', barcode: 'QR-MEM-1001',
  });
  await request(app).post(`/api/v1/invoices/${mem2.body.invoice.id}/lines`).set(auth).send({
    item_id: item.id, qty: 10, unit_price_override: 10,
  });
  await request(app).post(`/api/v1/invoices/${mem2.body.invoice.id}/close`).set(auth);

  // 6. Verify Shift Closing Summary (POINT_CLOSE): المدنى (56) + المشترك (97) = النقدي (153), النزيل (112), الإجمالي العام (265) + dispensed items
  const previewRes = await request(app)
    .get(`/api/v1/shifts/${shift.id}/close-preview`)
    .set(auth);
  assert.equal(previewRes.status, 200);
  const bd = previewRes.body.breakdown;
  assert.equal(bd.civilian.count, 1);
  assert.equal(Number(bd.civilian.total), 56);
  assert.equal(bd.member.count, 1);
  assert.equal(Number(bd.member.total), 97);
  assert.equal(bd.cash_total.count, 2);
  assert.equal(Number(bd.cash_total.total), 153);
  assert.equal(bd.guest.count, 1);
  assert.equal(Number(bd.guest.total), 112);
  assert.equal(Number(bd.deferred_total.total), 112);
  assert.equal(bd.grand_total.count, 3);
  assert.equal(Number(bd.grand_total.total), 265);
  assert.equal(previewRes.body.items_dispensed.length, 1);
  assert.equal(previewRes.body.items_total_qty, 25);
});

test.after(async () => { await pool.end(); });
