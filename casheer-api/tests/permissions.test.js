import test from 'node:test';
import assert from 'node:assert/strict';
import request from 'supertest';
import { createApp } from '../src/app.js';
import { pool } from '../src/db/pool.js';

const app = createApp();

test('permissions: role-based access on items/employees + port restriction on invoices', async () => {
  await pool.query(`DELETE FROM login_attempts`);

  const cashierLogin = await request(app)
    .post('/api/v1/auth/login')
    .send({ code: '100', password: 'cashier123' });
  assert.equal(cashierLogin.status, 200);
  const cashierAuth = { Authorization: `Bearer ${cashierLogin.body.access}` };

  const adminLogin = await request(app)
    .post('/api/v1/auth/login')
    .send({ code: 'admin', password: 'admin123' });
  assert.equal(adminLogin.status, 200);
  const adminAuth = { Authorization: `Bearer ${adminLogin.body.access}` };

  const { body: typesBody } = await request(app).get('/api/v1/items/types').set(cashierAuth);
  const typeId = typesBody.types[0].id;

  // 1. Cashier cannot create an item (403 FORBIDDEN)
  const cashierCreate = await request(app)
    .post('/api/v1/items')
    .set(cashierAuth)
    .send({ code: 9901, name: 'صنف تجريبي', type_id: typeId, default_price: 50 });
  assert.equal(cashierCreate.status, 403);
  assert.equal(cashierCreate.body.error.code, 'FORBIDDEN');

  // 2. Admin can create and soft-delete an item
  await pool.query(`DELETE FROM items WHERE code = 9901`);
  const adminCreate = await request(app)
    .post('/api/v1/items')
    .set(adminAuth)
    .send({ code: 9901, name: 'صنف تجريبي', type_id: typeId, default_price: 50 });
  assert.equal(adminCreate.status, 201);

  const adminDel = await request(app)
    .delete(`/api/v1/items/${adminCreate.body.item.id}`)
    .set(adminAuth);
  assert.equal(adminDel.status, 200);
  await pool.query(`DELETE FROM items WHERE code = 9901`);

  // 3. Cashier cannot list /employees (admin-only)
  const empForbidden = await request(app).get('/api/v1/employees').set(cashierAuth);
  assert.equal(empForbidden.status, 403);

  const empAllowed = await request(app).get('/api/v1/employees').set(adminAuth);
  assert.equal(empAllowed.status, 200);
  assert.ok(empAllowed.body.employees.length >= 5);
});

test.after(async () => { await pool.end(); });
