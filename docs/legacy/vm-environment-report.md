# VM environment report — `dobat12c_win_server`

Session: 2026-11-08. Probe script: `scripts/legacy-analysis/vm_probe.sh`. Raw output in session scratchpad (not committed).

## Reachability

- SSH alias: `dobat12c_win_server`.
- Reachable: **YES** (`BatchMode=yes` worked; key-based auth).
- SSH warns about non-post-quantum KEX — informational, not a blocker.

## Host identification

- OS: Microsoft Windows [Version 10.0.20348.587] → **Windows Server 2022**.
- Hostname: `MDPVWSHNOO26001`.
- User: `mdpvwshnoo26001\administrator` (full admin — note for approval policy).

## Oracle installations found

Two separate Oracle homes on the VM:

1. **Oracle Database 21c Express Edition** at `C:\app\oracle\product\21c\dbhomeXE` — **NOT 12c** as originally labeled. `sqlplus` is version `21.0.0.0.0 Release 21.3.0.0.0`. `tnsnames.ora` present in `network\admin\`.
2. **Oracle Fusion Middleware Oracle_Home** at `C:\Oracle\Middleware\Oracle_Home`. Exact Middleware version NOT yet read (needs `inventory\logs` or `opatch lsinventory` — deferred). Likely Forms 12c or 14c based on binary names; must verify next session.

User also mentioned a **second VM**: `ssh oracle19c` with Oracle 19c. Not yet probed. Flagged in `NEXT_ACTIONS.md`.

## Oracle Forms / Reports binaries

In `C:\Oracle\Middleware\Oracle_Home\bin\`:

- `frmbld.exe`, `frmbld-launch.cmd` — Forms Builder.
- `frmcmp.exe` — Forms compiler.
- `frmctrl.exe` — Forms server control.
- `frmweb.exe` — Forms web runtime.
- `frmd2f.dll`, `frmdig.dll`, `frmjapi.dll`, `frmw.dll` — supporting libraries.
- **No `frmf2xml.exe` and no `frmf2xml.bat` found anywhere under `C:\Oracle\`.** This is a toolchain gap for the master-prompt's XML extraction phase.

No Reports binaries (`rwconverter`, `rwbld60`, `rwrun60`) visible on PATH or in Middleware bin — not yet confirmed absent repo-wide; only searched `Middleware\Oracle_Home\bin`.

No `C:\devsuite` and no 6i-era binaries (`f60gen`, `ifbld60`, `ifrun60`) found by `where` or by recursive scan of `C:\*ifbld60*` / `C:\*f60gen*`.

## Prior reverse-engineering workspace (unrelated project)

- `C:\dobat\` contains a separate, larger Oracle Forms project (military/officer management: Arabic transliterations like `dobat`, `nashra`, `ferak`, `tanakolat`, `tahil`, `malafat`). **This is not Casheer.** ~700+ `.fmb` files in `C:\dobat\forms\`.
- `C:\dobat\_restore\test_frmcmp.ps1` shows a working `frmcmp.exe` compile recipe against `ELASASY.fmb` using DB user `dobat/dobat123@XEPDB1` and `module_type=form compile_all=yes batch=yes`.
- Some `_fmb.xml` files exist in `C:\dobat\forms\` (e.g. `AGAZAT_MARADY_fmb.xml`). Tool that produced them NOT yet identified. Candidates: Forms Builder JDAPI script, a custom wrapper, or an older `frmf2xml` that is no longer installed. **Investigate next session.**

## Forms 6i compatibility assessment

`VERIFIED` (local strings probe on `M_CASHEAR/cash_main.fmb`): version marker `ROS.60050` → **Oracle Forms 6.0.5**.

`BLOCKED`: whether Middleware `frmcmp.exe` (likely Forms 12c/14c) can open or upgrade a 6.0.5 `.fmb` is not yet tested. Oracle's documented upgrade path is 6i → 10g → 11g → 12c; direct 6i → 12c upgrade is often refused.

`VERIFIED`: no 6i Developer Suite install present on this VM.

## Database access

- `tnsnames.ora` exists at multiple paths; no probe attempted this session (requires credentials; `dobat/dobat123@XEPDB1` is a dobat project user, not Casheer).
- `mhr.dmp` is an Oracle 9.2 classic `exp` dump — see `docs/database/dump-header-notes.md`. **Importing to 21c XE will likely fail**; 19c may work.

## Blockers from this probe

Listed in `.agent/BLOCKERS.md` with IDs. Headline items:

- `BLK-001` — no `frmf2xml` → bulk `.fmb` → XML extraction blocked until either a Forms Builder-based script path is reconstructed or a 6i environment is sourced.
- `BLK-002` — Middleware version not read → tool compatibility verdict deferred.
- `BLK-003` — no credentials or schema on 21c for the Casheer domain (`MAHROSA` schema not yet confirmed to exist on any VM).
- `BLK-004` — `oracle19c` VM not probed.

## Safety confirmation

No DB logins performed. No files written on VM. No installs. No Casheer `.fmb` transferred to VM yet.
