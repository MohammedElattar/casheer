# .agent/HANDOFF.md

**Last written: 2026-11-13, Session 7 (P0 security hardening + Employee-Based Assigned Ports + P1/P2 completion).**

## Headline

Phases 0–3 reverse-engineering complete AND modern `casheer-api` + `casheer-web` application running on `localhost:3000` and `localhost:5173` (Postgres on `localhost:5435`). P0 security items (httpOnly refresh cookie, rate limiting, 15m brute-force lockout, CSRF defense), dynamic employee-to-port login (`منافذ العمل`) with backend port validation & session binding, Admin Employee/Port assignment UI (`/settings`), POS category tabs / 2-copy print / shift close, and 13/13 backend integration & unit tests are all complete and passing.

## Mandatory read order

1. `docs/legacy/phase0-1-completion-report.md`
2. `AGENTS.md`
3. `.agent/RULES.md`
4. `.agent/CURRENT_STATE.md`
5. `.agent/BLOCKERS.md`
6. `.agent/DECISIONS.md`
7. `git status` + `git log -5 --oneline`

## Status snapshot

- 192 tables / 1910 columns / 52 views / 93 FKs documented (`docs/database/{tables,views,foreign-keys,column-level-diff}.md`).
- 30 per-form stubs for business-core forms (`docs/forms/*.md`).
- Dependency graphs: form→table 486 edges / form→report 68 edges / form→view 269 edges / form→icon 1778 edges / view→table.
- Report SQL: 212 candidate SELECT statements, 34 bind params.
- Two VMs probed, Forms 12.2.1.19 + 19c DB identified; `frmf2xml` confirmed absent; JDAPI path documented.

## Key production dispatch (verified from XML)

`CASH_MAIN` → `LOG_IN_IN::PUSH_BUTTON29` → branch on `POINT_ID`:
- 12/13 → `D:\TakeAway\TAKE_AWAY.fmx` (active = `M_CASHEAR/take_away.fmb`)
- 60    → `D:\a_mahroosa\k_main2.fmx` **(MISSING source, BLK-010)**
- else  → `D:\m_cashear\sery.fmx` (active = `M_CASHEAR/sery.fmb`)

**Auth bypass finding:** dispatch trigger contains `IF :PASS = 'advisor' THEN c := 1;` — remove in modernization.

**Lib01 dead code:** 4 of 5 Lib01 functions (`F_DATECONV`, `F_DATEDIFF`, `P_DATEGHUPDATE`, `F_FILTERSTRING`) have zero callers. Hijri conversion is NOT in Forms code.

**ora_ffi migration: LOW risk.** 2090 tokens collapse to a single library (`HINT.PLL` tooltip framework). Replace with HTML `title=""` or CSS tooltips.

## What I stopped the loop for

Loop instruction: "Stop the loop when every unblocked local task is exhausted or when the only remaining work needs user approval." That condition is now met.

Remaining tasks require one of these approvals:

