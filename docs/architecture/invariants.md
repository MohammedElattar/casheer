# Casheer — V1 Invariants (lock as acceptance tests)

**Source:** `docs/workflows/sery-invoice-lifecycle.md` (VERIFIED from Forms XML). Each invariant below is a direct business rule carried from the legacy form into the rebuild, and must be enforced in the application tier (not just assumed by the UI).

## INV-01 — Dual counter

- `invoice.serial_no` is assigned on OPEN. It is `MAX(serial_no)+1` over `(point_id, inv_date)` across ALL invoices (including cancelled).
- `invoice.ser_no` is assigned on PAY. It is `MAX(ser_no)+1` over `(point_id, inv_date)` where `status='PAID'`.
- Cancellation does NOT consume a `ser_no` (never assigned pre-PAY, and if cancellation happens after PAY, the number stays on the row — gaps are not allowed).
- Both counters increment under `SERIALIZABLE` transaction or `SELECT ... FOR UPDATE` on a per-(point, date) lock row.

**Test fixtures:**
- Open-then-cancel immediately → `serial_no=1`, `ser_no IS NULL`.
- Open, pay, open, pay → `serial_no=1,2`, `ser_no=1,2`.
- Open, pay, open, cancel, open, pay → `serial_no=1,2,3`, `ser_no=1,NULL,2`.
- Two concurrent PAY calls on same (point, date) → both succeed, both get distinct `ser_no`, neither errors.

## INV-02 — Floor-rounding (NOT banker's)

For every money column (`serv_q`, `disc_q`, `inv_tot`, line subtotals):

```
value_stored := FLOOR(raw_value * 100) / 100
```

Postgres: `floor(x * 100) / 100`. Node: `Math.floor(x * 100) / 100`.

**Test fixtures:**
- `10.005 → 10.00` (banker's would round to `10.00`, half-up to `10.01`; floor gives `10.00`).
- `10.009 → 10.00` (NOT `10.01`).
- `-0.001 → -0.01` (floor of a negative; design decision: refuse negatives at input validation to avoid this case entirely).

## INV-03 — Weekday gate

- `point.weekday_enabled boolean[7]` indexed `1=Mon..7=Sun` (ISO). Length exactly 7, `NOT NULL`.
- Opening a new invoice when `weekday_enabled[extract(isodow from inv_date)] = false` → `409 Conflict` with code `POINT_CLOSED_ON_DAY`.
- Gate is enforced server-side in the `POST /invoices` service, not only in the UI.

## INV-04 — Status machine

Allowed transitions:

```
OPEN → PAID       (via POST /invoices/:id/pay)
OPEN → CANCELLED  (via POST /invoices/:id/cancel)
PAID → CANCELLED  (manager role only; retains ser_no)
```

Forbidden: `PAID → OPEN`, `CANCELLED → *`, `PAID → PAID` (idempotency separate — a second `/pay` on a PAID invoice returns `409` with code `INVOICE_ALREADY_PAID`, not a no-op).

Line mutation (`POST/PATCH/DELETE /invoices/:id/lines`) requires `status='OPEN'`; else `409 INVOICE_NOT_OPEN`.

## INV-05 — Cancellation semantics

A cancel operation:

1. Sets `status='CANCELLED'`, `del_flg=1`, `p_emp_id=current_user`, `inv_tot=0`.
2. Deletes all `invoice_line` rows for the invoice (in same tx).
3. Keeps the `invoice` header row for audit.
4. Preserves `serial_no` and (if present) `ser_no`.

An `audit_log` row is appended with event `INVOICE_CANCELLED`, payload `{invoice_id, prior_status, prior_total, lines_removed}`.

## INV-06 — No password literals

Grep-level check in CI: `IF :PASS =`, `== 'advisor'`, hard-coded password strings. Zero hits. Any auth flow goes through bcrypt + JWT.

## INV-07 — Arabic preservation

- All text columns storing Arabic use `TEXT` (Postgres default UTF-8 OK).
- API never lossy-transliterates. Request/response JSON is UTF-8.
- Receipt template declares `dir="rtl"` and uses Noto Sans Arabic.
- Database collation is `C.UTF-8` (byte-exact), NOT a locale that reorders Arabic for sorting. Sorting Arabic requires explicit `COLLATE "ar-x-icu"` where needed.

## INV-08 — Totals formula

Given lines `L` each with `qty` and `unit_price`:

```
sum          := sum(L.qty * L.unit_price)
serv_q       := floor(sum * invoice.serv_pct / 100 * 100) / 100
disc_q       := floor(sum * coalesce(invoice.disc_pct, 0) / 100 * 100) / 100
inv_tot      := floor((sum + serv_q - disc_q) * 100) / 100
```

For `inv_type = FIXED_SUM`: `serv_q := 0`, same `disc_q` and `inv_tot` recalculation.
For `inv_type = EMPLOYEE_MEAL`: `serv_pct := 0`, so `serv_q := 0` naturally.

`serv_pct` is snapshotted at invoice OPEN from `point.service_pct`. Changing `point.service_pct` later must NOT mutate existing invoices' `serv_pct` — invoices store their own.

## INV-09 — Composite uniqueness

- `invoice`: `UNIQUE (point_id, inv_date, serial_no)` — hard.
- `invoice`: `UNIQUE (point_id, inv_date, ser_no) WHERE ser_no IS NOT NULL` — partial unique index.
- `invoice_line`: `(invoice_id, line_no)` unique within an invoice.

## INV-10 — Immutable snapshots

At PAY time, snapshot onto the invoice row and never recompute from upstream:

- `serv_pct` (from `point.service_pct` at OPEN).
- `item_price` (per line, from `item_price` lookup at line insertion).
- `emp_id` (from shift at OPEN).

A line's `unit_price` is fixed at insertion. Item price history changes afterwards must not alter paid invoices.

## Test matrix (minimum set for Milestone D)

| ID | Covered | File (planned) |
|---|---|---|
| INV-01 | dual counter correctness, cancellation gap-free | `test/invariants/dual-counter.test.ts` |
| INV-02 | floor rounding at every money boundary | `test/invariants/floor.test.ts` |
| INV-03 | weekday gate rejects closed day | `test/invariants/weekday.test.ts` |
| INV-04 | status machine refuses forbidden transitions | `test/invariants/status.test.ts` |
| INV-05 | cancel semantics preserve header + delete lines | `test/invariants/cancel.test.ts` |
| INV-06 | no password literals in codebase | `.github/workflows/no-literals.yml` grep |
| INV-08 | totals formula with every `inv_type` | `test/invariants/totals.test.ts` |
| INV-09 | composite uniqueness on concurrent inserts | `test/invariants/uniqueness.test.ts` |
| INV-10 | snapshot immutability after PAY | `test/invariants/snapshot.test.ts` |
