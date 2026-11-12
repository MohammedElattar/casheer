# CRUD matrix (form × table × operation)

**Source:** `analysis/dependency-graphs/form-to-table-xml.csv`. Pivoted by `scripts/legacy-analysis/crud_matrix.py`.

**Tables covered:** 85  
**In-schema tables:** 28

## Per-table write-vs-read summary (top 40 by total activity)

| Table | In schema | Writers (forms) | Readers (forms) | Total writes | Total reads | Primary writer |
|---|---|---|---|---|---|---|
| `ITEM_TYPE` | yes | 0 | 25 | 0 | 500 | `—` |
| `EMP_TBL` | yes | 0 | 11 | 0 | 339 | `—` |
| `INVOICE` | yes | 4 | 9 | 31 | 255 | `SERY_LAST` |
| `INV_DTL` | yes | 7 | 6 | 72 | 123 | `SERY` |
| `POINT_TBL` | yes | 0 | 21 | 0 | 173 | `—` |
| `ROOM_VIEW` | no | 0 | 5 | 0 | 139 | `—` |
| `MAHRMEMB` | no | 0 | 5 | 0 | 119 | `—` |
| `ITEM_TBL` | yes | 3 | 19 | 3 | 81 | `LAYOUT_PRICE` |
| `INVOICE_HIST` | yes | 4 | 7 | 19 | 56 | `SERY_LAST` |
| `MEM_VIEW` | no | 0 | 5 | 0 | 70 | `—` |
| `ITEM_SUB_TYPE` | yes | 0 | 6 | 0 | 60 | `—` |
| `DELIVERY` | yes | 2 | 3 | 8 | 33 | `TAKE_AWAY` |
| `MEMB_TBL` | yes | 0 | 4 | 0 | 41 | `—` |
| `POINT_MEM` | yes | 0 | 2 | 0 | 30 | `—` |
| `ITEM_PRICE_VIEW` | no | 0 | 5 | 0 | 24 | `—` |
| `EMP_VIEW` | no | 0 | 4 | 0 | 23 | `—` |
| `W_I_SERIAL` | no | 0 | 2 | 0 | 21 | `—` |
| `MEMB_VIEW` | no | 0 | 2 | 0 | 17 | `—` |
| `NZL_VIEW` | no | 0 | 2 | 0 | 15 | `—` |
| `TABLE_VIEW` | no | 0 | 2 | 0 | 15 | `—` |
| `ITEM_POINT` | yes | 3 | 3 | 6 | 8 | `ITEM_POINT` |
| `EMPP_VIEW` | no | 0 | 2 | 0 | 14 | `—` |
| `POINT_MANGER` | yes | 0 | 2 | 0 | 14 | `—` |
| `MEMB_BAR` | yes | 0 | 2 | 0 | 14 | `—` |
| `W_MEM_ID` | no | 0 | 2 | 0 | 13 | `—` |
| `W_MSLSL` | no | 0 | 2 | 0 | 13 | `—` |
| `MAIN_MEMB` | yes | 0 | 3 | 0 | 12 | `—` |
| `SHIFT_TBL` | yes | 0 | 5 | 0 | 10 | `—` |
| `SUB_DEPT` | yes | 1 | 4 | 1 | 9 | `SUB_DEPT` |
| `BAR_VIEW` | no | 0 | 2 | 0 | 9 | `—` |
| `MONTH` | yes | 0 | 4 | 0 | 9 | `—` |
| `INV_VIEW` | no | 0 | 2 | 0 | 8 | `—` |
| `TEL_VIEW` | no | 0 | 2 | 0 | 8 | `—` |
| `DEPT_TBL` | yes | 0 | 3 | 0 | 6 | `—` |
| `EMP_POINT` | yes | 1 | 2 | 1 | 5 | `EMPLOYEE` |
| `CATEG_VIEW` | no | 0 | 3 | 0 | 5 | `—` |
| `ITEM_COMPONENT` | yes | 2 | 2 | 2 | 2 | `ITEM_TBL` |
| `INV_DTL_HIST` | yes | 1 | 2 | 1 | 2 | `C_ORDERS` |
| `JOB_TBL` | yes | 0 | 3 | 0 | 3 | `—` |
| `DAY_VIEW` | no | 0 | 2 | 0 | 3 | `—` |

## Full per-table detail (top 20 tables)


