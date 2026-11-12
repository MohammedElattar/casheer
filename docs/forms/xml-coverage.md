# XML extraction coverage — Forms 12.2.1 Forms2XML output

XML files parsed: **65**  
Total triggers: **4859** (with body: 4859)  
Total program units: **382**  
Total blocks: **490**  
Total items: **8174**  
SQL statements extracted: **2274**

## Top 20 forms by SQL statement count

| Form | Triggers | SQL stmts | Items | Blocks | PU |
|---|---|---|---|---|---|
| `SERY_LAST` | 177 | 122 | 322 | 20 | 8 |
| `SERY_LAST` | 177 | 122 | 322 | 20 | 8 |
| `SERY_LAST` | 175 | 118 | 322 | 20 | 8 |
| `SERY_LAST` | 175 | 118 | 322 | 20 | 8 |
| `SERY_LAST` | 173 | 110 | 316 | 20 | 8 |
| `SERY_LAST` | 173 | 110 | 316 | 20 | 8 |
| `SERY` | 174 | 103 | 316 | 20 | 8 |
| `TAKE_AWAY` | 165 | 89 | 280 | 15 | 8 |
| `TAKEAWAY_PIZZA` | 162 | 89 | 280 | 16 | 8 |
| `TAKE_AWAY` | 165 | 88 | 280 | 15 | 8 |
| `SERY` | 152 | 85 | 266 | 15 | 8 |
| `TAKE_AWAY` | 155 | 78 | 260 | 12 | 8 |
| `TAKE_AWAY` | 155 | 78 | 260 | 12 | 8 |
| `TAKE_AWAY` | 155 | 78 | 264 | 12 | 8 |
| `TAKE_AWAY` | 156 | 77 | 263 | 12 | 8 |
| `TAKEAWAY_PIZZA` | 150 | 72 | 259 | 12 | 8 |
| `SERY` | 149 | 71 | 249 | 12 | 8 |
| `SERY` | 149 | 70 | 249 | 12 | 8 |
| `SERY` | 149 | 70 | 249 | 12 | 8 |
| `SERY` | 149 | 70 | 249 | 12 | 8 |

## Base tables referenced by blocks (DMLDataTargetName)

| Table | Blocks |
|---|---|
| `INVOICE` | 49 |
| `INV_DTL` | 48 |
| `ITEM_PRICE_VIEW` | 24 |
| `EMP_VIEW` | 23 |
| `TABLE_VIEW` | 15 |
| `NZL_VIEW` | 15 |
| `EMPP_VIEW` | 14 |
| `ITEM_TBL` | 9 |
| `inv_VIEW` | 8 |
| `TEL_VIEW` | 8 |
| `ITEM_TYPE` | 6 |
| `POINT_TBL` | 5 |
| `ITEM_POINT` | 3 |
| `JOB_TBL` | 2 |
| `DEPT_TBL` | 2 |
| `SUB_DEPT` | 2 |
| `CATEG_VIEW` | 2 |
| `ITEM_SUB_TYPE` | 2 |
| `ITEM_COMPONENT` | 2 |
| `ITEM_CATEG_VIEW` | 2 |
| `ITEM_CATEG_POINT_VIEW` | 2 |
| `ITEM_TYP` | 1 |
| `INVOICE_hist` | 1 |
| `INV_DTL_hist` | 1 |
| `ITEM_CATEG_MONTH_VIEW` | 1 |
| `CATEG_YEAR_VIEW` | 1 |
| `ITEM_CATEG_YEAR_VIEW` | 1 |
| `DAY_CATEG_VIEW` | 1 |
| `DAY_ITEM_CATEG_VIEW` | 1 |
| `DELIVERY` | 1 |

## Tables referenced by SQL statements (top 30)

| Table | Stmts |
|---|---|
| `ITEM_TYPE` | 494 |
| `INVOICE` | 237 |
| `EMP_TBL` | 236 |
| `POINT_TBL` | 168 |
| `INV_DTL` | 147 |
| `ITEM_TBL` | 75 |
| `INVOICE_HIST` | 74 |
| `ITEM_SUB_TYPE` | 58 |
| `DELIVERY` | 40 |
| `POINT_MEM` | 30 |
| `POINT_MANGER` | 14 |
| `ITEM_POINT` | 11 |
| `MEMB_TBL` | 11 |
| `SHIFT_TBL` | 10 |
| `MONTH` | 9 |
| `SUB_DEPT` | 8 |
| `EMP_POINT` | 5 |
| `DEPT_TBL` | 4 |
| `INV_DTL_HIST` | 2 |
| `ITEM_COMPONENT` | 2 |
| `PRODUCTS` | 2 |
| `MAIN_MEMB` | 1 |
| `JOB_TBL` | 1 |
| `INVOICE_DEL` | 1 |
| `INV_DTL_DEL` | 1 |
