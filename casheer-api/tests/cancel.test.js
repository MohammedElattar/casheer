import test from 'node:test';
import assert from 'node:assert/strict';
import request from 'supertest';
import { createApp } from '../src/app.js';
import { pool } from '../src/db/pool.js';

const app = createApp();

test('soft-cancel flow: open -> add lines -> cancel deletes lines, zeroes totals, keeps audit row', async () => {
  await pool.query(`DELETE FROM login_attempts`);
  const loginRes = await request(app)
    .post('/api/v1/auth/login')
    .send({ code: '100', password: 'cashier123' });
  assert.equal(loginRes.status, 200);

  const auth = { Authorization: `Bearer ${loginRes.body.access}` };
  const point = loginRes.body.point;
  const shift = loginRes.body.shift;

  const { body: itemsBody } = await request(app)
    .get(`/api/v1/items?point_id=${point.id}`)
    .set(auth);
  const item = itemsBody.items[0];

  // Open invoice
  const { body: invBody } = await request(app)
    .post('/api/v1/invoices')
    .set(auth)
    .send({
      point_id: point.id,
      inv_date: shift.shift_date.slice(0, 10),
      shift_id: shift.id,
    });
  const inv = invBody.invoice;

  // Add 2 items
  const addRes = await request(app)
    .post(`/api/v1/invoices/${inv.id}/lines`)
    .set(auth)
    .send({ item_id: item.id, qty: 2 });
  assert.equal(addRes.status, 201);
  assert.ok(Number(addRes.body.invoice.total) > 0);

  // Cancel invoice
  const cancelRes = await request(app)
    .post(`/api/v1/invoices/${inv.id}/cancel`)
    .set(auth)
    .send({ reason: 'عميل غادر' });
  assert.equal(cancelRes.status, 200);
  assert.equal(cancelRes.body.invoice.status, 'CANCELLED');
  assert.equal(Number(cancelRes.body.invoice.subtotal), 0);
  assert.equal(Number(cancelRes.body.invoice.service_amount), 0);
  assert.equal(Number(cancelRes.body.invoice.discount_amount), 0);
  assert.equal(Number(cancelRes.body.invoice.total), 0);
  assert.equal(cancelRes.body.invoice.cancel_reason, 'عميل غادر');

  // Verify invoice row still exists in DB but has 0 lines
  const getRes = await request(app).get(`/api/v1/invoices/${inv.id}`).set(auth);
  assert.equal(getRes.status, 200);
  assert.equal(getRes.body.invoice.status, 'CANCELLED');
  assert.equal(getRes.body.lines.length, 0);
});

test.after(async () => { await pool.end(); });
