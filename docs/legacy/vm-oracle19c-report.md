# VM environment report — `oracle19c`

Session: 2026-11-08 (Session 2). Probe: ad-hoc SSH + partial `vm_probe.sh` path (script's `where` loop not re-run; results captured inline).

## Reachability

- SSH alias: `oracle19c`.
- Reachable: **YES** via key-based auth, `BatchMode=yes` worked.

## Host identification

- OS: Microsoft Windows [Version 10.0.20348.587] → **Windows Server 2022**.
- Hostname: `WIN-GJPS8VJ6MF9`.

## Oracle installation

- Oracle Database **19c** at `C:\app\oracle\product\19c\dbhome_1`.
- `sqlplus`: Release 19.0.0.0.0 Version **19.3.0.0.0**.
- `imp.exe`: Release 19.0.0.0.0 Version **19.3.0.0.0** → **can read classic `exp` dumps from 7.3+, including the 9.2 `mhr.dmp`**. Resolves BLK-004 for the dump-import path.
- Other utilities present: `exp.exe`, `impdp.exe`, `expdp.exe`.
- `ORACLE_HOME` = `C:\app\oracle\product\19c\dbhome_1`.
- `TNS_ADMIN` not set as env var; default `%ORACLE_HOME%\network\admin\tnsnames.ora` used.

## Listener

- `lsnrctl status`: TNSLSNR 19.0.0.0.0, listening on `0.0.0.0:1521` + IPC. Uptime ~1h 35m at probe time. Start date 2026-11-08 10:53:05.

## Services / PDBs

- CDB: `ORCL` (dual instance names `ORCL` + `orcl`, lowercase status READY).
- Pluggables (`show pdbs` as SYSDBA):
  - `PDB$SEED` — READ ONLY (template, never used).
  - `DOBATPDB` — READ WRITE. Houses the unrelated military-HR project.
- **No Casheer / MAHROSA PDB** yet.

## `tnsnames.ora` content

Aliases defined:
- `ORCL` → SID `ORCL` (CDB root).
- `DOBATPDB` → SERVICE_NAME `DOBATPDB`.
- `DOBAT` → SERVICE_NAME `DOBATPDB` (Forms convenience alias).

## Forms / Reports

- No `frmcmp`, `frmf2xml`, `rwconverter` on PATH or in `19c\dbhome_1\bin` — DB-only host.

## Implications

- **VM selected for `mhr.dmp` import.** Needs: create an isolated PDB OR an isolated user inside a safe PDB + DB credential and user approval.
- Forms-extraction path still runs through `dobat12c_win_server`, not here.

## Unblocks / changes to blockers

- `BLK-004` — **CLOSED**. VM probed, `imp` available.
- New precondition for `BLK-003`: a landing-spot decision is needed before `imp show=y` runs. Options and tradeoffs recorded in `.agent/NEXT_ACTIONS.md` NXT-008.

## Safety confirmation

No DB logins performed against application schemas. `sqlplus / as sysdba` was invoked only for `show pdbs` (read-only) and exited cleanly. No files written on VM.
