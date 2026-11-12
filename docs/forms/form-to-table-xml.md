# Form↔Table dependency graph (XML-derived — authoritative)

**Source:** `analysis/normalized/xml-blocks.csv` + `analysis/normalized/xml-sql-statements.csv`. Supersedes `form-to-table.csv` (strings-derived).

**Edges:** 314  
**Distinct forms:** 43  
**Distinct tables/views referenced:** 85  
**Edge kinds:** BLOCK_DATA_SOURCE, SQL_SELECT/INSERT/UPDATE/DELETE/MERGE.  

## Top 30 tables by edge weight

| Table | Edges | In schema |
|---|---|---|
| `ITEM_TYPE` | 500 | yes |
| `EMP_TBL` | 339 | yes |
| `INVOICE` | 286 | yes |
| `INV_DTL` | 195 | yes |
| `POINT_TBL` | 173 | yes |
| `ROOM_VIEW` | 139 | no (view or unknown) |
| `MAHRMEMB` | 119 | no (view or unknown) |
| `ITEM_TBL` | 84 | yes |
| `INVOICE_HIST` | 75 | yes |
| `MEM_VIEW` | 70 | no (view or unknown) |
| `ITEM_SUB_TYPE` | 60 | yes |
| `DELIVERY` | 41 | yes |
| `MEMB_TBL` | 41 | yes |
| `POINT_MEM` | 30 | yes |
| `ITEM_PRICE_VIEW` | 24 | no (view or unknown) |
| `EMP_VIEW` | 23 | no (view or unknown) |
| `W_I_SERIAL` | 21 | no (view or unknown) |
| `MEMB_VIEW` | 17 | no (view or unknown) |
| `TABLE_VIEW` | 15 | no (view or unknown) |
| `NZL_VIEW` | 15 | no (view or unknown) |
| `ITEM_POINT` | 14 | yes |
| `EMPP_VIEW` | 14 | no (view or unknown) |
| `POINT_MANGER` | 14 | yes |
| `MEMB_BAR` | 14 | yes |
| `W_MEM_ID` | 13 | no (view or unknown) |
| `W_MSLSL` | 13 | no (view or unknown) |
| `MAIN_MEMB` | 12 | yes |
| `SUB_DEPT` | 10 | yes |
| `SHIFT_TBL` | 10 | yes |
| `BAR_VIEW` | 9 | no (view or unknown) |

## Top 30 forms by distinct tables touched

| Form | Distinct tables | Total edges |
|---|---|---|
| `SERY_LAST` | 25 | 778 |
| `TAKEAWAY_PIZZA` | 23 | 173 |
| `SERY` | 19 | 725 |
| `TAKE_AWAY` | 17 | 518 |
| `STAT_MONTH` | 11 | 16 |
| `STAT_YEAR` | 11 | 16 |
| `STAT_DAY` | 9 | 13 |
| `STATISTICS_FORM` | 9 | 13 |
| `C_ORDERS` | 8 | 17 |
| `YEAR_MONTH_STAT` | 8 | 14 |
| `CASHER` | 7 | 10 |
| `MTB_FORM` | 7 | 12 |
| `POINTS` | 6 | 9 |
| `YEAR_POINT_STAT` | 6 | 9 |
| `POINT_CLOSE` | 6 | 22 |
| `EMPLOYEE` | 5 | 6 |
| `ITEM_POINT` | 5 | 14 |
| `ITEM_TBL` | 5 | 6 |
| `ITEM_TBLL` | 5 | 7 |
| `YEAR_ITEM_STAT` | 5 | 6 |
| `POINT_CLOSE_TEMP` | 5 | 20 |
| `CATEG_MONTH` | 4 | 5 |
| `LAYOUT_PRICE` | 4 | 9 |
| `S_LAYOUT_PRICE` | 4 | 14 |
| `YEAR_CATEG_STAT` | 4 | 7 |
| `LOG_IN_IN` | 4 | 16 |
| `CATEG_YEAR_STAT` | 3 | 4 |
| `DAY_CATEG_VIEW` | 3 | 4 |
| `ITEM_SUB_TYPE` | 3 | 5 |
| `REP_FORM` | 3 | 6 |
