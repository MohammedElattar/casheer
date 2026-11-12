import jwt from 'jsonwebtoken';
import { ApiError } from './error.js';

// Access token payload shape: { sub: employee_id, code, role, iat, exp }
export function requireAuth(req, _res, next) {
  const hdr = req.get('authorization') || '';
  const [scheme, token] = hdr.split(' ');
  if (scheme !== 'Bearer' || !token) {
    return next(new ApiError(401, 'MISSING_TOKEN', 'authorization header missing'));
  }
  try {
    const payload = jwt.verify(token, process.env.JWT_ACCESS_SECRET);
    req.user = payload;
    next();
  } catch (err) {
    next(new ApiError(401, 'INVALID_TOKEN', err.message));
  }
}

export function requireRole(...roles) {
  return (req, _res, next) => {
    if (!req.user) return next(new ApiError(401, 'UNAUTHENTICATED', 'auth required'));
    if (!roles.includes(req.user.role)) {
      return next(new ApiError(403, 'FORBIDDEN', 'insufficient role'));
    }
    next();
  };
}
