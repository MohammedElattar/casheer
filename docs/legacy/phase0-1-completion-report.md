# Phase 0–1 completion report — Casheer legacy reverse-engineering

Written 2026-11-08 by autonomous `/loop` iter 2. Covers master-prompt Phase 0 (environment discovery) and Phase 1 (inventory + host-local source analysis) **to completion for all work that does not require user approval**. Everything remaining is gated on approvals documented in `.agent/BLOCKERS.md`.

## One-page executive summary

- **Business domain:** Egyptian hospitality back-office — hotel reservations (`HAGZ_TBL`, `BED_IN`, `ROOMS`), on-site restaurant cashier (POS `INVOICE`, `INVOICE_HIST`, `POINT_TBL`), takeaway + delivery (`DELIVERY`, `COURIER` param), loyalty points, employee/shift management (`EMP_TBL` 84 cols), category stats (52 views). Schema name `MAHROSA`, tablespace `MAHROSA_T`.
- **Legacy stack:** Oracle Forms 6.0.5 (`ROS.60050`) + Oracle Reports 6i + 2 PL/SQL libraries + Oracle 9.2 Database. Export dump dated **2004-12-15** (`EXPORT:V09.02.00`).
- **Repository size:** 553 files + 2 new scaffolding files = 555 total, 165 MB. 63 `.fmb` forms, 25 `.rdf` reports, 2 `.pll` libs, 1 `.dmp` (2 MB).
- **Schema size:** **192 tables**, **1910 columns**, **52 views**, **93 FK relationships** (SVG == MySQL mirror, identical).
- **Behavior recovered without PL/SQL bodies:** 5120 trigger rows across 166 form binaries; 486 form→table edges; 68 form→report edges; 269 form→view edges; 1778 icon→form edges; 212 candidate report SELECTs; 34 bind parameters.
- **Dead code:** 1 form (`test.fmb`).
- **Known risk:** PL/SQL body text in `.fmb` is compressed binary; strings cannot recover it. Full Phase-2 extraction needs Forms Builder tooling (BLK-001 / BLK-005).

## Verified source counts

| Category | Count | Source of truth |
|---|---|---|
| Base tables | 192 | `المحروسة/mahrosa-all (1).svg` == `MAHROSA_FULL_DRAWSQL_MYSQL.sql` |
| Columns | 1910 | `analysis/normalized/columns.csv` (from MySQL mirror) |
| Views | 52 | `M_CASHEAR/SQL/views.txt` + 2 siblings |
| FK relationships | 93 | MySQL `FOREIGN KEY` clauses == SVG `<path marker-end>` count |
| Forms (`.fmb`) | 63 | `analysis/inventory/forms.csv` |
| Compiled forms (`.fmx`) | 58 | inventory (5 fewer — recompile gap) |
| Reports (`.rdf`) | 25 | inventory |
| PL/SQL libraries | 2 (`Lib01.pll` 6.0.5, `HINT.PLL` 2.0102 generic tooltip lib) | strings extraction |
| Oracle dump | 1 (`exp` 9.2.0, 2004-12-15, schema `MAHROSA`) | header forensics |

## Phase coverage against master prompt

| Phase | Status | Notes |
|---|---|---|
| 0 — Environment discovery | **DONE** | Two VMs probed (`dobat12c_win_server` Fusion Middleware 12.2.1.19 + 21c XE; `oracle19c` 19.3 DB). |
| 1 — Source inventory | **DONE** | 555 files hashed + classified, 4 real variant groups, 22 duplicate groups. |
| 2 — Forms → XML | **BLOCKED on BLK-001/005** | `frmf2xml` absent on VM; 6i→12c direct open likely refused. JDAPI path documented. |
| 3 — Reports → XML | **BLOCKED on BLK-007** | No `rwconverter` on either VM. Strings-based SQL fragments recovered (212 statements). |
| 4 — PLL extraction | **BLOCKED on BLK-006** | Identifiers recovered via strings; bodies need Forms Builder. |
| 5 — Database forensics | **PARTIAL DONE / approval gated** | Schema catalog complete (192+52+93). `imp show=y` dry run is next, requires approval on `oracle19c` landing PDB. |
| 6 — Dependency mapping | **DONE at strings level** | form→{table, report, view, icon}, view→table, FK table map — all available as CSV + Mermaid. Final precision depends on Phase 2/4 completion. |
| 7 — Business-rule discovery | **BLOCKED on bodies** | Per-form stubs for 30 business-core forms list triggers, block.items, candidate tables; rule bodies UNKNOWN. |
| 8 — Workflow reconstruction | NOT STARTED | Needs business-owner input; 68 candidate form→report edges give starting map. |
| 9 — Architecture research | NOT STARTED | Needs user input on constraints (hosting, stack preferences, Arabic print requirements). |
| 10–13 | NOT STARTED | Downstream of 2–9. |

## Open blockers (summary)

- `BLK-001` — `frmf2xml` absent; JDAPI route viable with approval.
- `BLK-003` — no Casheer DB credentials / no landing PDB.
- `BLK-005` — Forms 6.0.5 → 12.2.1 upgrade likely refused; `dept.fmb` empirical probe recipe queued.
- `BLK-006` — `.pll` body extraction.
- `BLK-007` — Reports XML conversion.
- `BLK-008` — variant resolution (business owner).

## Decisions queued for user

1. Approve `imp show=y` of `mhr.dmp` on `oracle19c` (creates `MAHROSAPDB` + `MAHROSA_REV01` user; produces DDL manifest only, no schema change).
2. Approve one-off `dept.fmb` transfer to VM and `frmbld.exe` empirical probe for BLK-005.
3. Approve JDAPI Java-program implementation path for BLK-001 if frmbld probe fails.
4. Confirm or override hypothesized domain scope (hotel + restaurant + delivery + loyalty).
5. Architecture-phase inputs: hosting target, team-preferred stack, Arabic RTL print constraints.

## Where everything lives

- Memory: `.agent/` (eight files).
- Human docs: `docs/` (legacy, database, forms, reports, dependencies, architecture, migration, testing, adr — non-empty where work landed).
- Machine data: `analysis/inventory/`, `analysis/extracted/`, `analysis/normalized/`, `analysis/dependency-graphs/`.
- Scripts: `scripts/legacy-analysis/` (eight scripts, all read-only, all idempotent).
- Legacy originals: `M_CASHEAR/` and `المحروسة/` — **untouched**.
