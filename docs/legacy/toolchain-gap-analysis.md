# Toolchain gap analysis — Casheer legacy → modern

Session: 2026-11-08. Scope: identify what is required to extract source, schema, and behavior from the legacy artifacts, and what is missing.

## Legacy binary formats in repo

| Format | Count | Version evidence | Native tool | Status on host | Status on VM |
|---|---|---|---|---|---|
| `.fmb` (Forms source) | 63 | `ROS.60050` in `cash_main.fmb` → Forms 6.0.5 | Forms 6i Builder (`ifbld60`) / `frmcmp60` | ABSENT | ABSENT (no `devsuite`, no 6i binaries) |
| `.fmx` (Forms compiled) | 58 | derived from above | Forms 6i runtime (`f60run` / `ifrun60`) | ABSENT | ABSENT |
| `.rdf` (Reports source) | 25 | not yet probed | Reports 6i Builder / `rwconverter` | ABSENT | likely ABSENT (no `rwconverter`) |
| `.rep` (Reports compiled) | 25 | — | Reports 6i runtime (`rwrun60`) | ABSENT | ABSENT |
| `.pll` (PL/SQL libs) | 2 | — | Forms 6i Builder / `cvtform` | ABSENT | ABSENT |
| `.ogd` (Graphics) | 44 | — | Oracle Graphics Builder 6i | ABSENT | ABSENT |
| `.dmp` (Oracle dump) | 1 | `EXPORT:V09.02.00` → `exp` 9.2 | `imp` 9.2 / 10g / 11g | ABSENT | 21c `imp` present; **9.2 dump on 21c usually rejected**; try 19c |

## What is available

- `C:\Oracle\Middleware\Oracle_Home\bin\frmcmp.exe` on VM — Fusion Middleware Forms (version unread). Oracle supports upgrade from Forms 10g+, not direct 6i.
- `C:\Oracle\Middleware\Oracle_Home\bin\frmbld.exe` — Forms Builder GUI; has JDAPI (`frmjapi.dll`) which could drive scripted XML export, but JDAPI needs Java glue code not present.
- `C:\app\oracle\product\21c\dbhomeXE` — Oracle 21c XE DB, `sqlplus 21.3`.
- `oracle19c` VM — unprobed; may provide `imp` 19c (can read classic `exp` dumps from 7/8/9/10/11).
- Local `strings(1)` — gives ASCII/UCS-2 fragments of any binary; recovers trigger names, SQL fragments, version markers, but **not** compressed PL/SQL body text in 6i `.fmb`.

## What is missing

### `frmf2xml` (Forms source → XML)

Not installed on the VM. Alternatives, in order of expected reliability:

1. **Reconstruct from `C:\dobat\forms\*_fmb.xml`** — someone on this VM already produced XML. Locate the tool/script/batch that did it. If it was `frmf2xml.bat` from an older Forms 12c Weblogic install, the install may have been uninstalled but the binary could still be in another `Oracle_Home` or in archives.
2. **Forms 12c/14c Builder JDAPI** — write a small Java program using `oracle.forms.jdapi.*` from `frmjapi.dll` to walk a `FormModule` and emit XML. Requires JDK 1.8 (present on VM) + the JDAPI jar. Oracle 6i → 12c JDAPI compatibility is the open question.
3. **Source a 6i Developer Suite** — install on an isolated VM, upgrade `.fmb` to 10g format with `ifbld60`, then upgrade to 12c, then `frmf2xml`. Multi-VM chain, high effort.
4. **Binary-level reverse engineering** — `strings` + published `.fmb` format research. Recovers names and some text, loses PL/SQL. Only as supplement to above.

### Reports tool

- `rwconverter` absent. Same remediation chain as Forms: either a Reports 12c `rwconverter` with compatibility shims, or a 6i Reports install.

### PL/SQL library source

- `.pll` files require `cvtform` or Forms Builder to export procedure source. Hex inspection alone is not enough.

### Dump import path

- `mhr.dmp` is `exp 9.2`. 21c refuses most pre-11g dumps. 19c `imp` is the usual fallback. Must probe `oracle19c` VM next session.

## Recommended next tool-chain action

1. Probe `oracle19c` VM: `imp -V`, `sqlplus -V`, user approval for a trial read-only `imp show=y` of `mhr.dmp` to produce a table manifest.
2. On `dobat12c_win_server`, locate how `AGAZAT_MARADY_fmb.xml` was produced (`dir /s /b *.bat *.cmd *.ps1 *.jar` under `C:\dobat\`). If a working `frmf2xml` or JDAPI script surfaces, adopt it with user approval.
3. If (2) fails, write a small JDAPI loader against `frmjapi.dll` as a scripted probe on one Casheer `.fmb` — approval required (installs a `.jar` on VM).

## Items that do NOT need Oracle tooling

Even without any of the above, these tasks can proceed immediately in next sessions:

- Parse `M_CASHEAR/SQL/{views,trigger,sql1,yom_view,inv_update}.*` — plain-text SQL.
- Parse `المحروسة/MAHROSA_FULL_DRAWSQL_MYSQL.sql` — plain-text MySQL DDL.
- Diff the MySQL mirror against table names scraped from `mhr.dmp` strings.
- Bulk `strings` on every `.fmb` to build a form-level object inventory (names, buttons, triggers by title). Produce `analysis/extracted/forms/*.strings.txt` for all 63 forms.
- OCR / parse the `mahrosa-all (1).svg` schema diagram into table/column lists.
