# .agent/NEXT_ACTIONS.md

Prioritized backlog. Each entry: ID, priority, task, dependencies, acceptance criteria, status.

## Priority 1 — unblocks downstream work

### NXT-001 — Probe `oracle19c` VM — DONE 2026-11-08

- Status: COMPLETE. See `docs/legacy/vm-oracle19c-report.md`. `imp` 19.3.0.0.0 confirmed; listener up; only `DOBATPDB` present.

### NXT-002 — Read Fusion Middleware version — DONE 2026-11-08

- Status: COMPLETE. `Oracle Forms Reports 12.2.1.19.0` + `WebLogic Server for FMW 12.2.1.4.0`. Logged in `BLK-002` close note.

### NXT-018 — Trigger-name → form matrix

- Depends on: none (uses NXT-004 output).
- Action: parse each `analysis/extracted/forms/*.strings.txt`, pull every line matching `(WHEN-|PRE-|POST-|KEY-|ON-|NEW-FORM-INSTANCE)` and the parenthetical `(BLOCK.ITEM)` that follows, emit `analysis/normalized/triggers-per-form.csv`. Enables business-rule discovery without `frmf2xml`.
- Acceptance: CSV with form, trigger, scope, item; coverage totals in `docs/forms/trigger-coverage.md`.
- Status: pending — top priority for next session.

### NXT-019 — Parse MW `inventory` patches directory

- Depends on: none.
- Action: `ssh dobat12c_win_server 'dir C:\Oracle\Middleware\Oracle_Home\inventory\oneoffs'` to list CPU patches on top of 12.2.1.4; informs whether a `frmf2xml.bat` was added via a specific bundle patch missing from this install.
- Status: pending.

### NXT-003 — Locate XML extraction tool on VM

- Depends on: `BLK-001`.
- Command: `ssh dobat12c_win_server 'cmd /c "dir /b /s C:\*frmf2xml* C:\*.bat C:\*.cmd C:\*.ps1 C:\*.jar 2>nul | findstr /i \"frmf2xml form2xml fmb2xml jdapi\""'`
- Acceptance: either the producing tool is identified (and a reusable recipe drafted into `docs/legacy/toolchain-gap-analysis.md`) or the absence is confirmed and the next tool-chain option is adopted.
- Status: pending.

## Priority 2 — bulk analysis that does not need Oracle tooling

### NXT-004 — Bulk strings extraction — DONE 2026-11-08

- Status: COMPLETE. 217 binaries dumped to `analysis/extracted/{forms,reports,libraries}/…strings.txt`. Summary at `analysis/extracted/strings-coverage.{csv,md}`. 16,038 trigger-name hits. All `.fmb`/`.rdf`/`.rep`/`.ogd` and `Lib01.pll` = `ROS.60050`; **`HINT.PLL` = `ROS.20102`** — see BLK-009.

### NXT-005 — Parse plain-text SQL in repo

- Depends on: none.
- Inputs: `M_CASHEAR/SQL/{views,trigger,sql1,yom_view,serry,Cashers,Reception,1}.txt`, `M_CASHEAR/inv_update.sql`, `M_CASHEAR/doc_new/new_stat_view.txt`, `M_CASHEAR/vist.txt`, `المحروسة/MAHROSA_FULL_DRAWSQL_MYSQL.sql`.
- Action: extract a per-file object list (views, triggers, DML scripts). Write `docs/database/sql-text-extracts.md`.
- Acceptance: every file either parsed into a structured list OR flagged as free-form notes (not SQL).
- Status: pending.

### NXT-006 — Diff MySQL mirror vs. `mhr.dmp` table set

- Depends on: NXT-005 (for MySQL table list) and, optionally, NXT-008 (for complete Oracle list via `imp show=y`). Can proceed on strings-scraped partial Oracle list in the meantime.
- Action: build two sets, intersect and difference, write `docs/database/schema-comparison.md`.
- Acceptance: three tables printed — Oracle-only, MySQL-only, in both.
- Status: pending.

### NXT-007 — Parse `mahrosa-all (1).svg` schema diagram

- Depends on: none.
- Action: walk `<text>` nodes, extract candidate table/column strings, line-match against `mhr.dmp` tables.
- Acceptance: `docs/database/svg-schema-extract.md` with table list and confidence notes.
- Status: pending.

## Priority 3 — needs approval

### NXT-008 — Dry-run `imp show=y` of `mhr.dmp`

- Depends on: NXT-001 (confirms a working `imp` on `oracle19c`).
- Approval required: minor — `imp show=y` writes no schema, only produces DDL manifest in a local file. Still subject to `RULES.md` per-operation approval because it logs into a DB.
- Acceptance: complete table/view/index/sequence/trigger list from the dump written to `analysis/conversion-logs/mhr_show.log`, then normalized into `docs/database/dump-manifest.md`.
- Status: blocked by NXT-001 and approval.

### NXT-009 — Decide form-extraction toolchain

- Depends on: NXT-002, NXT-003.
- Action: after resolving `BLK-001`/`BLK-002`, log the chosen path in `DECISIONS.md` as `DEC-002` and in an ADR under `docs/adr/`.
- Status: pending.

## Priority 4 — resumption of master-prompt phases

Deferred until Phase 0–1 completes:

- NXT-010 — Phase 2 bulk Forms extraction.
- NXT-011 — Phase 3 Reports extraction.
- NXT-012 — Phase 4 PLL extraction.
- NXT-013 — Phase 5 schema recovery (if NXT-008 succeeds).
- NXT-014 — Phase 6 dependency graphs.
- NXT-015 — Phase 7 business-rule catalog (requires NXT-010, 011).
- NXT-016 — Phase 8 workflow reconstruction.
- NXT-017 — Phase 9 architecture options (needs user input on constraints: hosting, team skills, Arabic font/print requirements).
