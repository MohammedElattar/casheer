import { Router } from 'express';
import rateLimit from 'express-rate-limit';
import { z } from 'zod';
import * as authService from '../services/auth.service.js';
import { ApiError } from '../middleware/error.js';
import { requireAuth } from '../middleware/auth.js';
import { requireSameOrigin } from '../middleware/csrf.js';

const router = Router();

const REFRESH_COOKIE = 'casheer_refresh';
const REFRESH_PATH   = '/api/v1/auth';
const SEVEN_DAYS_MS  = 7 * 24 * 60 * 60 * 1000;

function refreshCookieOpts() {
  return {
    httpOnly: true,
    secure:   process.env.NODE_ENV === 'production',
    sameSite: 'strict',
    path:     REFRESH_PATH,
    maxAge:   SEVEN_DAYS_MS,
  };
}

function clearRefreshCookie(res) {
  res.clearCookie(REFRESH_COOKIE, { path: REFRESH_PATH });
}

function readCookie(req, name) {
  if (req.cookies?.[name]) return req.cookies[name];
  const raw = req.headers?.cookie;
  if (!raw) return null;
  for (const part of raw.split(';')) {
    const [k, ...v] = part.trim().split('=');
    if (k === name) return decodeURIComponent(v.join('='));
  }
  return null;
}

const loginLimiter = rateLimit({
  windowMs: 60 * 1000,
  limit: 20,
  standardHeaders: 'draft-7',
  legacyHeaders: false,
  validate: { keyGeneratorIpFallback: false },
  keyGenerator: (req) => `${req.ip}|${req.body?.code ?? ''}`,
  handler: (_req, res) => {
    res.status(429).json({
      error: {
        code: 'LOGIN_RATE_LIMITED',
        message: 'too many login attempts; try again in a minute',
      },
    });
  },
});

const LoginBody = z.object({
  code:       z.string().min(1),
  password:   z.string().min(1),
  point_id:   z.string().uuid().optional(),
  shift_kind: z.number().int().min(1).max(3).optional(),
  shift_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).optional(),
});

// Retrieve employee info + assigned ports dynamically by employee code.
router.get('/employee-ports/:code', async (req, res, next) => {
  try {
    const result = await authService.lookupEmployeeByCode(req.params.code);
    res.json(result);
  } catch (e) { next(e); }
});

router.post('/login', loginLimiter, async (req, res, next) => {
  try {
    const parsed = LoginBody.safeParse(req.body);
    if (!parsed.success) throw new ApiError(400, 'INVALID_BODY', 'bad request body', parsed.error.issues);
    const { code, password, point_id, shift_kind, shift_date } = parsed.data;
    const result = await authService.login(code, password, req.ip, {
      point_id,
      shift_kind,
      shift_date,
    });
    res.cookie(REFRESH_COOKIE, result.refresh, refreshCookieOpts());
    res.json({
      access:          result.access,
      refresh:         result.refresh,
      employee:        result.employee,
      point:           result.point,
      shift:           result.shift,
      assigned_points: result.assigned_points,
    });
  } catch (e) { next(e); }
});

const CloseShiftBody = z.object({
  code:       z.string().min(1),
  password:   z.string().min(1),
  point_id:   z.string().uuid(),
  shift_kind: z.number().int().min(1).max(3).optional(),
  shift_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/).optional(),
});

router.post('/close-shift', loginLimiter, async (req, res, next) => {
  try {
    const parsed = CloseShiftBody.safeParse(req.body);
    if (!parsed.success) throw new ApiError(400, 'INVALID_BODY', 'bad request body', parsed.error.issues);
    const result = await authService.closeShiftFromLogin({
      ...parsed.data,
      ip: req.ip,
    });
    res.json(result);
  } catch (e) { next(e); }
});

router.post('/refresh', requireSameOrigin, async (req, res, next) => {
  try {
    const token = req.body?.refresh || readCookie(req, REFRESH_COOKIE);
    if (!token) throw new ApiError(401, 'MISSING_REFRESH', 'refresh token required');
    const result = await authService.refresh(token);
    res.cookie(REFRESH_COOKIE, result.refresh, refreshCookieOpts());
    res.json({
      access:          result.access,
      refresh:         result.refresh,
      employee:        result.employee,
      point:           result.point,
      shift:           result.shift,
      assigned_points: result.assigned_points,
    });
  } catch (e) {
    clearRefreshCookie(res);
    next(e);
  }
});

router.post('/logout', requireAuth, async (req, res, next) => {
  try {
    await authService.revokeAll(req.user.sub);
    clearRefreshCookie(res);
    res.json({ ok: true });
  } catch (e) { next(e); }
});

router.get('/me', requireAuth, async (req, res, next) => {
  try {
    const profile = await authService.getSessionProfile(req.user);
    res.json(profile);
  } catch (e) { next(e); }
});

export default router;
