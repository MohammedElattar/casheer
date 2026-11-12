# Entry points, root forms, and runtime dispatch (VERIFIED from XML)

## Confirmed roots (never CALL_FORMed by anything, only call others)

Two true "menu/launcher" roots exist in the recovered code:

| Form | Outgoing | Purpose |
|---|---|---|
| `CASH_MAIN` | 12 edges → DEPT, EMPLOYEE (3×), JOBS, LAYOUT_PRICE, **LOG_IN_IN**, SUB_ITEM, COUNTRY†, HI_GAREEMA†, MED_CODES†, MED_REASON†, RES109_CODES†, WAR_CODES† | Admin / HR / master-data hub |
| `S_MAIN` | 13 edges → C_ORDERS, ITEM_POINT, MTB_FORM, REP_FORM, STATISTICS_FORM, S_LAYOUT_PRICE, S_SUB_ITEM, COUNTRY†, HI_GAREEMA†, MED_CODES†, MED_REASON†, RES109_CODES†, WAR_CODES† | Statistics / reports hub |

† = **missing from repo** (see BLK-010).

## Production dispatch — the critical trigger

File: `M_CASHEAR/log_in_in.fmb` → XML `analysis/extracted/forms_xml/log_in_in__973ed0_fmb.xml`  
Location: `LOG_IN_IN::BLK.PUSH_BUTTON29::WHEN-BUTTON-PRESSED`

After authenticating (`SELECT COUNT(*) FROM EMP_TBL WHERE EMP_ID=:EMP_ID AND EMP_PASS=:PASS`) and verifying the employee is allowed on this POINT+SHIFT (`SELECT COUNT(*) FROM emp_point WHERE EMP_ID=:EMP_ID AND point_code=:blk.point_id AND shift_typ=:wrd`), the active branch dispatches:

```plsql
IF :POINT_ID IN (12, 13) THEN
    CALL_FORM('D:\TakeAway\TAKE_AWAY',  HIDE, NO_REPLACE, NO_QUERY_ONLY, LIST_ID);
ELSIF :POINT_ID IN (60) THEN
    CALL_FORM('D:\a_mahroosa\k_main2',  HIDE, NO_REPLACE, NO_QUERY_ONLY, LIST_ID);
ELSE
    CALL_FORM('D:\m_cashear\sery',      HIDE, NO_REPLACE, NO_QUERY_ONLY, LIST_ID);
END IF;
```

Parameter list `LIST_ID` carries `dt` (login date), `e_id` (employee), `pt_code` (point_id), `wrdia` (shift). Plus global `:global.prnt := :prnt`.

**POINT_ID → form routing table:**

| POINT_ID | Dispatch target | Path | Repo status |
|---|---|---|---|
| 12 | `TAKE_AWAY` | `D:\TakeAway\TAKE_AWAY.fmx` | `M_CASHEAR/take_away.fmb` (**ACTIVE variant**) |
| 13 | `TAKE_AWAY` | same | same |
| 60 | `k_main2` | `D:\a_mahroosa\k_main2.fmx` | **MISSING** |
| anything else | `sery` | `D:\m_cashear\sery.fmx` | `M_CASHEAR/sery.fmb` (**ACTIVE variant**) |

**Verdict on BLK-008:**

- `sery.fmb` is the deployed version. Fourteen other `sery*.fmb` files (`sery_last*`, `sery_old`, `sery_fki`, `sery_inv`, `sery_w`, `sery2`, `seryehab`, `sery___original`) are **NOT invoked at runtime**. They are historical/WIP copies. The `sery_last*` family has more features (SQL≈120 vs SERY's ≈103) and is likely a stalled refactor branch.
- `take_away.fmb` is the deployed version. Five other `take_away*.fmb` + 2 `takeaway_pizza*.fmb` files are historical/WIP. `takeaway_pizza*` was likely a pizza-shop-specific adaptation that was never menu-wired.

## Pre-production dispatch versions (archaeology)

The LOG_IN_IN trigger body carries TWO earlier versions in `/* ... */` comment blocks:

**Version A** (oldest, commented-out at top of trigger body):  
A simpler path: no parameter list, directly hard-coded to `CALL_FORM('k_main', ...)` when `POINT_ID = 60`. Uses `:global.*` only (no param list). Suggests the shift parameter-passing refactor is a later change.

**Version B** (middle, commented-out):  
```plsql
IF :POINT_ID not in (12, 13) THEN
    CALL_FORM('D:\m_cashear\sery',    HIDE, NO_REPLACE, NO_QUERY_ONLY, LIST_ID);
ELSE
    CALL_FORM('D:\TakeAway\TAKE_AWAY', HIDE, NO_REPLACE, NO_QUERY_ONLY, LIST_ID);
END IF;
```

Pre-kitchen version. Only two branches. The `POINT_ID = 60` → `k_main2` branch was added after this.

**Password bypass changed:** oldest `IF :PASS = 'مراقب'` (Arabic for "monitor/supervisor"), middle `IF :PASS = 'advisor'`, current `IF :PASS = 'advisor'`. The Arabic password was replaced with the English literal `'advisor'` (most likely for keyboard-layout convenience). **This is an auth bypass worth flagging during migration** — modernization must drop this hard-coded back-door.

## Arabic encoding caveat

Trigger bodies are stored in Forms XML as Cp1256 (Arabic Windows codepage) bytes that get represented as Unicode escape sequences when viewed as "UTF-8" — so Arabic strings appear as mojibake like `ØªØ§Ø±ÙŠØ®` (which is Cp1256 bytes for `تاريخ` = "date"). Any migration code must decode via `bytes.decode('cp1256')` or `bytes.decode('windows-1256')` when reading trigger bodies, not UTF-8.

## Entry-point summary

```
boot
 ├── CASH_MAIN     (admin: departments, employees, jobs, master-data)
 │    └── LOG_IN_IN     (auth + shift selection)
 │         ├── POINT_ID 12/13  ──► TAKE_AWAY.fmx
 │         ├── POINT_ID 60     ──► k_main2.fmx   [MISSING]
 │         └── else            ──► sery.fmx
 └── S_MAIN        (reports: statistics, MTB, REP_FORM, item points)
```

The relationship between CASH_MAIN and S_MAIN (whether one launches the other, or both are reachable from a startup menu) is NOT visible in the recovered code. Needs business-owner / `formsweb.cfg` inspection on the deployment machine.