### `ITEM_TYPE`  (in_schema=yes; writes 0, reads 500)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 180 | 0 | 0 | 0 | 0 | 0 |
| `SERY_LAST` | 120 | 0 | 0 | 0 | 0 | 0 |
| `TAKE_AWAY` | 120 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 40 | 0 | 0 | 0 | 0 | 0 |
| `STAT_DAY` | 5 | 0 | 0 | 0 | 0 | 0 |
| `STAT_YEAR` | 4 | 0 | 0 | 0 | 0 | 0 |
| `CATEG_MONTH` | 2 | 0 | 0 | 0 | 0 | 0 |
| `CATEG_YEAR_STAT` | 2 | 0 | 0 | 0 | 0 | 0 |
| `DAY_CATEG_VIEW` | 2 | 0 | 0 | 0 | 0 | 0 |
| `LAYOUT_PRICE` | 1 | 0 | 0 | 0 | 0 | 1 |
| `REP_FORM` | 2 | 0 | 0 | 0 | 0 | 0 |
| `STAT_MONTH` | 2 | 0 | 0 | 0 | 0 | 0 |
| `SUB_ITEM` | 1 | 0 | 0 | 0 | 0 | 1 |
| `S_LAYOUT_PRICE` | 1 | 0 | 0 | 0 | 0 | 1 |
| `S_SUB_ITEM` | 1 | 0 | 0 | 0 | 0 | 1 |
| `YEAR_CATEG_STAT` | 2 | 0 | 0 | 0 | 0 | 0 |
| `YEAR_MONTH_STAT` | 2 | 0 | 0 | 0 | 0 | 0 |
| `YEAR_POINT_STAT` | 2 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_POINT` | 0 | 0 | 0 | 0 | 0 | 1 |
| `ITEM_SUB_TYPE` | 1 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_TBL` | 1 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_TBLL` | 1 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_TYPE` | 0 | 0 | 0 | 0 | 0 | 1 |
| `STATISTICS_FORM` | 1 | 0 | 0 | 0 | 0 | 0 |
| `YEAR_ITEM_STAT` | 1 | 0 | 0 | 0 | 0 | 0 |

### `EMP_TBL`  (in_schema=yes; writes 0, reads 339)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 112 | 0 | 0 | 0 | 0 | 0 |
| `SERY_LAST` | 104 | 0 | 0 | 0 | 0 | 0 |
| `TAKE_AWAY` | 75 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 27 | 0 | 0 | 0 | 0 | 0 |
| `LOG_IN_IN` | 8 | 0 | 0 | 0 | 0 | 0 |
| `C_ORDERS` | 5 | 0 | 0 | 0 | 0 | 0 |
| `POINT_CLOSE` | 2 | 0 | 0 | 0 | 0 | 0 |
| `POINT_CLOSE_TEMP` | 2 | 0 | 0 | 0 | 0 | 0 |
| `S_MAIN` | 2 | 0 | 0 | 0 | 0 | 0 |
| `CASHER` | 1 | 0 | 0 | 0 | 0 | 0 |
| `EMPLOYEE` | 0 | 0 | 0 | 0 | 0 | 1 |

### `INVOICE`  (in_schema=yes; writes 31, reads 255)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY_LAST` | 70 | 0 | 24 | 0 | 0 | 12 |
| `SERY` | 68 | 0 | 1 | 0 | 0 | 18 |
| `TAKE_AWAY` | 36 | 0 | 0 | 0 | 0 | 12 |
| `TAKEAWAY_PIZZA` | 13 | 0 | 0 | 0 | 0 | 4 |
| `POINT_CLOSE` | 10 | 0 | 2 | 1 | 0 | 0 |
| `POINT_CLOSE_TEMP` | 9 | 0 | 2 | 1 | 0 | 0 |
| `CASHER` | 0 | 0 | 0 | 0 | 0 | 1 |
| `MTB_FORM` | 0 | 0 | 0 | 0 | 0 | 1 |
| `TEST` | 0 | 0 | 0 | 0 | 0 | 1 |

### `INV_DTL`  (in_schema=yes; writes 72, reads 123)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 29 | 9 | 0 | 17 | 0 | 18 |
| `SERY_LAST` | 30 | 6 | 0 | 12 | 0 | 12 |
| `TAKE_AWAY` | 12 | 0 | 0 | 18 | 0 | 12 |
| `TAKEAWAY_PIZZA` | 4 | 0 | 0 | 6 | 0 | 4 |
| `CASHER` | 0 | 1 | 0 | 1 | 0 | 1 |
| `MTB_FORM` | 0 | 0 | 0 | 1 | 0 | 1 |
| `POINT_CLOSE` | 0 | 0 | 1 | 0 | 0 | 0 |

