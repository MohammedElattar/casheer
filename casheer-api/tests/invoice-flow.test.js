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

const app = createApp();

async function loginAs(code, password) {
  const r = await request(app).post('/api/v1/auth/login').send({ code, password });
  assert.equal(r.status, 200, `login as ${code} failed: ${r.text}`);
  return r.body;
}

async function cleanSlate() {
  // Wipe only invoices + lines + shifts so seed data (points, items, employees) stays.
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
  const todayIso = new Date().toISOString().slice(0, 10);
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
  const todayIso = new Date().toISOString().slice(0, 10);
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
  // service_percent is 10 from seed
  const sub = Number(res.subtotal);
  const svc = Math.floor(sub * 10 / 100 * 100) / 100;
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
  const todayIso = new Date().toISOString().slice(0, 10);
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

test.after(async () => { await pool.end(); });
