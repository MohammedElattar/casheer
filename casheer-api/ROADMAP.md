# Casheer rebuild roadmap

Date last touched: 2026-11-09. Scope: both `casheer-api/` (Express+pg+JWT) and `casheer-web/` (React+Vite+TS). Master doc; `casheer-web/ROADMAP.md` only points here.

Everything below is work remaining after Session 6 of the rebuild. Reverse-engineering of the legacy Oracle Forms 6i Casheer lives in **`/home/attar/projects/casheer/`** — do NOT modify that repo except its `.agent/` memory files.

---

## 1. Snapshot (what's done, start here)

### Backend `casheer-api/` — working

```
src/
├── app.js, server.js
├── db/pool.js, migrate.js, seed.js
├── middleware/auth.js (JWT verify + requireRole), error.js (ApiError)
├── routes/
│   ├── auth.js       /login, /refresh (rotating), /logout, /me
│   ├── invoices.js   list, open, get, add/edit/remove lines, discount, close, cancel, /pdf
│   ├── items.js      list (per-point price), types, create, patch, soft-delete
│   ├── points.js     list, get
│   ├── shifts.js     open (perm check against employee_point_permissions), close, get
│   └── reports.js    day-summary, items-sold, shift-summary
├── services/
│   ├── auth.service.js    bcrypt(12), JWT access+refresh (hash-stored, rotated on refresh)
│   ├── invoice.service.js dual counter, FLOOR rounding, status machine, soft-cancel
│   └── print.service.js   Puppeteer HTML→PDF (Arabic RTL thermal 80mm)
├── templates/receipt.{html,css}
└── util/money.js         floor2, computeTotals, isoWeekdayBit, isPointOpenOn
sql/migrations/0001_init.sql  (10 tables + triggers + partial unique index)
docker-compose.yml             postgres:16-alpine, host port 5435
tests/{money,invoice-flow}.test.js  (7 passing: 4 unit + 3 integration)
```

### Frontend `casheer-web/` — working

```
src/
├── main.tsx, App.tsx (router + AuthProvider)
├── api/client.ts         fetch wrapper, access token in memory, refresh in localStorage
├── hooks/useAuth.tsx     context provider + useAuth()
├── pages/
│   ├── Login.tsx        done
│   ├── POS.tsx          point/shift picker, open invoice, add item, qty edit,
│   │                     remove, close(PAID), cancel, print PDF
│   ├── Invoices.tsx     filter by point/date/status, list, print
│   ├── Items.tsx        list + CRUD (role-gated)
│   └── Reports.tsx      day summary KPIs, items-sold table
├── components/Layout.tsx  sidebar + main, RTL
├── i18n/ar.ts            every Arabic string
├── styles/
│   ├── tokens.css        design tokens from the user prototype
│   ├── index.css         primitives (btn, card, msg, input)
│   └── theme-legacy.css  full 839KB prototype CSS (reference, mostly unused)
└── types/index.ts        DTOs
```

### Database (seed state)

Postgres on `localhost:5435`. Seeded:
- 2 employees: `admin / admin123` (ADMIN), `100 / cashier123` (CASHIER)
- 1 point (code 1, `المطعم الرئيسي`, 10% service, all weekdays, printer `THERMAL-1`)
- 3 item types (مشروبات, مأكولات, حلويات)
- 8 items (101-103 beverages, 201-203 food, 301-302 sweets)
- Cashier 100 assigned to point 1, shift kind 1

---

## 2. How to resume cold

```bash
# Backend
cd /home/attar/projects/casheer-api
docker compose up -d db                    # postgres on :5435
cp -n .env.example .env                    # if first time
# IMPORTANT: .env DATABASE_URL already points at localhost:5435
npm install                                # already done; re-run if node_modules missing
npm run migrate                            # idempotent, _migrations table tracks
npm run seed                               # idempotent via ON CONFLICT
npm test                                   # 7/7 should pass

# Launch both
npm run dev:all                            # api :3000, web :5173
```

Open browser: http://localhost:5173. Login `100 / cashier123`.

**Stop:** `Ctrl+C` in the `dev:all` terminal, then `docker compose down` in `casheer-api/`.

### Known one-time setup

- Puppeteer Chromium: on first `npm install`, Chromium (~130 MB) downloads to `~/.cache/puppeteer/chrome/`. If skipped (e.g. `PUPPETEER_SKIP_DOWNLOAD=true`), run `npx puppeteer browsers install chrome` once, or set `PUPPETEER_EXECUTABLE_PATH` in `.env`.
- Vite alias `@/*`: configured in `vite.config.ts` (NOT just `tsconfig.json`). Don't forget if you add new sub-dirs — they resolve from `src/`.

