# .agent/SESSION_LOG.md

Append-only log of work sessions. Most recent at bottom.

---

## Session 1 — 2026-11-08

Operator: mohammedattar0100020@gmail.com. Agent: Claude Opus 4.7 (`claude-opus-4-7`). Host: WSL2 Linux.

### Inspected

- Repo top layout: `M_CASHEAR/` (primary), `المحروسة/` (Arabic-named mirror dir), `.git/`.
- File types across repo: `.fmb`, `.fmx`, `.rdf`, `.rep`, `.pll`, `.ogd`, `.ico`, `.bmp`, `.jpg`, `.dmp`, `.mdb`, `.accdb`, `.sql`, `.txt`, `.ora`, `.svg`, `.psd`, `.tif`, `.gif`, `.png`, `.log`, `.err`, `.bak`, `.dat`, `.lnk`, `.db`, extensionless.
- Local toolchain: no Oracle utilities, no Java, has `strings`, `file`, `python3`, `node`.
- VM `dobat12c_win_server` via SSH: Windows Server 2022, Oracle 21c XE, Fusion Middleware `C:\Oracle\Middleware\Oracle_Home` (version unread). `frmcmp.exe`, `frmbld.exe`, `frmweb.exe` present. No `frmf2xml`. Separate `C:\dobat\` project (military HR) found — not Casheer.
- `M_CASHEAR/cash_main.fmb` via `strings`: Forms 6.0.5 marker `ROS.60050`, real toolbar triggers recovered.
- `M_CASHEAR/SQL/mhr.dmp` header strings: `EXPORT:V09.02.00` (Oracle 9.2 classic exp), schema `MAHROSA`, tablespace `MAHROSA_T`, dated 2004-12-15, source DB `ORCL.US.ORACLE.COM`. Tables leaking from header: `ARMY_TBL`, `BED_IN`, `BLACK_LIST`, `DELIVERY`, `DEPT_TBL`, `DIR_TBL`, `EMP_POINT`, …

### Commands executed (notable, non-destructive)

- `python3 scripts/legacy-analysis/inventory.py .`
- `bash scripts/legacy-analysis/vm_probe.sh > …/scratchpad/vm_probe_raw.txt`
- `ssh dobat12c_win_server 'cmd /c "dir ... & where ... & dir /b /s …"'` (read-only, multiple runs)
- `strings -n 6 M_CASHEAR/cash_main.fmb > analysis/extracted/forms/M_CASHEAR/cash_main.strings.txt`
- `strings -n 8 -e l M_CASHEAR/cash_main.fmb` (UCS-2 pass — 0 useful lines)
- `strings -n 6 M_CASHEAR/SQL/mhr.dmp | head -N / grep` (header forensics)

### Files generated (repo-relative)

- `AGENTS.md`, `CLAUDE.md`
- `.agent/{RULES, PROJECT_CONTEXT, CURRENT_STATE, BLOCKERS, NEXT_ACTIONS, DECISIONS, SESSION_LOG, HANDOFF}.md`
- `scripts/legacy-analysis/{inventory.py, vm_probe.sh}`
- `analysis/inventory/{all-files, forms, reports, libraries, database-files, assets, duplicates, form-variants}.csv` + `inventory-summary.md`
- `analysis/extracted/forms/M_CASHEAR/cash_main.strings.txt`
- `docs/legacy/{vm-environment-report, toolchain-gap-analysis}.md`
- `docs/database/dump-header-notes.md`

### Important discoveries

- Forms version: **6.0.5**.
- Dump: **Oracle 9.2 classic `exp`**, 2004-12-15, schema `MAHROSA`.
- Domain revision: hotel + restaurant (see `DEC-001`), not restaurant-only.
- Toolchain gap: no `frmf2xml` anywhere; Middleware tooling present but version unread and compatibility with 6i unverified.
- Second VM `oracle19c` exists per user statement, not probed.

### Errors encountered

- First `vm_probe.sh` had an unterminated heredoc on `WINCMD`. Fixed by rewriting probe as shell-side `run_remote` calls.
- `frmcmp.exe help=yes` hung the SSH session (`frmcmp` without args opens an interactive compile dialog); stopped as background task `b25j5qjym`.

### Validation results

- Inventory count 555 matches earlier manual `find … | wc -l` (553 before `AGENTS.md`+`CLAUDE.md` existed → 555 after). Extension counts reconcile: 63 fmb, 58 fmx, 25 rdf, 25 rep, 2 pll, 44 ogd.
- `cash_main.strings.txt` contains legible trigger names + Forms-6i version marker — probe succeeded.
- `mhr.dmp` header strings match classic exp format verbatim.

### Remaining uncertainties

- Whether `frmcmp.exe` / `frmbld.exe` on VM accept 6.0.5 `.fmb`.
- Whether `oracle19c` has usable `imp` for the 9.2 dump.
- Full table list of the dump (header strings show ~7–10, dump likely has dozens more).
- Which `sery*.fmb` / `take_away*.fmb` variant is active in production.

### Next session

See `.agent/HANDOFF.md`.

---

## Session 2 — 2026-11-08 (continuation)

Operator: mohammedattar0100020@gmail.com. Agent: Claude Opus 4.7. Host: WSL2 Linux.

### Inspected

- VM `oracle19c` via SSH: Windows Server 2022, Oracle 19.3.0.0.0 DB. `imp.exe`, `exp.exe`, `impdp.exe`, `expdp.exe`, `sqlplus` all present. Listener on 1521. PDBs: `PDB$SEED`, `DOBATPDB`. `tnsnames.ora` aliases: `ORCL`, `DOBATPDB`, `DOBAT`.
- Fusion Middleware `registry.xml` on `dobat12c_win_server`: `Oracle Forms Reports 12.2.1.19.0` + `WebLogic Server for FMW 12.2.1.4.0`.
- Every Casheer legacy binary via bulk strings pass (217 files).

### Commands executed (notable)

- `ssh oracle19c cmd /c "ver & hostname & where sqlplus imp exp impdp expdp frmcmp"`
- `ssh oracle19c cmd /c "imp.exe help=y"`, `lsnrctl status`, `echo show pdbs; | sqlplus -s / as sysdba`
- `scp dobat12c_win_server:'C:\\Oracle\\Middleware\\Oracle_Home\\inventory\\registry.xml' …/scratchpad/mw_registry.xml`
- `grep -oE '<distribution [^>]*name="[^"]*" version="[^"]*"' mw_registry.xml`
- `python3 scripts/legacy-analysis/strings_extract.py .` — 5.4s wall

### Files generated

- `docs/legacy/vm-oracle19c-report.md`
- `scripts/legacy-analysis/strings_extract.py`
- `analysis/extracted/{forms,reports,libraries}/**/*.strings.txt` (217 files)
- `analysis/extracted/strings-coverage.{csv,md}`
- Updates to `.agent/{BLOCKERS,NEXT_ACTIONS,CURRENT_STATE,SESSION_LOG}.md`.

### Important discoveries

- `imp` 19.3 on `oracle19c` is the dump-import target; no Casheer PDB exists yet.
- Fusion Middleware Forms is **12.2.1.19.0** — Forms 12c PS3. Unable to directly upgrade `.fmb` from Forms 6.0.5 per Oracle documented upgrade path.
- Only two version markers across all binaries: `ROS.60050` (99 %) and one outlier `HINT.PLL` at `ROS.20102`.
- 16,038 trigger-name hits recovered from forms strings — large enough to seed a trigger matrix (NXT-018).

### Errors encountered

- `findstr` with escaped quotes over SSH and `head`/`Select-Object` under cmd — quoting hell. Pivoted to `scp` + local `grep`.

### Validation results

- 217 == 63 fmb + 58 fmx + 25 rdf + 25 rep + 44 ogd + 2 pll. Matches inventory. Good.
- Version-marker sweep consistent (all 165 forms and all 50 reports 6.0.5 except the one older PLL).

### Remaining uncertainties

- Mechanism that produced `C:\dobat\forms\*_fmb.xml` (NXT-003 — needed to unblock BLK-001).
- Whether `frmbld.exe` 12.2.1 will even load a 6.0.5 `.fmb` for in-memory inspection.
- Casheer schema credentials or approval to create a landing PDB on `oracle19c`.

### Next session

See `.agent/HANDOFF.md` — rewritten after this session.

---

## Session 3 — 2026-11-08 (continuation)

Operator: mohammedattar0100020@gmail.com. Agent: Claude Opus 4.7. Host: WSL2 Linux. Pure local — no VM activity.

### Executed scripts

- `scripts/legacy-analysis/parse_triggers.py` — 166 strings dumps → 5120 trigger rows.
- `scripts/legacy-analysis/parse_sql_text.py` — 11 SQL text files → 99 header matches, 94 distinct object names (42 tables, 52 views, 2 alter, 2 trigger-section-for-table, 1 desc).
- `scripts/legacy-analysis/parse_svg_schema.py` — DrawSQL SVG via XHTML foreignObject path → 192 tables, 4398 columns, 93 FK edges.

### Generated

- `analysis/normalized/triggers-per-form.csv`
- `analysis/normalized/sql-objects.csv`
- `analysis/normalized/svg-schema.csv`
- `docs/forms/trigger-coverage.md`
- `docs/database/sql-text-extracts.md`
- `docs/database/svg-schema-extract.md`
- `docs/database/tables.md`
- `docs/database/schema-comparison.md`

### Discoveries

- Full table count: **192** (from SVG == MySQL mirror). No contradictions with dump-header strings.
- **93 foreign-key relationships** in SVG. Views (52) live only in SQL text extracts.
- `EMP_TBL` 84 columns = biggest table.
- Dup-name anomaly: `CUST_TYPE_TBL` AND `CUST_TYP_TBL` both in SVG — may be variant naming or a real duplicate.
- Trigger density concentrates on `sery*`/`take_away*` forms (170 each). `WHEN-BUTTON-PRESSED` is 48 % of all trigger hits — button-driven UI.
- SQL text extracts show ad-hoc coverage: `views.txt` holds the full view catalog, `Cashers.txt`/`Reception.txt`/`serry.txt`/`vist.txt` hold table creation slices, `trigger.txt` has only 2 trigger-section headers so triggers remain largely UNKNOWN from host-side alone.

### Errors

- First SVG pass found 0 text nodes because DrawSQL uses `<foreignObject>` + XHTML not `<svg:text>`. Rewrote to walk XHTML `<section><strong>` for table names and `<span>` for column rows.
- Classifier initially tagged 1066 UPPERCASE columns as "table_candidate"; replaced with structural extraction from `<section>`.

### Validation

- SVG 192 tables == MySQL mirror 192 tables, zero diff → the diagram is a trustworthy inventory.
- Dump-header leaked tables (7) all appear in SVG catalog → no contradiction.

### Remaining uncertainties

- Triggers, sequences, procedures, packages catalog (UNKNOWN until `imp show=y`).
- Dup-name reconciliation.
- `HINT.PLL` vs `Lib01.pll` version mismatch — contents not yet diffed.
- Active-vs-historical form selection (BLK-008) — still open; the trigger matrix shows `sery.fmb` ≠ `sery_old.fmb` ≠ `sery_last.fmb` ≠ `sery_last12-10.fmb` at 169/150/171/172 triggers respectively; closest to "active" is probably `sery_last20.fmb` (171) but confirmation needs business-owner input.

---

## Session 4 — 2026-11-08 (continuation)

Operator: mohammedattar0100020@gmail.com. Agent: Claude Opus 4.7. Host: WSL2 Linux. Pure local — no VM activity.

### Executed scripts

- `scripts/legacy-analysis/form_stubs.py` — 30 form stubs written under `docs/forms/`.
- Ad-hoc Python analysis on both PLL strings dumps.

### Generated

- `docs/forms/*.md` (30 new files): cash_main, 11× sery*, 6× take_away*, 2× takeaway_pizza*, points, point_close, item_tbl, item_type, employee, dept, log_in_in, statistics_form.
- `docs/legacy/pll-comparison.md`.
- Memory updates in `.agent/{CURRENT_STATE,BLOCKERS,SESSION_LOG}.md`.

### Discoveries

- `Lib01.pll` roles: 6 identifiers — `F_DATECONV`, `F_DATEDIFF`, `F_FILTERSTRING`, `P_DATEGHUPDATE`, `P_DATEOP`, `P_EXIT`. Project-specific date helpers + an exit routine.
- `HINT.PLL` roles: 13 identifiers — `BUTTONHELPTIMER`, `DISPLAYHINT`, `HIDEBUTTONHELP`, `SHOWBUTTONHELP`, `SHOWBUTTONHELPHANDLER`, `MOUSE_ITEM_IS_ICONIC_BUTTON`, `MOUSE_ITEM_LABEL`, `MOUSE_WINDOW`, `ON_WINDOWS`, `RELATIVE_HINT_POS`, `SYNC_MOUSE_INFO`, `I_DISPLAYHINT`, `HINT`. **Mouse-hover tooltip library** — matches Oracle's well-known reusable `HINT.PLL` snippet from Forms 4.5/5.0 era. BLK-009 CLOSED as "imported reusable library, not a defect".
- Trigger matrix drill-down: `sery.fmb` has 8 named toolbar buttons recovered and 132 block.item references. Same strings-recovered block.item set (`BLK1.*`) dominates the family, consistent with shared base form that was forked across variants.

### Validation

- All 30 generated stubs carry provenance (sha256, version marker, strings-dump path). No data invented — every line links back to either `triggers-per-form.csv` or the strings dump.

### Remaining uncertainties

- PL/SQL bodies for both `Lib01.pll` and `HINT.PLL` unrecoverable from strings. `HINT.PLL` is a common library — a reference implementation can be substituted in the modern app without decompiling this binary. `Lib01.pll` needs decompilation.
- Form variant activity ranking (BLK-008) still awaits either live DB evidence or business-owner confirmation.

---

## Session 5 — 2026-11-08 — Autonomous /loop (dynamic self-paced)

Agent working while user sleeps. Pure local — no SSH, no DB, no legacy-file edits.

### Iteration 1

Tasks executed:
- Variant activity ranking: 16 variants in 4 groups, CANDIDATE_ACTIVE marked.
- Form→table dependency matrix: 486 edges, 106 forms, authoritative-table intersection only.
- Report SQL parser: 50 reports, 212 candidate SELECT statements, 34 bind params, 6 tables, generated per-report + per-table + per-param inventory.

Generated:
- `analysis/normalized/variant-activity.csv`
- `analysis/normalized/report-sql.csv`
- `analysis/dependency-graphs/form-to-table.csv`
- `analysis/dependency-graphs/forms.mmd`
- `docs/forms/variant-activity-candidates.md`
- `docs/dependencies/form-to-table.md`
- `docs/reports/report-sql-coverage.md`
- `scripts/legacy-analysis/parse_report_sql.py`

Discoveries:
- Reports-to-table edges confirm hospitality + POS data flow: reports read from `HAGZ_TBL` (reservations), `INVOICE`, `INVOICE_HIST`, `ITEM_TYPE`, `POINT_TBL`, `EMP_TBL`.
- 34 bind parameters across all reports suggest a parameterised reporting layer — common ones include `:H_NO`, `:EMP_CODE`, `:INV_DT`, `:INV_TYP`, `:KASM`, `:COURIER`, `:DELV`.
- Variant ranking: `sery_last12-10.fmb` edges out `sery_last.fmb` / `sery_last20.fmb` (172 vs 171 triggers). Highest trigger count in the `take_away` group goes to `take_away.fmb` at `M_CASHEAR/` root (171) tied with `take_away_withoutStopDes After3-2014.fmb`.

Validation: all three outputs carry provenance headers and evidence tags. No legacy files touched (`git status` → new untracked only).

### Iteration 2 (user prompted `continue` mid-wait)

Mid-tick, user asked: "why not just convert fmb to xml on `dobat12c_win_server`?" Re-probed VM for `frmf2xml` more thoroughly (checked `C:\Oracle\Middleware\Oracle_Home\forms`, `C:\*f2xml*`, `*.bat` under forms/) — **confirmed absent**. Fusion Middleware install lacks the optional Standalone Builder bundle that ships `frmf2xml.bat`. JDAPI (`frmjapi.dll`) IS present → JDAPI Java program is viable path once approved. BLK-001 and BLK-005 updated with full evidence and a `dept.fmb` probe recipe.

Tasks completed iter 2: form→report xrefs, bind-parameter catalog, views doc, SVG/MySQL column diff fix (1910 authoritative columns), DB-trigger parser (12 triggers), icon→form (1778 edges), dead-code hunt (1 candidate: `test.fmb`), MySQL FK verify (93==93 ✓), form→view (269 edges).

Scripts added:
- `scripts/legacy-analysis/parse_db_triggers.py`
- `scripts/legacy-analysis/parse_report_sql.py`
- `scripts/legacy-analysis/form_stubs.py` (iter 0, now reused)
- `scripts/legacy-analysis/misc_crossrefs.py`

Generated documents:
- `docs/dependencies/form-to-report.md`
- `docs/reports/bind-parameters.md`
- `docs/reports/report-sql-coverage.md`
- `docs/database/views.md`
- `docs/database/column-level-diff.md`
- `docs/database/db-triggers.md`
- `docs/database/foreign-keys.md`
- `docs/legacy/possible-dead-code.md`
- `docs/forms/variant-activity-candidates.md`

Normalized CSVs:
- `analysis/normalized/{variant-activity, report-sql, columns, db-triggers, form-to-icon, foreign-keys, form-to-view}.csv`
- `analysis/dependency-graphs/{form-to-table, form-to-report, view-to-table}.csv`
- `analysis/dependency-graphs/forms.mmd`

Local-work backlog from iter 1 HANDOFF: 7 of 8 items complete. The remaining item (view-vs-table drift inside views.txt headers) was folded into the views doc. Local phase effectively exhausted.

### Iteration 3 — user approval push (same session)

User granted blanket approval (DEC-002). Executed and succeeded on:

- Forms XML conversion: all 63 `.fmb` → XML via `Forms2XML` (from `frmxmltools.jar`). Previously assumed impossible; empirically trivial with correct classpath. BLK-001, BLK-005 CLOSED.
- Byte-level `mhr.dmp` parse: recovered 62 tables, 54 views, 60 alters, 4 indexes without DB auth.
- Dump vs current-schema diff: dump = 62 tables (2004 snapshot); current = 192 tables; 59 common; 133 added post-2004.
- XML structural parse: 4859 triggers with full bodies, 382 program units, 490 blocks, 8174 items, 2274 SQL statements, authoritative-table intersection.

Scripts added:
- `scripts/legacy-analysis/parse_dump.py`
- `scripts/legacy-analysis/parse_form_xml.py`
- (scratchpad: `compile_dept.ps1`, `fmb2xml.ps1`, `bulk_fmb2xml.ps1`, `fix_fails.ps1`, `pll2xml.ps1`, `jar_list.ps1` on VM)

VM state at end of iteration 3:
- `dobat12c_win_server:C:\casheer_rev\` holds the 63 transferred `.fmb` + 65 XML + logs + 2 PLLs. Original Casheer artifacts byte-identical to repo (verified via SHA-256 on `dept.fmb`).
- `oracle19c:C:\casheer_rev\mhr.dmp` holds the transferred dump. No DB user created. Unused for import.

Docs added:
- `docs/database/dump-manifest.md`
- `docs/database/dump-vs-current-schema.md`
- `docs/forms/xml-coverage.md`

Normalized CSVs added:
- `analysis/normalized/{dump-ddl, xml-triggers, xml-program-units, xml-blocks, xml-items, xml-sql-statements, xml-form-summary}.csv`

Blockers CLOSED: BLK-001, BLK-005. Still OPEN: BLK-003 (DB creds — now less critical since dump parse covers DDL), BLK-006 (PLL bodies — Forms2XML refuses), BLK-007 (Reports), BLK-008 (variant resolution).

## 2026-11-09 — Session 6 PLL extraction (user tip: tools already on VM)

- User pointed out pre-existing JDAPI tooling at `C:\dobat\_restore\scripts\` + `C:\navy\jdapi\` on dobat12c_win_server. Confirmed: JDK 1.8.0_202 + `runjdapi.ps1` wrapper + 70+ compiled JDAPI utilities already present (installed for unrelated `dobat` project).
- Disassembled `C:\navy\jdapi\DumpPUlib.class` via `javap -c` — despite the name it opens a `FormModule`, not useful for `.pll`.
- Discovered Forms 12c JDAPI removed `LibraryModule` class; `.pll` files load via `oracle.forms.jdapi.PlsqlModule` instead.
- Wrote `PllDump.java` (28 lines) using `PlsqlModule.open()`. Compiled + ran against `Lib01.pll` and `HINT.PLL`. Both extracted cleanly.
- Pulled dumps to `analysis/extracted/pll_bodies/`. Wrote `docs/forms/pll-bodies.md`. Saved tool source to `scripts/legacy-analysis/PllDump.java`.
- **BLK-006 CLOSED.** Finding: `P_DATEOP` package body is stubbed (hard-coded return values) — Hijri date conversion is NOT in `Lib01.pll`. `HINT.PLL` is Oracle's 1994 SMUENCH/DNAVAS tooltip demo — do not port.
- Legacy originals byte-identical pre/post.

## 2026-11-09 — Session 6 cont. (business-rule catalog + migration inventory)

- Wrote `scripts/legacy-analysis/business_rules.py` — walks all 65 XMLs + 2 PLL dumps, buckets each PL/SQL unit by business domain (14 keyword regexes: invoice/takeaway/pizza/reservation/room/employee/points/stats/item_master/payment/kitchen/security/ui_toolbar/system). Emitted:
  - `docs/business-rules/business-rule-catalog.md` (647 lines, bucketed tables)
  - `analysis/normalized/business-rules.csv` (5247 rows)
- Deprecated-builtin inventory (same script, 2nd pass). Scanned 20 known Forms-6i→modern-pain-point built-ins. Top hits: **ora_ffi 2090**, **TEXT_IO 637**, **ADD_PARAMETER 609**, **RUN_PRODUCT 313**, **READ_IMAGE_FILE 267**. Emitted:
  - `docs/migration/deprecated-builtins.md` (247 lines)
  - `analysis/normalized/deprecated-builtins.csv` (475 rows)
- Wrote `scripts/legacy-analysis/form_table_xml.py` — refreshed form↔table dependency graph from XML-derived data (supersedes strings-based 486 edges). Patched regex to strip `MAHROSA.` schema prefix and reject ≤2-char table names (SQL aliases). Result: 314 edges, 43 forms, 85 tables. Emitted:
  - `docs/forms/form-to-table-xml.md`
  - `analysis/dependency-graphs/form-to-table-xml.csv`
- Top-weight tables: ITEM_TYPE 500, EMP_TBL 339, INVOICE 286, INV_DTL 195, POINT_TBL 173, ROOM_VIEW 139, MAHRMEMB 119. These are the core migration targets.

## 2026-11-09 — Session 6 cont. (variant resolution + dispatch discovery)

- Wrote `scripts/legacy-analysis/call_graph.py` — extracts CALL_FORM/OPEN_FORM/NEW_FORM/GO_FORM literals across all 65 XMLs. Keyed on XML filename stem (not internal FormModule.Name) to preserve variant distinction. 319 edges, 62 forms, 31 "roots" (zero incoming CALL_FORM).
- Wrote `scripts/legacy-analysis/variant_diff.py` — per-file SERY/TAKE_AWAY family comparison. Richest `SERY` variant = `sery_last12-10` (SQL≈120, 102KB trig). Richest `TAKE_AWAY` variant = `takeaway_pizza` (SQL≈87, 76KB trig).
- Wrote `scripts/legacy-analysis/crud_matrix.py` + `docs/database/crud-matrix.md` — 85 tables × forms × {SELECT,INSERT,UPDATE,DELETE,MERGE,BLOCK}. Caveat: keyed on internal form name, so SERY/SERY_LAST variants collapse. 72 read-only tables, 0 write-only tables identified.
- **DISCOVERY (BLK-008 resolved):** direct inspection of `LOG_IN_IN::PUSH_BUTTON29::WHEN-BUTTON-PRESSED` trigger revealed the production dispatch. Active code path:
  ```
  IF :POINT_ID IN (12,13) THEN CALL_FORM('D:\TakeAway\TAKE_AWAY', ...);
  ELSIF :POINT_ID = 60   THEN CALL_FORM('D:\a_mahroosa\k_main2', ...);
  ELSE                        CALL_FORM('D:\m_cashear\sery', ...);
  END IF;
  ```
  Production-active: `M_CASHEAR/sery.fmb`, `M_CASHEAR/take_away.fmb`. Historical: all 14 other `sery*` + 7 other `take_away*`/`takeaway_pizza*`.
- **DISCOVERY (auth bypass):** trigger contains `IF :PASS = 'advisor' THEN c := 1;` — hard-coded password back-door. Must be removed in modernization.
- **DISCOVERY (BLK-010 new):** 8 CALL_FORM targets missing from repo: `K_MAIN`, `K_MAIN2` (kitchen flow), `COUNTRY`, `HI_GAREEMA`, `MED_CODES`, `MED_REASON`, `RES109_CODES`, `WAR_CODES` (lookup forms).
- Entry points: `CASH_MAIN` (admin hub) + `S_MAIN` (reports hub) are the two true roots. LOG_IN_IN is the dispatch intermediary. Relationship between CASH_MAIN and S_MAIN not visible in code (likely a `formsweb.cfg` menu entry on the deployment machine).
- Wrote `docs/forms/dispatch-and-entry-points.md` (full dispatch trigger, archaeology of two older commented-out versions, POINT_ID→form table, encoding caveat about Cp1256 Arabic mojibake).

## 2026-11-09 — Session 6 cont. (ora_ffi deep analysis)

- Wrote `scripts/legacy-analysis/ora_ffi_analysis.py` — walks all forms + PLLs for `ora_ffi.*` usage. Groups by DLL + function.
- **MIGRATION RISK DOWNGRADE**: the 2090 `ora_ffi` tokens that top the deprecated-builtin inventory collapse to a SINGLE library (`HINT.PLL`) loading a SINGLE custom DLL (`SHOWHINT.DLL`) registering a SINGLE function (`DisplayHint`). The 4 Win32 GDI calls (`GetDC`, `ReleaseDC`, `SetMapMode`, `GetTextExtent`, 47× each) are tooltip-positioning calls. ~47 forms attach HINT.PLL, inflating the token count via type-name references (`ora_ffi.libHandleType`, `ora_ffi.ffi_integer`).
- Migration replacement = HTML `title=""` attribute or a CSS/JS tooltip component. Zero native code needed.
- Wrote `docs/migration/ora-ffi-inventory.md` with explicit TL;DR.
- Outputs: `analysis/normalized/ora-ffi-sites.csv` (48 unit rows).

## 2026-11-09 — Session 6 cont. (Lib01 caller analysis)

- Scanned all 65 Forms XMLs + both PLL dumps for calls to `Lib01.pll`'s 5 program units.
- Result: `F_DATECONV`, `F_DATEDIFF`, `P_DATEGHUPDATE`, `F_FILTERSTRING` have **ZERO callers**. All 4 are dead code — their bogus stub returns are inert.
- Only `P_EXIT` is exercised: **32 call sites**, pattern `TOOLBAR.EXIT::WHEN-BUTTON-PRESSED` + `KEY-EXIT` across 16 forms (CASHER, DELV, DEPT, EMPLOYEE, ITEM_POINT, ITEM_TYP, JOB, JOBS, ...).
- Hijri calendar conversion is NOT in extracted Forms code. If production shows Hijri dates, logic is on DB side or in missing forms (BLK-010).
- Updated `docs/forms/pll-bodies.md` with verification.

## 2026-11-09 — Session 6 cont. (Arabic recovery + i18n catalog)

- Discovered the Forms2XML output double-encoded Arabic: the FMB-stored UTF-8 bytes were read as Latin-1, re-encoded as UTF-8. Recovery: `s.encode('latin-1', errors='replace').decode('utf-8', errors='replace')` — ~90% clean, some single-byte artifacts remain (marked with U+FFFD).
- Wrote `scripts/legacy-analysis/arabic_fix.py` — scans trigger bodies + item labels/prompts/hints + alert messages/titles across all 65 XMLs.
- Result: **5513 Arabic string sites, 262 unique strings**. Most repetition is shared toolbar tooltips (Query/Save/Exit/Previous/Next record — standard across every form). Output: `analysis/normalized/arabic-strings.csv`.
- i18n note: this is the starting catalog for the modern UI's Arabic translation table. Byte-perfect fidelity requires re-running Forms2XML with proper NLS_LANG → UTF-8 passthrough (future work).

## 2026-11-09 — Session 6 cont. (BLK-007 Reports closed)

- VM back up. Full `C:\` scan found `rwconverter.exe` at `C:\Oracle\Middleware\Oracle_Home\bin\rwconverter.exe`. Earlier `where /r` hadn't found it (unexplained; `powershell Get-ChildItem -Recurse` did). Oracle Reports Tools 12.2.1.19 is partially deployed: `reports/` + `ReportsBridgeComponent/` + `ReportsServerComponent/` + `ReportsToolsComponent/` dirs are skeletal; the `oracle.reports.tools` component is registered in inventory but its install folder is empty. The one binary we need lives in the main Middleware `bin\` alongside `frmcmp.exe`.
- Script pattern:
  ```
  Start-Process -FilePath rwconverter.exe -ArgumentList @(
    "BATCH=YES","OVERWRITE=YES","SOURCE=<in.rdf>","DEST=<out.rex>",
    "STYPE=rdffile","DTYPE=rexfile","LOGFILE=<log>"
  ) -NoNewWindow -Wait -RedirectStandardOutput ... -RedirectStandardError ...
  ```
- Converted 24/24 (one basename collision between repo copies): `scripts/legacy-analysis/parse_rex.py` extracts queries (full SELECT text), column aliases, groups, parameters from REX.
- REX format = classic Reports script with `<<"..."/>>` heredoc strings. NOT XML despite being an "exchange format". Each query stored at `NAME=<<"Q_n">> ... QUERYLFID=(TLONG) <<"SELECT ...">>`.
- Results: **28 queries**, **357 column aliases**, **55 groups**, 24 reports. Top tables: INVOICE (12 reports), INVOICE_HIST (5). `docs/reports/rex-coverage.md`.
- Output: `analysis/normalized/rex-{queries,columns,groups,parameters,report-summary}.csv`, `analysis/extracted/reports_rex/*.rex` (24 files, ~3.5 MB total).

## 2026-11-09 — Session 6 cont. (SERY invoice-lifecycle workflow + form→report refresh)

- Wrote `scripts/legacy-analysis/form_report_xml.py` — rebuilt form→report graph from XML trigger bodies (`RUN_PRODUCT`, `RUN_REPORT_OBJECT`, `.rdf` literals, `REPORT_FILENAME`). Output: `analysis/dependency-graphs/form-to-report-xml.csv` (89 edges, 41 forms, 17 reports). Cross-ref against REX catalog: 15 of 17 are recovered. **Missing: `INVOICE_NEW_MIN` (42 calls) + `EMP01` (16 calls)** — likely compiled `.rep` files not in repo. Add to BLK-010.
- `docs/forms/form-to-report-xml.md` — top caller forms: TAKE_AWAY (23), SERY (18), TAKEAWAY_PIZZA_ORIGINAL (17), SERY_LAST variants (13 each).
- **SERY invoice-lifecycle workflow** → `docs/workflows/sery-invoice-lifecycle.md` (full state-change graph). Key findings:
  - 3 recurring 6-second timers (`invoice_t`, `kaed_t`, `mdir_t`) poll for external updates — replace with WS/SSE on web.
  - **Dual numbering scheme**: `INVOICE.SERIAL_NO` (sequential per (point,date), assigned on PRE-INSERT) vs `INVOICE.SER_NO` (customer receipt number, sequential only within `p_ok=1` subset, assigned on payment via WHEN-VALIDATE-RECORD).
  - **Weekday gate**: `point_tbl.d1..d7` are 7 enable flags; refuses sales on disabled day. Essential business rule.
  - **Floor-rounding convention**: `FLOOR(x*100)/100` throughout totals. Banker's rounding would break parity.
  - **`p_ok` is overloaded**: paid-flag + locked-flag + reporting-included-flag. Split on migration.
  - **Delete = soft cancel**: alert `del` → DELETE from INV_DTL (keep INVOICE row), set `del_flg=1`, `p_ok=1`, `inv_tot=0`. Audit trail preserved.
  - **Print**: `run_product(reports, ...)` called TWICE deliberately (2 copies). `desname = <point_tbl.prnt_n>,LPT1:` — hardwired printer port, migrate to CUPS/IPP.
  - **Invoice types**: 1=table, 2=room/defer, 3=MODEER-manager-override, 4=fixed-sum, 5=employee.

## 2026-11-09 — Session 6 cont. (modern-app scaffold)

- DEC-003, DEC-004, DEC-005, DEC-006 accepted (Node+Express+pg / React+Vite+TS / separate repos / Puppeteer-for-print-Arabic / Postgres+docker-compose / JWT+bcrypt).
- Extracted CSS from user-supplied `Mahrousa-Reception-Interactive-Demo-v3.html` (839 KB stylesheet, 165 classes, no fonts/menu labels pulled per instruction). Saved to `casheer-web/src/styles/theme-legacy.css` + curated `tokens.css`.
- **Scaffolded `/home/attar/projects/casheer-api/`** (25 files): Express app, `pg` pool + migration runner, JWT auth service (bcrypt, access+refresh with hash-stored refresh rotation), invoice service (opens with dual-counter serial_no PRE-INSERT logic, close assigns ser_no scoped to PAID subset, cancel = soft-cancel with lines delete + totals=0, floor-rounded totals), Puppeteer-based Arabic RTL thermal-receipt PDF service, routes for `/auth`, `/invoices`, `/items`, `/points`, `/shifts`. Dockerized Postgres via `docker-compose.yml`. Seed data (admin + 1 cashier + 1 point + 3 types + 8 items). Unit tests for floor-rounding + weekday mask.
- **Scaffolded `/home/attar/projects/casheer-web/`** (16 files): React 18 + Vite 6 + TS, `BrowserRouter`, `<AuthProvider>` with refresh-on-401, login page with Mahrousa brand colors, POS page (point picker → open shift → create invoice → tap items → change qty / remove / close+PAID / cancel / print PDF). All Arabic strings centralized in `src/i18n/ar.ts`. Design tokens from client prototype. `dir="rtl"` on `<html>`.
- Business invariants preserved: dual counter `serial_no`/`ser_no`, `FLOOR(x*100)/100` throughout, `point_tbl.d1..d7` → `points.weekday_mask` (7-bit), `p_ok`/`del_flg` → `invoices.status` enum (OPEN/PAID/CANCELLED), soft-cancel keeps INVOICE row.
- Legacy `casheer/` repo untouched (memory files only). Modern-app repos are siblings.
