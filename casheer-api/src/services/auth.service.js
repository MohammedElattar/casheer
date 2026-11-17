import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { createHash, randomBytes } from 'node:crypto';
import { query, withTx } from '../db/pool.js';
import { ApiError } from '../middleware/error.js';
import { resolveAndValidateShiftDate } from '../util/money.js';
import { getShiftCloseSummary } from './shift-report.service.js';

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

function signAccess(employee, session = {}) {
  return jwt.sign(
    {
      sub: employee.id,
      code: employee.code,
      role: employee.role,
      point_id: session.point_id ?? null,
      shift_id: session.shift_id ?? null,
    },
    process.env.JWT_ACCESS_SECRET,
    { expiresIn: process.env.JWT_ACCESS_TTL || '15m' },
  );
}

function signRefresh(employee, session = {}) {
  const jti = randomBytes(16).toString('hex');
  return jwt.sign(
    {
      sub: employee.id,
      jti,
      point_id: session.point_id ?? null,
      shift_id: session.shift_id ?? null,
    },
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

export async function getEmployeeAssignedPoints(employeeId, db = { query }) {
  const { rows } = await db.query(
    `SELECT p.id, p.code, p.name, p.service_percent, p.min_charge,
            p.printer_name, p.weekday_mask, p.m_status, p.active,
            ARRAY_AGG(DISTINCT epp.shift_kind ORDER BY epp.shift_kind) AS shift_kinds
       FROM employee_point_permissions epp
       JOIN points p ON p.id = epp.point_id
      WHERE epp.employee_id = $1
        AND p.active = TRUE
      GROUP BY p.id
      ORDER BY p.code`,
    [employeeId],
  );
  return rows;
}

export async function lookupEmployeeByCode(code) {
  const trimmed = String(code ?? '').trim();
  if (!trimmed) {
    throw new ApiError(400, 'INVALID_CODE', 'employee code is required');
  }
  const { rows } = await query(
    `SELECT id, code, name, role, active
       FROM employees
      WHERE code = $1`,
    [trimmed],
  );
  const emp = rows[0];
  if (!emp || !emp.active) {
    throw new ApiError(404, 'EMPLOYEE_NOT_FOUND', 'رقم الموظف غير مسجل أو غير نشط');
  }
  const points = await getEmployeeAssignedPoints(emp.id);
  return {
    employee: { id: emp.id, code: emp.code, name: emp.name, role: emp.role },
    points,
  };
}

export async function login(code, password, ip, options = {}) {
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

  return withTx(async (client) => {
    const assignedPoints = await getEmployeeAssignedPoints(emp.id, client);
    if (assignedPoints.length === 0) {
      throw new ApiError(
        403,
        'NO_ASSIGNED_PORTS',
        'لا توجد منافذ عمل مخصصة لهذا الموظف',
      );
    }

    let selectedPoint = null;
    if (options.point_id) {
      selectedPoint = assignedPoints.find((p) => p.id === options.point_id) ?? null;
      if (!selectedPoint) {
        throw new ApiError(
          403,
          'PORT_NOT_ASSIGNED',
          'هذا المنفذ غير مخصص لهذا الموظف',
        );
      }
    } else {
      selectedPoint = assignedPoints[0];
    }

    const shiftKind = Number(options.shift_kind || selectedPoint.shift_kinds?.[0] || 1);
    if (options.point_id && !selectedPoint.shift_kinds.includes(shiftKind)) {
      throw new ApiError(
        403,
        'SHIFT_NOT_ASSIGNED',
        'هذه الوردية غير مخصصة لهذا الموظف على المنفذ المختار',
      );
    }

    const shiftDate = resolveAndValidateShiftDate(shiftKind, options.shift_date);

    // Atomic upsert: open or reuse existing shift for (employee_id, point_id, shift_date, shift_kind).
    const { rows: shiftRows } = await client.query(
      `INSERT INTO shifts (shift_date, shift_kind, employee_id, point_id)
       VALUES ($1, $2, $3, $4)
       ON CONFLICT (shift_date, shift_kind, employee_id, point_id)
       DO UPDATE SET closed_at = NULL
       RETURNING id, shift_date::text AS shift_date, shift_kind, employee_id, point_id, started_at, closed_at`,
      [shiftDate, shiftKind, emp.id, selectedPoint.id],
    );
    const shift = shiftRows[0];

    const sessionMeta = { point_id: selectedPoint.id, shift_id: shift.id };
    const access  = signAccess(emp, sessionMeta);
    const refresh = signRefresh(emp, sessionMeta);
    const decoded = jwt.decode(refresh);

    await client.query(
      `INSERT INTO refresh_tokens (employee_id, token_hash, expires_at, point_id, shift_id)
       VALUES ($1, $2, to_timestamp($3), $4, $5)`,
      [emp.id, sha256(refresh), decoded.exp, selectedPoint.id, shift.id],
    );

    return {
      access,
      refresh,
      employee: { id: emp.id, code: emp.code, name: emp.name, role: emp.role },
      point: selectedPoint,
      shift,
      assigned_points: assignedPoints,
    };
  });
}

export async function closeShiftFromLogin({ code, password, point_id, shift_kind, shift_date, ip }) {
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

  const assignedPoints = await getEmployeeAssignedPoints(emp.id);
  const selectedPoint = assignedPoints.find((p) => p.id === point_id);
  if (!selectedPoint) {
    throw new ApiError(403, 'PORT_NOT_ASSIGNED', 'هذا المنفذ غير مخصص لهذا الموظف');
  }

  const sKind = Number(shift_kind || 1);
  const sDate = resolveAndValidateShiftDate(sKind, shift_date);

  const { rows: updated } = await query(
    `UPDATE shifts
        SET closed_at = now()
      WHERE employee_id = $1 AND point_id = $2 AND shift_date = $3 AND shift_kind = $4
      RETURNING id, shift_date::text AS shift_date, shift_kind, employee_id, point_id, started_at, closed_at`,
    [emp.id, point_id, sDate, sKind],
  );

  if (!updated[0]) {
    throw new ApiError(404, 'SHIFT_NOT_FOUND', 'لا توجد وردية مفتوحة لهذا المنفذ والتاريخ');
  }

  const summary = await getShiftCloseSummary(updated[0].id);
  return { shift: updated[0], summary };
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
    const assignedPoints = await getEmployeeAssignedPoints(employee.id, client);

    const pointId = row.point_id ?? payload.point_id ?? assignedPoints[0]?.id ?? null;
    const point   = assignedPoints.find((p) => p.id === pointId) ?? assignedPoints[0] ?? null;

    let shift = null;
    if (row.shift_id) {
      const { rows: sRows } = await client.query(
        `SELECT id, shift_date::text AS shift_date, shift_kind, employee_id, point_id, started_at, closed_at
           FROM shifts WHERE id = $1`,
        [row.shift_id],
      );
      shift = sRows[0] ?? null;
    }

    const sessionMeta = { point_id: point?.id ?? null, shift_id: shift?.id ?? null };
    const access  = signAccess(employee, sessionMeta);
    const newRef  = signRefresh(employee, sessionMeta);
    const decoded = jwt.decode(newRef);
    await client.query(
      `INSERT INTO refresh_tokens (employee_id, token_hash, expires_at, point_id, shift_id)
       VALUES ($1, $2, to_timestamp($3), $4, $5)`,
      [employee.id, sha256(newRef), decoded.exp, sessionMeta.point_id, sessionMeta.shift_id],
    );
    return { access, refresh: newRef, employee, point, shift, assigned_points: assignedPoints };
  });
}