---

## 3. Known issues

- **No refresh cookie.** Refresh token lives in `localStorage` — XSS-reachable. Pre-prod: move to `httpOnly` cookie set by the backend; drop `getRefresh/setRefresh` from `client.ts`.
- **CORS is wide-open-ish.** `WEB_ORIGIN=http://localhost:5173` in `.env`. Lock it for prod.
- **JWT secrets are example values.** Rotate before any deploy. Use 256-bit random hex.
- **No rate limiting** on `/auth/login`. Trivial brute-force risk in prod. Add `express-rate-limit` keyed by `(ip, code)`.
- **No idempotency keys** on `POST /invoices`, `POST /invoices/:id/lines`. A double-tap during a slow network creates duplicate lines. Add `Idempotency-Key` header support.
- **Puppeteer browser is per-process singleton.** Multiple concurrent `/pdf` calls share one Chromium — usually fine but can stall. Consider a small pool (2-3) if print volume grows.
- **Reports page lacks date-range** (only single day). Add week/month.
- **No audit log table.** `invoices.cancelled_by` + `paid_by` are per-row; no history of edits. Consider an `audit_events` table.

---

## 4. Backlog (priority order)

### P0 — must have before any production use

1. **Switch refresh token to `httpOnly` cookie.** Backend sets `Set-Cookie: refresh=...; HttpOnly; Secure; SameSite=Lax; Path=/api/v1/auth/refresh`. Frontend drops localStorage refresh handling.
2. **Rate limit `/auth/login`** — 5 fails per minute per IP + per code.
3. **Secrets hygiene.** `.env.example` placeholders, real `.env` 32+ byte random secrets via `openssl rand -hex 32`. Never commit `.env`.
4. **Login `fail2ban`-style**: after 5 bad attempts for a `code`, lock for 15 min. Table `login_attempts(code, ip, at, success)`.
5. **CSRF** — only relevant once refresh is cookie-based. Add double-submit or SameSite=Strict + Origin check.
6. **E2E Playwright smoke.** Login → open shift → create invoice → add item → close → see PAID in Invoices list. Blocks regression before any UI merge. (Backend integration tests exist; browser-level does not.)
7. **Backup strategy** docs for the `casheer_db` Docker volume.

### P1 — functional completeness

1. **Admin pages:**
   - `/admin/points` — CRUD, weekday_mask bit editor, service %, min charge, printer name
   - `/admin/employees` — CRUD, password reset, role assignment, permission to open shift at a point (writes `employee_point_permissions`)
   - `/admin/item-types` — CRUD
