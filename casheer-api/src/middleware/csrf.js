// P0-5: CSRF defense in depth.
// The refresh cookie is already SameSite=Strict + Path-scoped to /api/v1/auth,
// which blocks cross-origin cookie send in every modern browser. This middleware
// adds an Origin/Referer check as a second line on cookie-authenticated routes.
//
// It fails closed: a POST that has neither Origin nor Referer is rejected.
// Simple GETs (no state change) are unaffected.
import { ApiError } from './error.js';

const SAFE_METHODS = new Set(['GET', 'HEAD', 'OPTIONS']);

export function requireSameOrigin(req, _res, next) {
  if (SAFE_METHODS.has(req.method)) return next();

  const allowed = process.env.WEB_ORIGIN;
  if (!allowed) return next(); // dev fallback: no WEB_ORIGIN set → skip

  const origin = req.get('origin');
  const referer = req.get('referer');

  const matches = (value) => {
    if (!value) return false;
    try { return new URL(value).origin === new URL(allowed).origin; }
    catch { return false; }
  };

  if (matches(origin) || matches(referer)) return next();
  return next(new ApiError(403, 'BAD_ORIGIN', 'cross-origin request refused'));
}
