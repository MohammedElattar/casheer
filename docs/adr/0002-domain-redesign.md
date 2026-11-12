# ADR 0002 — Domain Redesign (not a 1:1 port)

- Date: 2026-11-09.
- Supersedes: nothing.
- Related: DEC-003, `docs/architecture/domain-model.md`, `docs/architecture/erd.md`.
- Status: ACCEPTED.

## Context

The legacy MAHROSA schema has 192 tables. The current SVG and MySQL mirror matches 1:1 (192/192). The legacy design accumulated 20+ years of fixes, abandoned modules (BED_IN hotel booking, POINT_ORDER_DETAIL loyalty), and Forms-era idioms (`d1..d7` weekday flags as 7 separate boolean columns, `p_ok` as a tri-state boolean, hard-coded printer port suffixes).

The user said directly: "the database will be redesigned... current one is shit".

## Decision

V1 is a **redesign**, informed by the recovered artifacts but not bound by them:

- Only aggregates needed for the SERY invoice lifecycle land in V1 (`Invoice`, `InvoiceLine`, `Point`, `Shift`, `Employee`, `Item`, `ItemType`, `ItemPrice`, `RestaurantTable`, `Room`).
- Legacy columns are preserved under new names and types when they carry a business invariant (e.g., `serial_no` and `ser_no` as independent counters — see INV-01).
- Legacy columns are dropped when they encode obsolete mechanism (e.g., `d1..d7` → `weekday_enabled boolean[7]`, `prnt_n || ',LPT1:'` → `printer_name`).
- Entire modules are deferred when V1 does not need them (BED_IN hotel reservations, kitchen workflow, employee workforce tables, HFL subsystem, e-invoicing, delivery routing, nationality rates, loyalty points, blacklist).
- No module is literally ported. Every column has a purpose that traces to an invariant or a known use case.

## Reasoning

- 192 tables carry historical fossils. Porting them means auditing each; auditing is more work than designing from scratch.
- The business invariants are small in count (~10 documented in `invariants.md`) and clearly bounded.
- A redesigned schema is simpler to migrate forward as the business evolves; the legacy's accumulated quirks would otherwise constrain every future change.
- There is no live DB to carry over — no production data is being mapped, so a 1:1 shape has no operational value.

## Consequences

- Legacy artifacts (`docs/database/tables.md`, `docs/database/foreign-keys.md`, etc.) become **read-only reference** for behavior recovery, not migration blueprints.
- The business-rule catalog (`docs/business-rules/business-rule-catalog.md`, 5247 rules) must be re-examined per aggregate added. The SERY lifecycle doc already extracts the invoice-domain subset.
- Future "main big project" (DEC-004) may own `employee` / `user` and other shared entities; when that is known, the Casheer schema will migrate these to referenced ids. Until then, Casheer owns its own.
- The traceability doc (`docs/migration/traceability-matrix.md`, if it grows) carries only what V1 actually needs — not a full schema mapping.

## Non-goals

- Importing `mhr.dmp` into Postgres. The dump is historical (2004); its schema has drifted twice (dump → MySQL mirror → V1 redesign).
- Preserving table names. `MAHROSA.INVOICE` → `public.invoice`, no prefix, no fidelity to the old casing.
- Preserving every legacy column. If a column is not used by any V1 workflow, it is omitted. Any later need re-adds it via a migration.
