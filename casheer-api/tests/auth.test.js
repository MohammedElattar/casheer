import test from 'node:test';
import assert from 'node:assert/strict';
import request from 'supertest';
import { createApp } from '../src/app.js';
import { pool } from '../src/db/pool.js';

const app = createApp();

async function resetAuthState() {
  await pool.query(`DELETE FROM login_attempts`);
  await pool.query(`DELETE FROM refresh_tokens`);
}

test('auth: login sets httpOnly refresh cookie and rotates refresh token (old token revoked)', async () => {
  await resetAuthState();

  const loginRes = await request(app)
    .post('/api/v1/auth/login')
    .send({ code: '100', password: 'cashier123' });

  assert.equal(loginRes.status, 200);
  assert.ok(loginRes.body.access);
  assert.ok(loginRes.body.refresh);
  assert.equal(loginRes.body.employee.code, '100');

  const setCookie = loginRes.headers['set-cookie'] ?? [];
  assert.ok(
    setCookie.some((c) => c.startsWith('casheer_refresh=') && c.includes('HttpOnly')),
    'expected casheer_refresh HttpOnly cookie',
  );

  // Rotate refresh token using the cookie (and Origin header matching WEB_ORIGIN)
  const origin = process.env.WEB_ORIGIN || 'http://localhost:5173';
  const refreshRes = await request(app)
    .post('/api/v1/auth/refresh')
    .set('Origin', origin)
    .set('Cookie', setCookie)
    .send({});

  assert.equal(refreshRes.status, 200);
  assert.ok(refreshRes.body.access);
  assert.notEqual(refreshRes.body.refresh, loginRes.body.refresh);

  // Reusing the old refresh token must fail with 401 INVALID_REFRESH
  const reuseRes = await request(app)
    .post('/api/v1/auth/refresh')
    .set('Origin', origin)
    .send({ refresh: loginRes.body.refresh });

  assert.equal(reuseRes.status, 401);
  assert.equal(reuseRes.body.error.code, 'INVALID_REFRESH');
});

test('auth: CSRF middleware rejects cross-origin refresh attempts (P0-5)', async () => {
  await resetAuthState();

  const loginRes = await request(app)
    .post('/api/v1/auth/login')
    .send({ code: '100', password: 'cashier123' });

  const badOriginRes = await request(app)
    .post('/api/v1/auth/refresh')
    .set('Origin', 'https://evil.example.com')
    .send({ refresh: loginRes.body.refresh });

  assert.equal(badOriginRes.status, 403);
  assert.equal(badOriginRes.body.error.code, 'BAD_ORIGIN');
});

test('auth: brute-force lockout after 5 failed attempts locks account for 15m (P0-4)', async () => {
  await resetAuthState();

  for (let i = 0; i < 5; i++) {
    const r = await request(app)
      .post('/api/v1/auth/login')
      .send({ code: '1002', password: 'wrong_password' });
    assert.equal(r.status, 401);
    assert.equal(r.body.error.code, 'BAD_CREDENTIALS');
  }

  // 6th attempt — even with valid password — is locked (423 ACCOUNT_LOCKED)
  const locked = await request(app)
    .post('/api/v1/auth/login')
    .send({ code: '1002', password: '123456' });

  assert.equal(locked.status, 423);
  assert.equal(locked.body.error.code, 'ACCOUNT_LOCKED');

  await resetAuthState();
});

test.after(async () => {
  await resetAuthState();
  await pool.end();
});
