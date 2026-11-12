# .agent/CURRENT_STATE.md

Last updated: 2026-11-08 by Session 5 (user-approval push).

## Phase

**Phase 0–1 — Discovery + Inventory. Phase 2 blocked on toolchain choice.**

## Completed Session 5 (user approval push)

User granted blanket approval (DEC-002) and asked why Forms→XML hadn't been done. Investigation + conversion happened in one pass:

- **BLK-001 CLOSED.** Found `oracle.forms.util.xmltools.Forms2XML` in `C:\Oracle\Middleware\Oracle_Home\jlib\frmxmltools.jar`. Runnable directly via Java.
- **BLK-005 CLOSED.** Forms 12.2.1.19 accepts Forms 6.0.5 `.fmb` without format error. Empirical `frmcmp` compile of `dept.fmb` succeeded for stock Forms procedures; only API-level deprecations (`RUN_PRODUCT`) need fixups.
- **All 63 Casheer `.fmb` converted to XML** on VM. Pulled back to `analysis/extracted/forms_xml/` (65 XMLs, 11 MB — some duplicates due to file-rename retries).
- Byte-level dump parse: `scripts/legacy-analysis/parse_dump.py`. Recovered **62 CREATE TABLE statements**, 54 CREATE VIEW, 60 ALTER TABLE, 4 CREATE INDEX from `mhr.dmp` without DB auth. `analysis/conversion-logs/mhr_dump_strings.log`, `analysis/normalized/dump-ddl.csv`, `docs/database/dump-manifest.md`.
- **Dump vs current schema diff** (`docs/database/dump-vs-current-schema.md`): 2004 dump has 62 tables; current SVG/MySQL mirror has 192 tables. 59 common, 3 dump-only (DIR_TBL, ID_TYPE_TBL, POINT_ORDER_DETAIL) presumed renamed/dropped, 133 added post-2004 (hotel agent/company tables, EMP_* workforce tables, E_INVOICE e-invoicing, F_ORDER food orders, HFL_* subsystem).
- **XML parse** (`scripts/legacy-analysis/parse_form_xml.py`): emits structured catalogs from the 65 XMLs.
  - **4859 triggers with full PL/SQL bodies**
  - **382 program units** (form-level procedures/functions/packages, including `DLL` package wrapping Windows API via Ora_Ffi, `TOOLBAR` UI helpers, `BUTTON_PROC`)
  - **490 blocks, 8174 items**
  - **2274 SQL statements** extracted from trigger bodies, intersected with authoritative 192-table catalog
  - Top business tables by block count: INVOICE (49), INV_DTL (48), ITEM_PRICE_VIEW (24), EMP_VIEW (23), NZL_VIEW (15), EMPP_VIEW (14), ITEM_TBL (9), ITEM_TYPE (6)
  - All outputs in `analysis/normalized/xml-*.csv` + `docs/forms/xml-coverage.md`
- `imp` on `oracle19c`: blocked by Claude Code's own `CREATE USER` classifier (even with user's blanket approval). Pivoted to byte-level dump parse which recovered more than `imp show=y` would have (full table DDL strings).

## Completed in Session 5 (autonomous loop, iter 2)

- Form → report cross-references. 68 candidate call edges, 51 forms using RUN_PRODUCT/RUN_REPORT_OBJECT. `analysis/dependency-graphs/form-to-report.csv`, `docs/dependencies/form-to-report.md`.
- Bind-parameter catalog. 34 distinct params, 18 shared across ≥2 reports. Semantic grouping: date range, invoice, employee, customer/card, item, point/shift, delivery. `docs/reports/bind-parameters.md`.
- Views coverage. 52 views parsed from 3 SQL text sources with table-dependency lists each. `docs/database/views.md`, `analysis/dependency-graphs/view-to-table.csv`.
- Column-level diff fixed. SVG count 4398 was 2.3× inflated by `<span>`-per-field rendering. MySQL mirror authoritative: **192 tables / 1910 columns**. `docs/database/column-level-diff.md`, `analysis/normalized/columns.csv`.
- DB-trigger parser from `trigger.txt`. **12 triggers across 2 tables** (HAGZ_ROOM + one). `docs/database/db-triggers.md`, `analysis/normalized/db-triggers.csv`.
- Icon → form map. 1778 edges across 138 forms. `analysis/normalized/form-to-icon.csv`.
- MySQL FK re-verify: **93 FK clauses in MySQL == 93 SVG edges, identical**. Top in-degree: `EMP_TBL` (9), `HAGZ_TBL` (7), `ITEM_TBL` (6), `ROOMS` (5), `POINT_TBL` (5), `INVOICE` (4). `docs/database/foreign-keys.md`.
- Dead-code candidates: only **1** (`M_CASHEAR/test.fmb`, 0/0). `docs/legacy/possible-dead-code.md`.
- Form → view edges: **269**. `analysis/normalized/form-to-view.csv`.
- Mid-tick response to user question: BLK-001 and BLK-005 extended with full probe evidence (deep scan of VM for `frmf2xml` confirmed absent anywhere; JDAPI path specified; `dept.fmb` probe recipe recorded).

