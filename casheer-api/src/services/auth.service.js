import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { createHash, randomBytes } from 'node:crypto';
import { query, withTx } from '../db/pool.js';
import { ApiError } from '../middleware/error.js';

const BCRYPT_ROUNDS = 12;

// P0-4 lockout policy.
const LOCKOUT_WINDOW_MIN = 15;
const LOCKOUT_THRESHOLD  = 5;

export async function hashPassword(plain) {
  return bcrypt.hash(plain, BCRYPT_ROUNDS);
}

function sha256(s) {
  return createHash('sha256').update(s).digest('hex');
}

function signAccess(employee) {
  return jwt.sign(
    { sub: employee.id, code: employee.code, role: employee.role },
    process.env.JWT_ACCESS_SECRET,
    { expiresIn: process.env.JWT_ACCESS_TTL || '15m' },
  );
}

function signRefresh(employee) {
  const jti = randomBytes(16).toString('hex');
  return jwt.sign(
    { sub: employee.id, jti },
    process.env.JWT_REFRESH_SECRET,
    { expiresIn: process.env.JWT_REFRESH_TTL || '7d' },
  );
}

async function recordAttempt(code, ip, success) {
  await query(
    `INSERT INTO login_attempts (code, ip, success) VALUES ($1, $2, $3)`,
    [code, ip ?? null, success],
  );
}

async function checkLockout(code) {
  const { rows } = await query(
    `SELECT count(*)::int AS fails
       FROM login_attempts
      WHERE code = $1
        AND success = FALSE
        AND attempted_at > now() - ($2 || ' minutes')::interval`,
    [code, String(LOCKOUT_WINDOW_MIN)],
  );
  if ((rows[0]?.fails ?? 0) >= LOCKOUT_THRESHOLD) {
    throw new ApiError(
      423,
      'ACCOUNT_LOCKED',
      `too many failed attempts; locked for ${LOCKOUT_WINDOW_MIN} minutes`,
    );
  }
}

export async function login(code, password, ip) {
  await checkLockout(code);

  const { rows } = await query(
    `SELECT id, code, name, password_hash, role, active
       FROM employees WHERE code = $1`,
    [code],
  );
  const emp = rows[0];
  const ok = emp && emp.active && await bcrypt.compare(password, emp.password_hash);

  await recordAttempt(code, ip, !!ok);

  if (!ok) {
    throw new ApiError(401, 'BAD_CREDENTIALS', 'invalid code or password');
  }
  const access  = signAccess(emp);
  const refresh = signRefresh(emp);
  const decoded = jwt.decode(refresh);
  await query(
    `INSERT INTO refresh_tokens (employee_id, token_hash, expires_at)
     VALUES ($1, $2, to_timestamp($3))`,
    [emp.id, sha256(refresh), decoded.exp],
  );
  return {
    access,
    refresh,
    employee: { id: emp.id, code: emp.code, name: emp.name, role: emp.role },
  };
}

export async function refresh(refreshToken) {
  let payload;
  try {
    payload = jwt.verify(refreshToken, process.env.JWT_REFRESH_SECRET);
  } catch (err) {
    throw new ApiError(401, 'INVALID_REFRESH', err.message);
  }
  const hash = sha256(refreshToken);
  return withTx(async (client) => {
    const { rows } = await client.query(
      `SELECT rt.*, e.id AS employee_id, e.code, e.name, e.role, e.active
         FROM refresh_tokens rt
         JOIN employees e ON e.id = rt.employee_id
        WHERE rt.token_hash = $1
          AND rt.revoked_at IS NULL
          AND rt.expires_at > now()`,
      [hash],
    );
    const row = rows[0];
    if (!row || !row.active) {
      throw new ApiError(401, 'INVALID_REFRESH', 'refresh token not recognized');
    }
    await client.query(`UPDATE refresh_tokens SET revoked_at = now() WHERE id = $1`, [row.id]);
    const employee = { id: row.employee_id, code: row.code, name: row.name, role: row.role };
    const access  = signAccess(employee);
    const newRef  = signRefresh(employee);
    const decoded = jwt.decode(newRef);
    await client.query(
      `INSERT INTO refresh_tokens (employee_id, token_hash, expires_at)
       VALUES ($1, $2, to_timestamp($3))`,
      [employee.id, sha256(newRef), decoded.exp],
    );
    return { access, refresh: newRef, employee };
  });
}

export async function revokeAll(employeeId) {
  await query(
    `UPDATE refresh_tokens SET revoked_at = now()
       WHERE employee_id = $1 AND revoked_at IS NULL`,
    [employeeId],
  );
}