### `POINT_TBL`  (in_schema=yes; writes 0, reads 173)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY_LAST` | 84 | 0 | 0 | 0 | 0 | 0 |
| `SERY` | 39 | 0 | 0 | 0 | 0 | 0 |
| `TAKE_AWAY` | 18 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 6 | 0 | 0 | 0 | 0 | 0 |
| `STAT_MONTH` | 5 | 0 | 0 | 0 | 0 | 0 |
| `POINT_CLOSE` | 2 | 0 | 0 | 0 | 0 | 0 |
| `POINT_CLOSE_TEMP` | 2 | 0 | 0 | 0 | 0 | 0 |
| `REP_FORM` | 2 | 0 | 0 | 0 | 0 | 0 |
| `STAT_YEAR` | 2 | 0 | 0 | 0 | 0 | 0 |
| `YEAR_MONTH_STAT` | 2 | 0 | 0 | 0 | 0 | 0 |
| `CASHER` | 1 | 0 | 0 | 0 | 0 | 0 |
| `C_ORDERS` | 1 | 0 | 0 | 0 | 0 | 0 |
| `EMPLOYEE` | 1 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_POINT` | 0 | 0 | 0 | 0 | 0 | 1 |
| `LAYOUT_PRICE` | 0 | 0 | 0 | 0 | 0 | 1 |
| `MTB_FORM` | 0 | 0 | 0 | 0 | 0 | 1 |
| `POINTS` | 0 | 0 | 0 | 0 | 0 | 1 |
| `STATISTICS_FORM` | 1 | 0 | 0 | 0 | 0 | 0 |
| `STAT_DAY` | 1 | 0 | 0 | 0 | 0 | 0 |
| `S_LAYOUT_PRICE` | 0 | 0 | 0 | 0 | 0 | 1 |
| `YEAR_POINT_STAT` | 1 | 0 | 0 | 0 | 0 | 0 |

### `ROOM_VIEW`  (in_schema=no; writes 0, reads 139)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 54 | 0 | 0 | 0 | 0 | 0 |
| `SERY_LAST` | 36 | 0 | 0 | 0 | 0 | 0 |
| `TAKE_AWAY` | 36 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 12 | 0 | 0 | 0 | 0 | 0 |
| `C_ORDERS` | 1 | 0 | 0 | 0 | 0 | 0 |

### `MAHRMEMB`  (in_schema=no; writes 0, reads 119)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 39 | 0 | 0 | 0 | 0 | 0 |
| `SERY_LAST` | 38 | 0 | 0 | 0 | 0 | 0 |
| `TAKE_AWAY` | 35 | 0 | 0 | 0 | 0 | 0 |
| `C_ORDERS` | 4 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 3 | 0 | 0 | 0 | 0 | 0 |

### `ITEM_TBL`  (in_schema=yes; writes 3, reads 81)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 18 | 0 | 0 | 0 | 0 | 0 |
| `SERY_LAST` | 14 | 0 | 0 | 0 | 0 | 0 |
| `TAKE_AWAY` | 12 | 0 | 0 | 0 | 0 | 0 |
| `S_LAYOUT_PRICE` | 4 | 0 | 0 | 1 | 0 | 1 |
| `ITEM_POINT` | 3 | 0 | 0 | 0 | 0 | 2 |
| `TAKEAWAY_PIZZA` | 4 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_SUB_TYPE` | 2 | 0 | 0 | 0 | 0 | 1 |
| `LAYOUT_PRICE` | 1 | 0 | 0 | 1 | 0 | 1 |
| `SUB_ITEM` | 1 | 0 | 0 | 1 | 0 | 1 |
| `S_SUB_ITEM` | 2 | 0 | 0 | 0 | 0 | 1 |
| `CASHER` | 2 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_TBLL` | 1 | 0 | 0 | 0 | 0 | 1 |
| `MTB_FORM` | 2 | 0 | 0 | 0 | 0 | 0 |
| `REP_FORM` | 2 | 0 | 0 | 0 | 0 | 0 |
| `C_ORDERS` | 1 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_TBL` | 0 | 0 | 0 | 0 | 0 | 1 |
| `STATISTICS_FORM` | 1 | 0 | 0 | 0 | 0 | 0 |
| `YEAR_ITEM_STAT` | 1 | 0 | 0 | 0 | 0 | 0 |
| `YEAR_MONTH_STAT` | 1 | 0 | 0 | 0 | 0 | 0 |

### `INVOICE_HIST`  (in_schema=yes; writes 19, reads 56)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY_LAST` | 18 | 0 | 12 | 0 | 0 | 0 |
| `SERY` | 18 | 0 | 3 | 0 | 0 | 0 |
| `TAKE_AWAY` | 12 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 5 | 0 | 0 | 0 | 0 | 0 |
| `POINT_CLOSE` | 1 | 0 | 2 | 0 | 0 | 0 |
| `POINT_CLOSE_TEMP` | 1 | 0 | 2 | 0 | 0 | 0 |
| `C_ORDERS` | 0 | 0 | 0 | 0 | 0 | 1 |

