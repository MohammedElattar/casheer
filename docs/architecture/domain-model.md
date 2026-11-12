# Casheer — Domain Model (V1)

**Scope:** Redesigned domain for the Node + Postgres + React rebuild (DEC-003). This is NOT a 1:1 port of `MAHROSA.*`. Legacy artifacts (`docs/database/tables.md`, `docs/workflows/sery-invoice-lifecycle.md`) are inputs; the model below is what we build.

## V1 aggregates

| Aggregate | Root | Child entities | Purpose |
|---|---|---|---|
| **Invoice** | `invoice` | `invoice_line` | POS bill header + line items, lifecycle `OPEN → PAID | CANCELLED` |
| **Point** | `point` | — | Sales point (counter, dining room, takeaway window). Owns service %, min charge, weekday enable flags, printer. |
| **Shift** | `shift` | — | A (point, date, shift_type) opened by an employee. Parents invoices. |
| **Employee** | `employee` | — | Login identity + role. Replaces the hard-coded `IF :PASS = 'advisor'` back-door. |
| **Item** | `item` | `item_price` (history) | Menu item. `item_type` is a lookup. |
| **ItemType** | `item_type` | — | Category (drinks / mains / sides). |
| **Table** | `restaurant_table` | — | Dining table lookup. |
| **Room** | `room` | — | Hotel room lookup (used by `inv_type=2` deferred-payment path). Reservation workflow deferred to V2. |

## V1 non-goals

- `BED_IN` hotel booking (rate plans, availability, check-in/out). Room table exists only as an invoice reference.
- Hijri calendar display (DEC-006). Gregorian only in V1.
- Kitchen branch (POINT_ID=60) — needs missing `K_MAIN2.fmb` (BLK-010).
- Loyalty points (`POINT_ORDER_DETAIL` legacy table dropped post-2004).
- Black list, delivery routing, nationality rate variance.
- Reports beyond the SERY receipt PDF.

## Invoice state machine

```
                ┌─────────┐
  create ──────▶│  OPEN   │
                └────┬────┘
            lines +/-│
         recalc tots │
            ┌────────┼──────────┐
           pay       │       cancel
            ▼        │           ▼
        ┌────────┐   │       ┌───────────┐
        │  PAID  │   │       │ CANCELLED │
        └────────┘   │       └───────────┘
           immutable │          lines gone, inv_tot=0,
           ser_no +  │          del_flg=1, p_emp_id set
                    (no edits allowed from PAID / CANCELLED)
```

Legacy mapped: `p_ok IS NULL or 0 → OPEN`, `p_ok=1 AND del_flg<>1 → PAID`, `p_ok=1 AND del_flg=1 → CANCELLED`.

## Identifier design

Internal PKs are `BIGSERIAL` surrogates. Business-visible identifiers are separate:

| Business ID | Scope | Semantic |
|---|---|---|
| `invoice.serial_no` | per `(point_id, inv_date)` | Internal row number — assigned on OPEN |
| `invoice.ser_no` | per `(point_id, inv_date)` where `status='PAID'` | Customer receipt number — assigned on PAY |
| `invoice.id` | global | Surrogate PK for FK targets, URLs |

Both `serial_no` and `ser_no` MUST be preserved as independent counters (SERY §dual-numbering). Reports and historical receipt lookup depend on this.

## Invoice-type dispatch

From SERY form `inv_typ` branches:

| `inv_type` | Label | Behavior |
|---|---|---|
| `REGULAR` | Table dining | Needs `table_id`. Prints `invoice_new` template. |
| `ROOM_CHARGE` | Room / defer | Requires point shift active. Captures min-charge banner. Needs `room_id`. |
| `MANAGER_DISCOUNT` | Manager discount | `discount_mode` ∈ (`locked`, `editable`) based on `madf_typ`. |
| `FIXED_SUM` | Fixed override | Forces `serv_q=0`, recomputes on current sum. |
| `EMPLOYEE_MEAL` | Employee invoice | Forces `serv_pct=0`, `serv_q=0`. |

## Authentication

- `employee.password_hash` (bcrypt, cost 12).
- JWT access token (15 min) + refresh cookie (7 day, httpOnly, Secure).
- Role enum: `CASHIER`, `MANAGER`, `ADMIN`. Manager-only actions (discount override, cancel paid invoice) gated by role.
- **Removed:** every legacy password-literal check. Advisor back-door is gone. Password changes go through `POST /api/v1/auth/password`.

## Audit

Every mutable row carries `created_at`, `updated_at`, `updated_by` (FK employee). Cancellation specifically records `p_emp_id` on invoice. A separate append-only `audit_log` table records critical events (login, pay, cancel, override).

## Modernization replacements (from SERY doc §notes)

| Legacy | V1 replacement |
|---|---|
| `point_tbl.d1..d7` (7 cols) | `point.weekday_enabled boolean[7]` (ISO `1=Mon..7=Sun`) |
| `point_tbl.prnt_n || ',LPT1:'` | `point.printer_name` (CUPS / Windows queue name) |
| 6-second `CREATE_TIMER` polling | SSE/WebSocket push (V1 polls `GET /invoices?point=&since=`; WS in V1.1) |
| `run_product(reports, ..., LPT1:)` | `GET /invoices/:id/receipt.pdf` → Puppeteer HTML→PDF → OS print queue |
| `IF :PASS = 'advisor' THEN c:=1` | DELETED. No equivalent. |
| `ora_ffi` tooltip (`HINT.PLL`) | HTML `title=""` / CSS tooltips |
| Hijri `Lib01::F_DATECONV` (stubbed) | Not in V1. Adaptor in V2 if required. |

## Open questions for Milestone B

- Does `shift` need a `closed_at` + `close_totals` snapshot, or is it implicit from invoice aggregation? Decide when porting `point_close` form.
- Table / room availability enforcement: V1 is "advisory lookup, no reservation" — confirm no business rule requires exclusivity.
- Multi-tenant? Assume single-tenant V1; parent project may impose tenant_id later (DEC-004).
