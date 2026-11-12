# .agent/BLOCKERS.md

Each entry: ID, state, blocked task, what resolves it, who/what is needed.

## BLK-001 — Forms source → XML — **CLOSED 2026-11-08**

- State: CLOSED.
- Resolution: `oracle.forms.util.xmltools.Forms2XML` found in `C:\Oracle\Middleware\Oracle_Home\jlib\frmxmltools.jar`. Invoked directly via Java with full classpath (`frmxmltools.jar` + `frmjdapi.jar` + `frmbld.jar` + `frmbipc.jar` + `frmall.jar` + `xmlparserv2.jar`). Bulk converted all 63 Casheer `.fmb` → XML on `dobat12c_win_server` — 65 XML outputs (some renamed duplicates) now in `analysis/extracted/forms_xml/` (11 MB total). **4859 triggers with full PL/SQL bodies**, 382 program units, 490 blocks, 8174 items, 2274 SQL statements extracted. See `docs/forms/xml-coverage.md`.

## BLK-002 — Oracle Fusion Middleware version on VM — CLOSED 2026-11-08

- State: CLOSED.
- Finding: `registry.xml` lists **`Oracle Forms Reports 12.2.1.19.0`** + `WebLogic Server for FMW 12.2.1.4.0`. Forms 12c PS3 July-2023 bundle.
- Implication: Oracle Forms 12c officially supports upgrading `.fmb` from Forms 10g or later only. Direct 6.0.5 → 12.2.1 is unsupported. `frmcmp`/`frmbld` is expected to refuse Casheer `.fmb`. See `BLK-005`.

## BLK-003 — no Casheer DB credentials — **CLOSED N/A 2026-11-09**

- State: CLOSED (no-op).
- Resolution: user confirmed there is no running Casheer DB. The `mhr.dmp` (2004) is historical reference only. No live schema to inspect, no production cutover to plan — this is a **greenfield rebuild**. Schema recovery via dump-DDL byte-parse + MySQL mirror + SVG is sufficient as spec.

## BLK-004 — `oracle19c` VM unprobed — CLOSED 2026-11-08

- State: CLOSED.
- Finding: VM reachable, Windows Server 2022, Oracle 19.3.0.0.0 DB at `C:\app\oracle\product\19c\dbhome_1`. `imp.exe` 19.3 present — can read classic `exp` dumps from 7.3+ including the 9.2 `mhr.dmp`. Listener up on 1521. PDBs: `DOBATPDB` only (no Casheer / MAHROSA PDB). See `docs/legacy/vm-oracle19c-report.md`.

## BLK-005 — Forms 6.0.5 → Forms 12.2.1 upgrade — **CLOSED 2026-11-08**

- State: CLOSED.
- Finding: Forms 12.2.1.19 **accepts** Forms 6.0.5 modules directly. Empirical probe via `frmcmp.exe` on `dept.fmb` with `logon=no batch=yes compile_all=yes` compiled 3 of 4 default Forms procedures cleanly (`CHECK_PACKAGE_FAILURE`, `QUERY_MASTER_DETAILS`, `CLEAR_ALL_MASTER_DETAILS`). One failure: `P_RUNREPORT` references deprecated built-in `RUN_PRODUCT` (removed after Forms 9i). This is an **API compat issue in CODE**, not a format incompatibility.
- SHA-256 of `dept.fmb` on VM after compile matches repo original byte-exact — no in-place rewrite.
- Follow-on task for the modernization: build a mechanical-fix list of deprecated built-in calls (`RUN_PRODUCT` → `RUN_REPORT_OBJECT`, `WIN_API_*` variants, etc.) by greping `xml-triggers.csv` and `xml-program-units.csv` bodies. These are the real portability issues.

## BLK-006 — PL/SQL library (`.pll`) extraction — **CLOSED 2026-11-09**