export async function getSessionProfile(userPayload) {
  const { rows } = await query(
    `SELECT id, code, name, role, active FROM employees WHERE id = $1`,
    [userPayload.sub],
  );
  const emp = rows[0];
  if (!emp || !emp.active) {
    throw new ApiError(401, 'UNAUTHENTICATED', 'employee inactive');
  }
  const assignedPoints = await getEmployeeAssignedPoints(emp.id);
  const point = assignedPoints.find((p) => p.id === userPayload.point_id) ?? assignedPoints[0] ?? null;
  let shift = null;
  if (userPayload.shift_id) {
    const { rows: sRows } = await query(
      `SELECT id, shift_date::text AS shift_date, shift_kind, employee_id, point_id, started_at, closed_at
         FROM shifts WHERE id = $1`,
      [userPayload.shift_id],
    );
    shift = sRows[0] ?? null;
  }
  return {
    user: userPayload,
    employee: { id: emp.id, code: emp.code, name: emp.name, role: emp.role },
    point,
    shift,
    assigned_points: assignedPoints,
  };
}

export async function revokeAll(employeeId) {
  await query(
    `UPDATE refresh_tokens SET revoked_at = now()
       WHERE employee_id = $1 AND revoked_at IS NULL`,
    [employeeId],
  );
}