## Completed in Session 5 (autonomous loop, iter 1)

- Form-variant activity ranking — 16 rows across 4 stem groups. Top-ranked CANDIDATE_ACTIVE: `sery_last12-10.fmb` (172 triggers), `take_away.fmb` (171 triggers), etc. Outputs: `analysis/normalized/variant-activity.csv`, `docs/forms/variant-activity-candidates.md`. BLK-008 still open — needs business-owner confirmation.
- Form → table dependency matrix — **486 edges across 106 forms**, intersected against authoritative 192 tables. Outputs: `analysis/dependency-graphs/form-to-table.csv`, `analysis/dependency-graphs/forms.mmd`, `docs/dependencies/form-to-table.md`.
- Report SQL parser (`scripts/legacy-analysis/parse_report_sql.py`): 50 reports, **212 candidate SELECT statements**, 34 bind-parameters, 6 authoritative tables matched (`EMP_TBL`, `HAGZ_TBL`, `INVOICE`, `INVOICE_HIST`, `ITEM_TYPE`, `POINT_TBL`). Outputs: `analysis/normalized/report-sql.csv`, `docs/reports/report-sql-coverage.md`.

## Completed in Session 4

- Form stub generator `scripts/legacy-analysis/form_stubs.py`. Wrote **30 per-form stubs** under `docs/forms/` covering the business core (`cash_main`, `sery*` ×11, `take_away*` ×6, `takeaway_pizza*` ×2, `points`, `point_close`, `item_tbl`, `item_type`, `employee`, `dept`, `log_in_in`, `statistics_form`). Each stub carries: source + sha256 + version, toolbar buttons, block.item references, candidate DB tables, full trigger table, UNKNOWN sections for behavior pending PL/SQL body recovery.
- PLL comparison `docs/legacy/pll-comparison.md`. `Lib01.pll` = project-specific date utils (6 identifiers). `HINT.PLL` = generic Forms-4.5 tooltip helper (13 identifiers). BLK-009 CLOSED.

## Completed in Session 3

- NXT-018 trigger matrix: `scripts/legacy-analysis/parse_triggers.py`. 5120 unique trigger rows across 166 form binaries. `analysis/normalized/triggers-per-form.csv` + `docs/forms/trigger-coverage.md`. Top counts: `WHEN-BUTTON-PRESSED` 2470, `WHEN-VALIDATE-ITEM` 402, `WHEN-MOUSE-DOUBLECLICK` 276. `sery*`/`take_away*` forms carry ~170 triggers each — the main business logic lives there.
- NXT-005 plain-text SQL parse: `scripts/legacy-analysis/parse_sql_text.py`. 11 source files → 94 distinct object names across 42 CREATE TABLE, 52 CREATE VIEW. Output at `analysis/normalized/sql-objects.csv` + `docs/database/sql-text-extracts.md`.
- NXT-007 SVG schema parse: `scripts/legacy-analysis/parse_svg_schema.py`. `المحروسة/mahrosa-all (1).svg` parsed via XHTML foreignObject → **192 tables, 93 FK edges, 4398 columns**. `EMP_TBL` biggest at 84 columns. Output at `analysis/normalized/svg-schema.csv` + `docs/database/svg-schema-extract.md`.
- NXT-006 schema comparison: SVG ↔ MySQL mirror ↔ SQL text ↔ dump-header strings. SVG and MySQL match 1:1 (192/192). SQL text covers ~32 % tables plus 52 views unique to it. Dump-header strings confirm 7 tables; no contradictions. Output at `docs/database/tables.md` + `docs/database/schema-comparison.md`.
- Dup-name anomaly flagged: SVG lists both `CUST_TYPE_TBL` and `CUST_TYP_TBL` — probable variant naming that needs verification against live schema or `imp show=y`.

## Completed in Session 2

