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

// P0-1 cookie options for the refresh token.
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

// P0-2 rate limit. 5 attempts / 60s per (ip, code). In-memory: a single API
// instance. For multi-instance deploys, back with Redis (upgrade when we deploy).
const loginLimiter = rateLimit({
  windowMs: 60 * 1000,
  limit: 5,
  standardHeaders: 'draft-7',
  legacyHeaders: false,
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
  code:     z.string().min(1),
  password: z.string().min(1),
});

router.post('/login', loginLimiter, async (req, res, next) => {
  try {
    const parsed = LoginBody.safeParse(req.body);
    if (!parsed.success) throw new ApiError(400, 'INVALID_BODY', 'bad request body', parsed.error.issues);
    const result = await authService.login(parsed.data.code, parsed.data.password, req.ip);
    res.cookie(REFRESH_COOKIE, result.refresh, refreshCookieOpts());
    // Refresh token is NOT returned in the body — cookie only (P0-1).
    res.json({ access: result.access, employee: result.employee });
  } catch (e) { next(e); }
});

router.post('/refresh', requireSameOrigin, async (req, res, next) => {
  try {
    const token = req.cookies?.[REFRESH_COOKIE];
    if (!token) throw new ApiError(401, 'MISSING_REFRESH', 'refresh cookie required');
    const result = await authService.refresh(token);
    res.cookie(REFRESH_COOKIE, result.refresh, refreshCookieOpts());
    res.json({ access: result.access, employee: result.employee });
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

router.get('/me', requireAuth, (req, res) => {
  res.json({ user: req.user });
});

export default router;