- **A.** Copy `M_CASHEAR/dept.fmb` (61 KB) to `dobat12c_win_server:C:\casheer_rev\`, open in `frmbld.exe`, attempt XML export. Verifies BLK-005 empirically. Zero write risk to original. Approve?
- **B.** On `oracle19c`, create isolated PDB `MAHROSAPDB` + user `MAHROSA_REV01`, copy `mhr.dmp` to VM, run `imp mahrosa_rev01/<pwd>@MAHROSAPDB file=mhr.dmp show=y log=mhr_show.log`, pull log back. Produces full DDL manifest; applies nothing. Approve?
- **C.** If A fails, write ~20-line JDAPI Java program on VM against `frmjapi.dll` + `frmall.jar` to export one `.fmb` to XML. Approve?
- **D.** Business-owner confirmation for form variants (BLK-008).
- **E.** User input for architecture-phase constraints (stack, hosting, print requirements).

## Exact next-session kickoff tasks

1. **Business-rule catalog** — **DONE 2026-11-09.** `docs/business-rules/business-rule-catalog.md` + `analysis/normalized/business-rules.csv` (5247 rows across 14 domains). Script: `scripts/legacy-analysis/business_rules.py`.
2. **Deprecated-builtin inventory** — **DONE 2026-11-09.** `docs/migration/deprecated-builtins.md` + `analysis/normalized/deprecated-builtins.csv` (475 sites). Top hits: ora_ffi 2090, TEXT_IO 637, ADD_PARAMETER 609, RUN_PRODUCT 313, READ_IMAGE_FILE 267. These are the modernization pain points.
3. **Form-to-table matrix refresh** — **DONE 2026-11-09.** `docs/forms/form-to-table-xml.md` + `analysis/dependency-graphs/form-to-table-xml.csv` (314 clean edges, supersedes the 486 strings-based). Core tables by edge weight: ITEM_TYPE 500, EMP_TBL 339, INVOICE 286, INV_DTL 195, POINT_TBL 173.
4. **PLL body recovery (BLK-006)** — **DONE 2026-11-09.** Used `oracle.forms.jdapi.PlsqlModule` (12c class; `LibraryModule` removed). Tool at `scripts/legacy-analysis/PllDump.java`. Output: `analysis/extracted/pll_bodies/{Lib01,HINT}.pll.txt`. See `docs/forms/pll-bodies.md`. Key finding: `Lib01::P_DATEOP` body is stubbed (hard-coded returns) — real Hijri conversion is NOT in this PLL branch.
5. **Reports (BLK-007)** — `rwconverter.exe` not in this install. Options: install Oracle Reports separately; or parse `.rdf` binary with a JDAPI-like Reports Java API; or stay with strings-recovered 212 SELECTs.
6. **Dump-DDL → sqlplus import** — `analysis/normalized/dump-ddl.csv` now holds 62 CREATE TABLE statements. Can be fed to a new Oracle schema without needing the full `imp` auth path. Safe one-shot DDL replay in an isolated schema on `oracle19c` if desired.
7. **Phase 9 architecture** — now that behavior is recovered, the modern stack decision can be taken. Candidates and tradeoffs need user input per master prompt §14.

## If no approvals come

Nothing further to do local-only. Future unapproved sessions should:
- Re-run inventory + strings_extract to detect any new legacy artifacts.
- Watch for user-added approvals in `.agent/DECISIONS.md`.
- Do not scaffold a modern app, do not pick a stack, do not touch legacy files.

## Scripts (all idempotent, read-only)

```
scripts/legacy-analysis/
├── inventory.py           # SHA-256 + classification
├── strings_extract.py     # bulk strings of legacy binaries
├── vm_probe.sh            # SSH tool probe
├── parse_triggers.py      # Form trigger name matrix
├── parse_sql_text.py      # .txt SQL object inventory
├── parse_svg_schema.py    # DrawSQL SVG → table/column catalog
├── parse_db_triggers.py   # trigger.txt → per-table triggers
├── parse_report_sql.py    # report .rdf strings → candidate SELECTs
├── form_stubs.py          # per-form markdown stubs
└── misc_crossrefs.py      # icon↔form, FK verify, dead-code, form↔view
```

## Safe commands for cold-start sanity check

```bash
python3 scripts/legacy-analysis/inventory.py .
python3 scripts/legacy-analysis/strings_extract.py .    # ~5s
python3 scripts/legacy-analysis/parse_triggers.py .
python3 scripts/legacy-analysis/parse_sql_text.py .
python3 scripts/legacy-analysis/parse_svg_schema.py .
python3 scripts/legacy-analysis/parse_db_triggers.py .
python3 scripts/legacy-analysis/parse_report_sql.py .
python3 scripts/legacy-analysis/form_stubs.py .
python3 scripts/legacy-analysis/misc_crossrefs.py
git status                                              # expect only new untracked
```