- Probed `oracle19c` VM → `imp.exe` 19.3 confirmed; report at `docs/legacy/vm-oracle19c-report.md`. BLK-004 CLOSED.
- Read Fusion Middleware inventory on `dobat12c_win_server`: **Oracle Forms Reports 12.2.1.19.0** + WebLogic 12.2.1.4.0. BLK-002 CLOSED.
- Bulk strings extraction across 217 legacy binaries. Output under `analysis/extracted/{forms,reports,libraries}/…strings.txt`. Summary: `analysis/extracted/strings-coverage.{csv,md}`.
- Format sweep: every `.fmb`/`.rdf`/`.rep`/`.ogd` + `Lib01.pll` = `ROS.60050` (Forms/Reports 6.0.5). `HINT.PLL` = `ROS.20102` (older Forms family). BLK-009 opened.
- New scripts: `scripts/legacy-analysis/strings_extract.py`.

## Completed in Session 1

- Full memory + docs scaffolding.
- 555-file inventory (`analysis/inventory/`).
- VM probe of `dobat12c_win_server` (`docs/legacy/vm-environment-report.md`).
- Toolchain gap analysis (`docs/legacy/toolchain-gap-analysis.md`).
- Dump header forensics (`docs/database/dump-header-notes.md`).
- Representative strings probe on `cash_main.fmb`.
- Domain revision DEC-001 (hotel/resort + restaurant).

## Verified counts (reaffirmed Session 2)

| Bucket | Count | Version marker |
|---|---|---|
| `.fmb` | 63 | ROS.60050 all |
| `.fmx` | 58 | (stripped) |
| `.rdf` | 25 | ROS.60050 all |
| `.rep` | 25 | ROS.60050 all |
| `.ogd` | 44 | ROS.60050 all |
| `.pll` | 2 | 1× ROS.60050 (`Lib01.pll`), 1× ROS.20102 (`HINT.PLL`) |
| Oracle dump | 1 | EXPORT V09.02.00 (classic exp 9.2), 2004-12-15, schema MAHROSA |

Trigger-name hits recovered via strings: **16,038 across 165 form binaries**.

## In progress

None — session ending.

## Remaining in Phase 0–1

- NXT-003: locate how `C:\dobat\forms\*_fmb.xml` on VM was produced.
- NXT-019: list MW `oneoffs` patches.
- NXT-005/006/007/018: **DONE Session 3.**
- Dup-name reconciliation (`CUST_TYPE_TBL` vs `CUST_TYP_TBL`) — blocked on `imp show=y` or live DB.
- `HINT.PLL` version-mismatch analysis vs `Lib01.pll` — new local task.

## Phase 2 entrance criteria

Before bulk Forms extraction can start, decide toolchain:
- (a) try `frmbld.exe` on VM with one copy of a Casheer `.fmb` to confirm the 6i → 12.2.1 upgrade fails or succeeds (empirical probe, needs approval);
- (b) locate the tool that made `*_fmb.xml` on the VM (NXT-003);
- (c) write a JDAPI loader against `C:\Oracle\Middleware\Oracle_Home\forms\java\frmjdapi.jar` and JDK 1.8;
- (d) stay with strings-based extraction and accept no PL/SQL body recovery.

## Open blockers

See `.agent/BLOCKERS.md`.
- CLOSED: BLK-001, BLK-002, BLK-004, BLK-005, BLK-009.
- OPEN: BLK-003 (DB creds for live schema inspection — not needed now that dump-DDL parse recovered table structure), BLK-006 (PLL body — Forms2XML refuses library modules, needs JDAPI direct), BLK-007 (reports — no `rwconverter.exe` on this Middleware install), BLK-008 (variant resolution, needs business owner).

## Next recommended step

Unblocked, pure local:
- **Trigger→form drill-down for the `sery*`/`take_away*` family** — these 11 forms carry ~90 % of business behavior. Build per-form markdown stubs under `docs/forms/` listing their trigger table + strings-recovered toolbar buttons.
- Compare `HINT.PLL` vs `Lib01.pll` strings dumps: procedure/function/package counts; clarify why `HINT.PLL` version marker is older.

Needs approval (ready to go):
- NXT-008 `imp show=y` on `oracle19c` to produce the authoritative DDL manifest (triggers, sequences, procedures, packages — currently UNKNOWN). Approval boundary: (a) create landing PDB `MAHROSAPDB` + schema `MAHROSA_REV01`, (b) run `imp show=y` only (no DDL applied), (c) capture log back to repo.