2. **Shift close**: UI button, backend already supports `POST /shifts/:id/close`. On close show the shift summary from `/reports/shift-summary`.
3. **Shift report/printout** — Z-report equivalent. Reuses `print.service.js` template style.
4. **Invoice detail page** `/invoices/:id` — read-only view of a closed/cancelled invoice with reprint + original cashier.
5. **Items grid on POS by type (tabs).** Current flat grid is hard to scan at >50 items. Tab per `item_type`.
6. **Price override per line** — POS currently sends `qty` only. Wire `unit_price_override` for comped/discounted lines.
7. **Note per line** — comment field for kitchen ("بدون بصل" etc.) wire `note` column.
8. **Reports date range** — week, month, custom range. Add aggregate charts (simple SVG bar or [uplot](https://github.com/leeoniya/uPlot)).
9. **Multi-point support** — current UI assumes a single point per cashier session. Let a supervisor switch points without logging out.
10. **Per-point item activation** — `point_items` table exists but there's no UI to toggle items on/off per point.

### P2 — parity with legacy invariants not yet enforced

Legacy had these; new code has stubs or no coverage. See `../casheer/docs/workflows/sery-invoice-lifecycle.md`.

1. **Invoice type branches** — `inv_type` 1/2/3/4/5 is stored but not acted on. Specifically:
   - `inv_type=2` ROOM: should capture room number, defer payment, enforce `BLKMIN.w_m_q` minimum charge.
   - `inv_type=3` MANAGER_OVERRIDE: requires supervisor password + `madf_type=3` unlock of discount.
   - `inv_type=4` FIXED_SUM: lets cashier type a total, skip service.
   - `inv_type=5` EMPLOYEE: force `service_percent := 0`.
2. **Minimum charge** per point (`points.min_charge`). Enforce: if subtotal < min_charge → warn / block close.
3. **Auto-service-reset** — legacy reset `service_percent` from point on invoice type change. Add trigger in invoice service.
4. **Timers** — legacy polled 3× 6s to pick up kitchen state. Replace with SSE/WebSocket push from backend — defer until kitchen flow exists.
5. **Two-copy print** — frontend currently opens PDF once; add "طباعة نسختين" button that fetches twice and sends to printer.

### P3 — infra, polish, DX

1. **Dockerfile for api** + add `api` service to `docker-compose.yml`. Web gets a separate Nginx-served build.
2. **Caddy reverse proxy** for TLS + routing `/api` → api, `/` → web.
3. **CI** — GitHub Actions (or wherever this lands): `npm ci && npm test` on push; `tsc --noEmit && vitest run` on frontend.
4. **Prettier + ESLint configs** — currently in `devDependencies` but no config files. Add `.prettierrc`, `eslint.config.js` for both repos.
5. **OpenAPI spec** auto-emitted from zod schemas → `/api/v1/openapi.json`. Future parent-project integration will want this.
6. **Error boundary** on React tree. Current errors crash the page.
7. **Loading / skeleton states.** Right now `loading` toggles are bare "جارٍ التحميل...".
8. **Accessibility pass** — tab order, aria labels, keyboard shortcuts for numeric keypad on POS.
9. **i18n extraction** — all Arabic already centralized in `src/i18n/ar.ts`, but still some `ar.*` calls remain after missing keys. Add a lint rule for raw Arabic in JSX.

### P4 — features from the legacy `.rdf` reports worth porting

From the recovered 24 reports (`../casheer/docs/reports/rex-coverage.md`):
- `rep_items` — item master printout (list all items with prices)
- `rep_points` — points list
- `rep_typ_rate` — service rate per type/category
- `invoice_serial` — full-day invoice run
- `cash_invoice` — single-invoice printout (we already have; verify format matches)
- `item_item` — item × item sales pivot
- `point_item` / `point_itemm` — item availability per point
- `categ_item` — category × item breakdown
- `kart` — customer card (loyalty) — needs `members` table that was redesigned-out of V1
- `pation_kard` — patient/member card detail — same, loyalty scope
- Plus 2 missing: `invoice_new_min` and `emp01` (flagged in `../casheer/.agent/BLOCKERS.md` BLK-010)

### P5 — business-rule parity work still outstanding

1. **Hijri calendar support** (DEC-006 defers to V2). If business says yes, add `luxon-hijri` or `umm-al-qura` table; store as column pair `(gregorian_date, hijri_display)` cached on write.
2. **Loyalty points / members** — legacy had `POINT_TBL`, `POINT_MEM`, `MEMB_TBL`, `MAHRMEMB` views. V1 schema dropped these. Add back as `members` + `member_points` + `transactions` when required.
3. **Room charges / nزل** — legacy `NZL_VIEW`, `ROOM_VIEW`. Required for `inv_type=2`.
4. **Kitchen printer routing** — legacy had kitchen auto-print on certain item types. Add `item_types.kitchen_printer_name`.
5. **Manager discount password override** — legacy `MDIR` dialog asked for a supervisor password before applying > 10% discount. Add `SUPERVISOR_OVERRIDE_REQUIRED` check.

### P6 — nice to have

1. Dark mode (prototype CSS was light only).
2. Touch-optimized button sizes on POS.
3. Barcode scanner input on POS.
4. Offline mode with IndexedDB queue + sync.
5. Mobile responsive layout.

---

## 5. Business invariants: enforced vs pending

| Invariant | Status | Where |
|---|---|---|
| `SERIAL_NO` monotonic per `(point, date)` | ✅ enforced | `invoice.service.js::openInvoice` + partial unique index |
| `SER_NO` monotonic per `(point, date, PAID)` | ✅ enforced | `invoice.service.js::closeInvoice` + `uq_invoices_serno_paid` |
| `FLOOR(x*100)/100` on all money | ✅ enforced | `util/money.js::floor2` used throughout |
| `points.weekday_mask` weekday gate | ✅ enforced | `openInvoice` |
| `p_ok` + `del_flg` overload split | ✅ enforced | `invoices.status` enum |
| Soft-cancel keeps INVOICE row | ✅ enforced | `cancelInvoice` deletes lines, keeps row |
| Qty cap 9999 | ✅ enforced | `addLine` + CHECK constraint |
| 2-copy print on PAID | ✅ enforced | Dedicated `طباعة نسختين` button on `POS.tsx` |
| `points.min_charge` | ✅ enforced | `invoice.service.js::closeInvoice` (`BELOW_MIN_CHARGE`) |
| `inv_type` 4/5 service reset | ✅ enforced | `invoice.service.js::openInvoice` |
| Employee-to-Port assignment (`EMP_POINT`) | ✅ enforced | `/auth/employee-ports/:code`, `/auth/login`, `/points`, `openInvoice` |
| Auth bypass `IF PASS='advisor'` | ✅ removed (DEC-004) | — |

---

## 6. Testing state

- **Backend**: 13/13 passing (`tests/{auth,cancel,invoice-flow,money,permissions}.test.js`). Covers: `httpOnly` refresh cookie + rotation, CSRF origin check (P0-5), 5-attempt brute-force lockout (P0-4), soft-cancel flow, role permissions, employee-to-port assignment lookup + backend validation + session binding, floor2 edge cases, computeTotals rounding chain, weekday mask, invoice happy path, and dual counter (`ser_no` subset of PAID).
- **Frontend**: 2/2 passing (i18n smoke) + clean `tsc --noEmit && vite build`.

### Next test targets

- API: `tests/auth.test.js` — login, refresh rotation (new refresh invalidates old), bad creds lockout once P0 #4 lands.
- API: `tests/cancel.test.js` — open → add → cancel → lines gone, totals zero, status=CANCELLED.
- API: `tests/permissions.test.js` — cashier can't POST `/items`, admin can.
- Web: `tests/pos.test.tsx` — mount `<POSPage />` with mocked `api()`, verify opening-shift flow.
- E2E: single Playwright spec covering the happy path, to be added as P0.

---

## 7. Pointers (don't duplicate)

- Legacy reverse-engineering notes: `../casheer/docs/`
  - `workflows/sery-invoice-lifecycle.md` — the invoice state machine this rebuild tracks
  - `forms/dispatch-and-entry-points.md` — LOG_IN_IN dispatch + discovery of auth bypass
  - `forms/pll-bodies.md` — Lib01 stub findings + HINT.PLL tooltip discovery
  - `migration/ora-ffi-inventory.md` — proves the `ora_ffi` 2090-hit footprint is 1 library
  - `migration/deprecated-builtins.md` — RUN_PRODUCT etc. replacement map
  - `database/tables.md` + `foreign-keys.md` + `crud-matrix.md` — recovered legacy schema (used as reference, not blueprint)
  - `reports/rex-coverage.md` — 24 recovered reports, column aliases, groups
- Decisions: `../casheer/.agent/DECISIONS.md` (DEC-003 Node+Postgres+React, DEC-004 Express+pg+JWT, DEC-005 Arabic print, DEC-006 V1 defaults).
- Open legacy blockers that still touch this rebuild: `../casheer/.agent/BLOCKERS.md`
  - BLK-010: 8 missing `.fmb` (kitchen + lookup forms) + 2 missing reports (`invoice_new_min.rep`, `emp01.rdf`). Only matters if business owner wants them ported.
  - BLK-008 sign-off: delete 21 dormant `sery*`/`take_away*` legacy copies (business decision, legacy repo only).

---

## 8. Decisions reference (abridged)

- **DEC-003**: Stack = Node + Postgres (redesigned) + React.
- **DEC-004**: Express + raw SQL `pg` + React+Vite+TS + separate repos + JWT + bcrypt. Integration into a future "main big project" — parent doesn't exist yet, Casheer sets conventions.
- **DEC-005**: Printing via Puppeteer HTML→PDF with Noto Sans Arabic for Arabic ligature fidelity. Arabic+RTL required in V1.
- **DEC-006**: V1 defaults — Hijri deferred to V2, docker-compose on Linux, JWT 15m/7d, REST `/api/v1/*`, two sibling repos, TypeScript both sides, Prettier+ESLint.

Full text: `../casheer/.agent/DECISIONS.md`.

---

## 9. Starting-your-next-session checklist

1. `cd /home/attar/projects/casheer-api && docker compose ps` — db running?
2. If down: `docker compose up -d db`, wait `pg_isready`, then `npm run migrate`.
3. `npm test` — baseline (expect 7/7).
4. `cd ../casheer-web && npm run dev` + `cd ../casheer-api && npm run dev` (or `casheer-api/npm run dev:all`).
5. Pick a backlog item from §4 by priority. Start with P0 #1 or #6 (e2e) before shipping anything.
6. When done: update this file's §1 + §5 + §6 status rows.