### `MEM_VIEW`  (in_schema=no; writes 0, reads 70)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 40 | 0 | 0 | 0 | 0 | 0 |
| `TAKE_AWAY` | 18 | 0 | 0 | 0 | 0 | 0 |
| `SERY_LAST` | 8 | 0 | 0 | 0 | 0 | 0 |
| `C_ORDERS` | 2 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 2 | 0 | 0 | 0 | 0 | 0 |

### `ITEM_SUB_TYPE`  (in_schema=yes; writes 0, reads 60)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `TAKE_AWAY` | 46 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 10 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_POINT` | 0 | 0 | 0 | 0 | 0 | 1 |
| `ITEM_SUB_TYPE` | 0 | 0 | 0 | 0 | 0 | 1 |
| `ITEM_TBL` | 1 | 0 | 0 | 0 | 0 | 0 |
| `ITEM_TBLL` | 1 | 0 | 0 | 0 | 0 | 0 |

### `DELIVERY`  (in_schema=yes; writes 8, reads 33)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `TAKE_AWAY` | 24 | 6 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 8 | 2 | 0 | 0 | 0 | 0 |
| `DELV` | 0 | 0 | 0 | 0 | 0 | 1 |

### `MEMB_TBL`  (in_schema=yes; writes 0, reads 41)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY_LAST` | 24 | 0 | 0 | 0 | 0 | 0 |
| `SERY` | 9 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 6 | 0 | 0 | 0 | 0 | 0 |
| `TAKE_AWAY` | 2 | 0 | 0 | 0 | 0 | 0 |

### `POINT_MEM`  (in_schema=yes; writes 0, reads 30)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY_LAST` | 26 | 0 | 0 | 0 | 0 | 0 |
| `SERY` | 4 | 0 | 0 | 0 | 0 | 0 |

### `ITEM_PRICE_VIEW`  (in_schema=no; writes 0, reads 24)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 0 | 0 | 0 | 0 | 0 | 9 |
| `SERY_LAST` | 0 | 0 | 0 | 0 | 0 | 6 |
| `TAKE_AWAY` | 0 | 0 | 0 | 0 | 0 | 6 |
| `TAKEAWAY_PIZZA` | 0 | 0 | 0 | 0 | 0 | 2 |
| `CASHER` | 0 | 0 | 0 | 0 | 0 | 1 |

### `EMP_VIEW`  (in_schema=no; writes 0, reads 23)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 0 | 0 | 0 | 0 | 0 | 9 |
| `SERY_LAST` | 0 | 0 | 0 | 0 | 0 | 6 |
| `TAKE_AWAY` | 0 | 0 | 0 | 0 | 0 | 6 |
| `TAKEAWAY_PIZZA` | 0 | 0 | 0 | 0 | 0 | 2 |

### `W_I_SERIAL`  (in_schema=no; writes 0, reads 21)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY_LAST` | 18 | 0 | 0 | 0 | 0 | 0 |
| `SERY` | 3 | 0 | 0 | 0 | 0 | 0 |

### `MEMB_VIEW`  (in_schema=no; writes 0, reads 17)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY_LAST` | 16 | 0 | 0 | 0 | 0 | 0 |
| `TAKEAWAY_PIZZA` | 1 | 0 | 0 | 0 | 0 | 0 |

### `NZL_VIEW`  (in_schema=no; writes 0, reads 15)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 0 | 0 | 0 | 0 | 0 | 9 |
| `SERY_LAST` | 0 | 0 | 0 | 0 | 0 | 6 |

### `TABLE_VIEW`  (in_schema=no; writes 0, reads 15)

| Form | SELECT | INSERT | UPDATE | DELETE | MERGE | BLOCK |
|---|---|---|---|---|---|---|
| `SERY` | 0 | 0 | 0 | 0 | 0 | 9 |
| `SERY_LAST` | 0 | 0 | 0 | 0 | 0 | 6 |

## Write-only tables (potential logs / audit)

Tables with writes but no reads anywhere in forms source. Prime candidates for append-only logs.

| Table | In schema | Writers | Writes |
|---|---|---|---|

## Read-only tables (lookups / masters)

Tables with reads but no writes in forms. Likely master/reference data populated by seed scripts or DB-side logic.

