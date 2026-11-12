# Inter-form call graph (XML-derived)

**Source:** CALL_FORM/OPEN_FORM/NEW_FORM/GO_FORM literals in trigger & PU bodies across 65 XMLs.  
**Edges:** 319  
**Forms with incoming calls:** 39  
**Forms with outgoing calls:** 45  
**Forms with NO incoming call** (menu-launched or orphan): 31

## Verb breakdown

- `CALL_FORM`: 351 total calls, 319 distinct edges

## Variant resolution (BLK-008)

For each stem with 2+ form copies, list which are reached by incoming calls (candidate active) vs none (candidate dormant).

| Stem | Variant | Incoming calls | Outgoing calls | Verdict |
|---|---|---|---|---|
| `REP_FORM` | `REP_FORM` | 1 | 7 | **reached** |
| `REP_FORM` | `REP_FORM0` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY` | 3 | 14 | **reached** |
| `SERY` | `SERY2` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERYEHAB` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_FKI` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_INV` | 0 | 6 | orphan (but acts as root) |
| `SERY` | `SERY_LAST` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_LAST10-10` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_LAST10_10` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_LAST12-10` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_LAST12_10` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_LAST20` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_OLD` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY_W` | 0 | 7 | orphan (but acts as root) |
| `SERY` | `SERY___ORIGINAL` | 0 | 7 | orphan (but acts as root) |
| `TAKE_AWAY` | `TAKEAWAY_PIZZA` | 0 | 9 | orphan (but acts as root) |
| `TAKE_AWAY` | `TAKEAWAY_PIZZA_ORIGINAL` | 0 | 9 | orphan (but acts as root) |
| `TAKE_AWAY` | `TAKE_AWAY` | 2 | 27 | **reached** |
| `TAKE_AWAY` | `TAKE_AWAY_ORIGINAL___COPY` | 0 | 9 | orphan (but acts as root) |
| `TAKE_AWAY` | `TAKE_AWAY_WITHOUTSTOPDES_AFTER3_2014` | 0 | 9 | orphan (but acts as root) |
| `TAKE_AWAY` | `TAKE_AWAY___COPY` | 0 | 9 | orphan (but acts as root) |

## Top callers (outgoing)

| Form | Outgoing calls |
|---|---|
| `TAKE_AWAY` | 27 |
| `STATISTICS_FORM` | 16 |
| `CASH_MAIN` | 14 |
| `SERY` | 14 |
| `S_MAIN` | 13 |
| `ITEM_SUB_TYPE` | 9 |
| `TAKE_AWAY___COPY` | 9 |
| `TAKE_AWAY_ORIGINAL___COPY` | 9 |
| `TAKE_AWAY_WITHOUTSTOPDES_AFTER3_2014` | 9 |
| `TAKEAWAY_PIZZA` | 9 |
| `TAKEAWAY_PIZZA_ORIGINAL` | 9 |
| `LOG_IN_IN` | 8 |
| `REP_FORM0` | 7 |
| `REP_FORM` | 7 |
| `SERY2` | 7 |
| `SERY___ORIGINAL` | 7 |
| `SERY_FKI` | 7 |
| `SERY_LAST10-10` | 7 |
| `SERY_LAST10_10` | 7 |
| `SERY_LAST12-10` | 7 |

## Top callees (incoming)

| Form | Incoming calls | In repo |
|---|---|---|
| `MED_CODES` | 45 | no |
| `MED_REASON` | 45 | no |
| `WAR_CODES` | 45 | no |
| `COUNTRY` | 45 | no |
| `RES109_CODES` | 45 | no |
| `HI_GAREEMA` | 45 | no |
| `POINT_CLOSE_TEMP` | 22 | yes |
| `S_LAYOUT_PRICE` | 9 | yes |
| `DELV` | 8 | yes |
| `ITEM_TBL` | 4 | yes |
| `EMPLOYEE` | 3 | yes |
| `SERY` | 3 | yes |
| `SUB_ITEM` | 2 | yes |
| `ITEM_TBLL` | 2 | yes |
| `ITEM_POINT` | 2 | yes |
| `TAKE_AWAY` | 2 | yes |
| `POINTS` | 2 | yes |
| `DEPT` | 1 | yes |
| `JOBS` | 1 | yes |
| `LAYOUT_PRICE` | 1 | yes |
| `LOG_IN_IN` | 1 | yes |
| `K_MAIN` | 1 | no |
| `K_MAIN2` | 1 | no |
| `POINT_CLOSE` | 1 | yes |
| `S_SUB_ITEM` | 1 | yes |
| `STATISTICS_FORM` | 1 | yes |
| `REP_FORM` | 1 | yes |
| `C_ORDERS` | 1 | yes |
| `MTB_FORM` | 1 | yes |
| `STAT_DAY` | 1 | yes |

## Potential root / menu-launched forms (zero incoming edges)

These forms have NO incoming CALL_FORM in the recovered code. Either they are launched from the Forms runtime config (menu, URL, root), or they are dead code.

| Form | Outgoing calls |
|---|---|
| `CASH_MAIN` | 14 |
| `ITEM_SUB_TYPE` | 9 |
| `ITEM_TYP` | 0 |
| `ITEM_TYPE` | 0 |
| `JOB` | 0 |
| `MANAGER` | 0 |
| `NAT_TBL` | 6 |
| `REP_FORM0` | 7 |
| `RIKONEW` | 0 |
| `SERY2` | 7 |
| `SERYEHAB` | 7 |
| `SERY_FKI` | 7 |
| `SERY_INV` | 6 |
| `SERY_LAST` | 7 |
| `SERY_LAST10-10` | 7 |
| `SERY_LAST10_10` | 7 |
| `SERY_LAST12-10` | 7 |
| `SERY_LAST12_10` | 7 |
| `SERY_LAST20` | 7 |
| `SERY_OLD` | 7 |
| `SERY_W` | 7 |
| `SERY___ORIGINAL` | 7 |
| `SUB_DEPT` | 0 |
| `S_MAIN` | 13 |
| `TAKEAWAY_PIZZA` | 9 |
| `TAKEAWAY_PIZZA_ORIGINAL` | 9 |
| `TAKE_AWAY_ORIGINAL___COPY` | 9 |
| `TAKE_AWAY_WITHOUTSTOPDES_AFTER3_2014` | 9 |
| `TAKE_AWAY___COPY` | 9 |
| `TEMPLET` | 0 |
| `TEST` | 0 |
