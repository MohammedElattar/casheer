# ADR 0003 — Authentication: JWT access + rotating refresh cookie + bcrypt

- Date: 2026-11-09.
- Supersedes: nothing.
- Related: DEC-004, DEC-006, `docs/architecture/api-conventions.md`, INV-06.
- Status: ACCEPTED.

## Context

Legacy auth was a Forms-level password check in `LOG_IN_IN::PUSH_BUTTON29::WHEN-BUTTON-PRESSED`:

```plsql
IF :PASS = 'advisor' THEN c := 1;
-- else SELECT from EMP_TBL
```

The literal `'advisor'` is a hard-coded universal back-door; it must not survive into V1.

V1 is a browser SPA talking to an Express API. Session management must support:

- Short-lived access credentials sent on every request without re-sending the password.
- Re-auth without forcing the cashier to log in every 15 minutes.
- Server-side revocation on password change / logout / role change.
- Resilience to CSRF (refresh flow is the risky surface).

## Decision

- **Password storage:** `bcrypt.hash(password, 12)`. Compare with `bcrypt.compare`. Never log or return the hash.
- **Access token:** JWT, HS256, 15 min TTL. Payload: `{sub: employee.id, role: 'CASHIER'|'MANAGER'|'ADMIN', iat, exp}`. Signed with `JWT_ACCESS_SECRET`. Sent as `Authorization: Bearer <jwt>`.
- **Refresh token:** 7 day TTL, opaque random (32 bytes base64url), **rotating** (every refresh issues a new one and invalidates the old). Stored in Postgres (`auth_refresh` table: `id, employee_id, token_hash, expires_at, revoked_at, created_at, user_agent, ip`). Sent as cookie `casheer_refresh`: `httpOnly; Secure; SameSite=Strict; Path=/api/v1/auth/refresh`.
- **Logout:** sets `revoked_at` on current refresh, clears cookie.
- **Password change:** revokes ALL refresh tokens for that employee. Access tokens expire naturally within 15 min.
- **Role change:** revokes refresh for that employee. Same rationale.
- **Login throttling:** per-username + per-IP sliding window — 5 failed attempts in 15 min → 15 min lockout. Append to `audit_log` with event `LOGIN_FAILED`.
- **Hard constraint:** no password literal anywhere in code (INV-06). CI grep step fails the build on match.

## Reasoning

- JWT access keeps per-request verification stateless, so the API can scale horizontally without a shared session store for the hot path.
- Opaque refresh (not JWT) allows server-side revocation — JWT refresh tokens would be un-revokable without a blacklist (equivalent cost).
- Rotation makes a stolen refresh usable only until the legitimate user refreshes; after that the thief's rotated token is invalid.
- SameSite=Strict on the refresh cookie removes CSRF from the only cookie-authenticated endpoint. The access-token endpoints are header-authenticated, which browsers do not auto-send cross-origin.
- bcrypt cost 12 is current industry baseline; raise to 13 once hashing takes >200 ms on prod hardware.

## Consequences

- `JWT_ACCESS_SECRET` and the refresh signing / HMAC key come from env; absent env on boot → API refuses to start.
- Rotation means the API MUST handle refresh retries (network error after new token issued, client never got it): tolerate re-presentation of a refresh within a short grace window (60 s) before revoking it. Document this in the refresh handler.
- `auth_refresh` grows unboundedly without cleanup. Run `DELETE FROM auth_refresh WHERE expires_at < now() - interval '7 days'` daily via cron.
- Admin cannot "see" active sessions as a side effect; V1 is OK with that. If audit later requires it, `auth_refresh` already has `user_agent` and `ip`.
- The client access token lives in memory (JS variable). Reloads re-do the refresh flow silently. Never put the access token in `localStorage` (XSS exfiltration).

## Alternatives not pursued

- Server-session + session cookie: simpler but adds a stateful hot path. V1 wanted stateless verification.
- JWT refresh tokens: cannot be revoked without a blacklist, which is just a worse opaque-refresh.
- Basic Auth: no 15-min re-auth cadence; browser caches, leaks are catastrophic.
- OAuth2 third party (Google, etc.): unnecessary for an internal POS; adds an external dependency.