| Table | In schema | Readers | Reads |
|---|---|---|---|
| `ITEM_TYPE` | yes | 25 | 500 |
| `EMP_TBL` | yes | 11 | 339 |
| `POINT_TBL` | yes | 21 | 173 |
| `ROOM_VIEW` | no | 5 | 139 |
| `MAHRMEMB` | no | 5 | 119 |
| `MEM_VIEW` | no | 5 | 70 |
| `ITEM_SUB_TYPE` | yes | 6 | 60 |
| `MEMB_TBL` | yes | 4 | 41 |
| `POINT_MEM` | yes | 2 | 30 |
| `ITEM_PRICE_VIEW` | no | 5 | 24 |
| `EMP_VIEW` | no | 4 | 23 |
| `W_I_SERIAL` | no | 2 | 21 |
| `MEMB_VIEW` | no | 2 | 17 |
| `NZL_VIEW` | no | 2 | 15 |
| `TABLE_VIEW` | no | 2 | 15 |
| `EMPP_VIEW` | no | 2 | 14 |
| `POINT_MANGER` | yes | 2 | 14 |
| `MEMB_BAR` | yes | 2 | 14 |
| `W_MEM_ID` | no | 2 | 13 |
| `W_MSLSL` | no | 2 | 13 |
| `MAIN_MEMB` | yes | 3 | 12 |
| `SHIFT_TBL` | yes | 5 | 10 |
| `BAR_VIEW` | no | 2 | 9 |
| `MONTH` | yes | 4 | 9 |
| `INV_VIEW` | no | 2 | 8 |
| `TEL_VIEW` | no | 2 | 8 |
| `DEPT_TBL` | yes | 3 | 6 |
| `CATEG_VIEW` | no | 3 | 5 |
| `JOB_TBL` | yes | 3 | 3 |
| `DAY_VIEW` | no | 2 | 3 |
| `YEAR_VIEW` | no | 2 | 3 |
| `CATEG_YEAR_VIEW` | no | 2 | 2 |
| `PRODUCTS` | yes | 2 | 2 |
| `POINT_INV_VIEW` | no | 1 | 2 |
| `POINT_WRDIA_VIEW` | no | 1 | 2 |
| `POINT_YOM_VIEW` | no | 1 | 2 |
| `DTL_VIEW` | no | 2 | 2 |
| `MONTH_VIEW` | no | 2 | 2 |
| `POINT_VIEW` | no | 2 | 2 |
| `ITEM_CATEG_VIEW` | no | 2 | 2 |
| `ITEM_CATEG_POINT_VIEW` | no | 2 | 2 |
| `ITEM_CATEG_MONTH_VIEW` | no | 1 | 1 |
| `ITEM_CATEG_YEAR_VIEW` | no | 1 | 1 |
| `DAY_CATEG_VIEW` | no | 1 | 1 |
| `DAY_ITEM_CATEG_VIEW` | no | 1 | 1 |
| `ITEM_TYP` | no | 1 | 1 |
| `MANG_TBL` | yes | 1 | 1 |
| `NAT_TBL` | yes | 1 | 1 |
| `POINT_CAP_VIEW` | no | 1 | 1 |
| `I_T_DAY_VIEW` | no | 1 | 1 |
| `I_T_D_S_VIEW` | no | 1 | 1 |
| `TDAY_VIEW` | no | 1 | 1 |
| `T_DAY_VIEW` | no | 1 | 1 |
| `T_D_S_VIEW` | no | 1 | 1 |
| `ITEM_M_C_VIEW` | no | 1 | 1 |
| `I_T_M_S_VIEW` | no | 1 | 1 |
| `MONTH_CATEG_VIEW` | no | 1 | 1 |
| `PMONTH_VIEW` | no | 1 | 1 |
| `TMONTH_VIEW` | no | 1 | 1 |
| `TPMONTH_VIEW` | no | 1 | 1 |
| `T_M_S_VIEW` | no | 1 | 1 |
| `CATEG_POINT_YEAR_VIEW` | no | 1 | 1 |
| `CAT_P_I_Y_VIEW` | no | 1 | 1 |
| `PYEAR_CATEG_VIEW` | no | 1 | 1 |
| `PYEAR_I_CAT_VIEW` | no | 1 | 1 |
| `PYEAR_VIEW` | no | 1 | 1 |
| `TPYEAR_VIEW` | no | 1 | 1 |
| `TYEAR_VIEW` | no | 1 | 1 |
| `ITEM_YEAR_VIEW` | no | 1 | 1 |
| `ITEM_POINT_CATEG_VIEW` | no | 1 | 1 |
| `YEAR_MONTH_VIEW` | no | 1 | 1 |
| `CATEG_POINT_VIEW` | no | 1 | 1 |