- State: CLOSED.
- Resolution: wrote `scripts/legacy-analysis/PllDump.java` using JDAPI `oracle.forms.jdapi.PlsqlModule` (12c class; `LibraryModule` was removed). Reused pre-existing JDK 1.8 + JDAPI toolkit at `C:\navy\jdapi\` on `dobat12c_win_server` (installed for an unrelated project, same jar works). Extracted both `.pll` files: `Lib01.pll` (4 PUs, project-specific) and `HINT.PLL` (13 PUs, generic 1994 Oracle demo tooltip library using `ora_ffi`). Results in `analysis/extracted/pll_bodies/`. Full write-up: `docs/forms/pll-bodies.md`.
- Finding of note: `Lib01.pll::P_DATEOP` body is a stub — `F_DATEDIFF` returns `1`, `F_DATECONV` returns `'01-01-1421'`. Hijri conversion logic is missing from this library branch. Needs business-owner confirmation on where real conversion lives (DB side, or different library version).

## BLK-007 — `.rdf` / `.rep` Reports extraction — **CLOSED 2026-11-09**

- State: CLOSED.
- Resolution: `rwconverter.exe` found at `C:\Oracle\Middleware\Oracle_Home\bin\rwconverter.exe` (`where /r` didn't find it initially; `powershell Get-ChildItem -Recurse` did — the `bin\` directory wasn't a top-level child of Oracle_Home visible via `dir`). Converted all 25 `.rdf` → 24 unique `.rex` (one basename collision from a duplicate in `المحروسة/`) via `STYPE=rdffile DTYPE=rexfile BATCH=YES OVERWRITE=YES`. Pulled to `analysis/extracted/reports_rex/`. Parsed via `scripts/legacy-analysis/parse_rex.py`:
  - 28 queries with full SELECT text → `analysis/normalized/rex-queries.csv`
  - 357 column aliases (alias / expr / desc_expr) → `rex-columns.csv`
  - 55 groups → `rex-groups.csv`
  - Top tables: INVOICE (12 reports), INVOICE_HIST (5), HGZ_TBL_PHOTOS (4), ITEM_TYPE (2), POINT_TBL (2).
  - Coverage doc: `docs/reports/rex-coverage.md`.
- Caveat: parameter extraction regex returned 0 hits (parameters ARE present, e.g. `NAME=<<"PRINTJOB">>`, `NAME=<<"MODE">>` — regex too strict). Non-blocking.

## BLK-009 — `HINT.PLL` format-version mismatch — CLOSED 2026-11-08

- State: CLOSED.
- Finding (`docs/legacy/pll-comparison.md`): `HINT.PLL` is a generic Forms-4.5-era **mouse-hover tooltip library** (13 procs: `BUTTONHELPTIMER`, `DISPLAYHINT`, `SHOWBUTTONHELP`, `HIDEBUTTONHELP`, `MOUSE_ITEM_IS_ICONIC_BUTTON`, `MOUSE_ITEM_LABEL`, `MOUSE_WINDOW`, `ON_WINDOWS`, `RELATIVE_HINT_POS`, `SHOWBUTTONHELPHANDLER`, `SYNC_MOUSE_INFO`, `I_DISPLAYHINT`, `HINT`). Older `ROS.20102` marker is consistent with a well-known reusable library imported unchanged — not a project defect. `Lib01.pll` (`ROS.60050`) carries date utilities (`F_DATECONV`, `F_DATEDIFF`, `F_FILTERSTRING`, `P_DATEGHUPDATE`, `P_DATEOP`, `P_EXIT`) specific to this project.

## BLK-008 — Active-vs-historical form variant resolution — **RESOLVED (technical) 2026-11-09**

- State: RESOLVED pending business sign-off.
- Resolution: XML call-graph + direct inspection of `LOG_IN_IN::PUSH_BUTTON29::WHEN-BUTTON-PRESSED` dispatch. Production target is literal `CALL_FORM('D:\m_cashear\sery', ...)` and `CALL_FORM('D:\TakeAway\TAKE_AWAY', ...)`. **Active variants: `M_CASHEAR/sery.fmb`, `M_CASHEAR/take_away.fmb`.** All other `sery*` (14 copies) and `take_away*`/`takeaway_pizza*` (7 copies) files are historical/WIP. See `docs/forms/dispatch-and-entry-points.md` + `docs/forms/variant-decision.md` + `analysis/dependency-graphs/form-to-form.csv`.
- **Finding of note (auth bypass):** the dispatch trigger contains `IF :PASS = 'advisor' THEN c := 1;` — a hard-coded password back-door. Must be dropped in modernization.
- Pending: business-owner confirmation before deleting dormant copies (keep in-repo for now; variant list in `docs/forms/variant-decision.md`).

## BLK-010 — Missing `.fmb` source files — OPEN

- State: OPEN.
- Discovery: inter-form call graph + form→report graph revealed missing artifacts:
  - FORMS (`.fmb`): `K_MAIN`, `K_MAIN2` (kitchen flow — `D:\a_mahroosa\k_main2.fmx` dispatched for POINT_ID=60); `COUNTRY`, `HI_GAREEMA`, `MED_CODES`, `MED_REASON`, `RES109_CODES`, `WAR_CODES` (medical/warning code lookups — called by both CASH_MAIN and S_MAIN).
  - REPORTS (`.rdf`/`.rep`): `INVOICE_NEW_MIN` (42 calls — the "small/defer" invoice printout), `EMP01` (16 calls — employee report). Called from the SERY/TAKE_AWAY print flow and other forms but not in `M_CASHEAR/`.
- Blocks: full recovery of kitchen branch; master-data lookup forms incomplete.
- Resolution: ask business owner for `D:\a_mahroosa\` and the `M_CASHEAR`-sibling `.fmb` files. Likely under a different subdirectory on the production machine.
