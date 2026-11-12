# Casheer — API Conventions (V1)

**Scope:** HTTP conventions for `casheer-api`. Doubles as a seed for the future "main big project" integration layer (DEC-004), so keep anything project-specific out of this doc.

## URL shape

- Base: `/api/v1/`.
- Resources are plural nouns: `/invoices`, `/invoice-lines`, `/items`, `/item-types`, `/points`, `/shifts`, `/employees`, `/rooms`, `/restaurant-tables`.
- Actions on a resource use a sub-path with POST: `/invoices/:id/pay`, `/invoices/:id/cancel`, `/invoices/:id/recalc`, `/invoices/:id/receipt.pdf`.
- Authentication: `/auth/login`, `/auth/refresh`, `/auth/logout`, `/auth/password`.
- Health: `/health` (no auth, no `/api/v1` prefix).

Versioning: URL-based `/v1/`. Breaking changes bump to `/v2/` and run side-by-side until deprecation.

## HTTP methods

| Verb | Use | Idempotent |
|---|---|---|
| `GET` | List or fetch | yes |
| `POST` | Create or action | no (except `/recalc` which is safe to repeat) |
| `PATCH` | Partial update | yes (same payload → same result) |
| `PUT` | Not used | — |
| `DELETE` | Remove | yes |

## Request / response

- Content type: `application/json; charset=utf-8`. Request bodies validated via `zod` schema; validation failure → 400 with details.
- Field naming: `snake_case` in JSON — matches DB columns and is unambiguous for Arabic-UI developers reading logs.
- Dates: `date` for `YYYY-MM-DD`, `timestamp` for ISO 8601 UTC (`2026-11-09T10:00:00Z`).
- Money: numeric strings like `"12.50"` (two decimals, floored). Never floats in JSON (avoids IEEE drift). Client parses with its own decimal lib.

## Error envelope

Every non-2xx response:

```json
{
  "error": {
    "code": "INVOICE_NOT_OPEN",
    "message": "Invoice 42 is PAID; lines cannot be edited.",
    "details": { "invoice_id": 42, "status": "PAID" }
  }
}
```

- `code` is a stable UPPER_SNAKE enum; client switches on it.
- `message` is English for ops; the UI displays its own Arabic string keyed by `code`.
- `details` is optional, structured, event-specific.

Standard codes:

| HTTP | Code | When |
|---|---|---|
| 400 | `VALIDATION_FAILED` | Zod schema reject. `details.issues` present. |
| 401 | `AUTH_REQUIRED` | Missing / expired JWT |
| 401 | `BAD_CREDENTIALS` | Login failure |
| 403 | `FORBIDDEN` | Role insufficient |
| 404 | `NOT_FOUND` | Resource missing |
| 409 | `INVOICE_NOT_OPEN` | Line edit on PAID/CANCELLED |
| 409 | `INVOICE_ALREADY_PAID` | Second `/pay` on PAID |
| 409 | `POINT_CLOSED_ON_DAY` | Weekday gate — INV-03 |
| 409 | `ROLE_REQUIRED_MANAGER` | Manager-only action attempted |
| 409 | `CONSTRAINT_VIOLATION` | DB constraint fallback |
| 500 | `INTERNAL` | Uncaught. Payload omitted. |

## Pagination

List endpoints only:

- Query params: `?limit=50&cursor=<opaque>`. `limit` default 50, max 200.
- Response:

```json
{
  "data": [ ... ],
  "next_cursor": "eyJpZCI6MTIzfQ=="
}
```

- Cursor is base64-encoded opaque JSON (do NOT rely on its shape in the client).
- Sort order is fixed per endpoint (documented inline); no `?sort=`.

## Filtering

- `?filter[field]=value` for exact match. Multiple fields AND together.
- `?filter[inv_date_from]=YYYY-MM-DD&filter[inv_date_to]=YYYY-MM-DD` for date ranges.
- `?filter[status]=PAID,CANCELLED` for ENUM OR-set.
- No full-text search in V1.

## Authentication

- `POST /api/v1/auth/login` body `{"username":"", "password":""}` → sets refresh cookie, body `{"access_token":"...","expires_in":900,"role":"CASHIER"}`.
- `Authorization: Bearer <access_token>` on every protected request.
- `POST /api/v1/auth/refresh` reads cookie, issues new access_token.
- `POST /api/v1/auth/logout` clears refresh cookie, blacklists current refresh.
- Access token: JWT HS256, 15 min, payload `{sub, role, iat, exp}`.
- Refresh token: httpOnly, Secure, SameSite=Strict cookie, 7 day, rotating.

## Role gating

| Action | Role |
|---|---|
| Login | any active employee |
| Open / line edit / pay invoice | `CASHIER` and up |
| Cancel paid invoice | `MANAGER` and up |
| Override service / discount beyond range | `MANAGER` and up |
| Create / disable employee, item, point | `ADMIN` |

Middleware: `requireRole(['MANAGER','ADMIN'])` returns 403 on mismatch.

## Idempotency keys

- `POST /invoices/:id/pay` accepts `Idempotency-Key: <uuid>` header. Same key + same body within 10 min → same response, no duplicate `ser_no` burn.
- Required on `/pay` to prevent client-retry double-payment. 400 if missing.
- Not needed on `/cancel` (status transition is natural dedup).

## Example: full invoice lifecycle

```
POST /api/v1/invoices                           → 201 {"id":42, "serial_no":7, "status":"OPEN", ...}
POST /api/v1/invoices/42/lines   {item_id,qty}  → 201 line
POST /api/v1/invoices/42/recalc                 → 200 updated totals
POST /api/v1/invoices/42/pay
  Idempotency-Key: 0f1e...                      → 200 {"status":"PAID","ser_no":3, ...}
GET  /api/v1/invoices/42/receipt.pdf            → 200 application/pdf (2-copy render)
```

## Observability

- Request log: method, path, status, duration, actor_id. Avoid logging full bodies (PII — Arabic customer names in invoice notes).
- `/health`: returns `{status:"ok", db:"ok"}` with DB round-trip check. 200 iff all ok.
- Trace headers: honor `traceparent` (W3C) if sent; generate otherwise. Attach to all log lines.
