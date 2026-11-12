# Form → table candidate dependencies

Scope: 166 form strings dumps intersected against the 192 authoritative tables in `docs/database/tables.md`.

Forms with at least one candidate table reference: **106**

Evidence: **INFERRED** — strings regex `(FROM|INTO|UPDATE|TABLE)\s+<NAME>` restricted to the 192-table catalog. False-negative risk is substantial because the regex sees only pre-split identifiers; PL/SQL bodies in `.fmb` are compressed and not fully covered by strings.

## Top 15 tables by number of referring forms

| Table | Referring forms |
|---|---|
| `ITEM_TYPE` | 73 |
| `POINT_TBL` | 68 |
| `ITEM_TBL` | 63 |
| `EMP_TBL` | 53 |
| `INV_DTL` | 43 |
| `INVOICE` | 38 |
| `INVOICE_HIST` | 35 |
| `ITEM_SUB_TYPE` | 16 |
| `DELIVERY` | 14 |
| `MEMB_TBL` | 12 |
| `SUB_DEPT` | 8 |
| `MONTH` | 8 |
| `SHIFT_TBL` | 8 |
| `ITEM_POINT` | 6 |
| `POINT_MANGER` | 6 |

## Per-form table candidates (top 30 by table count)

| Form | Tables | List (first 10) |
|---|---|---|
| `M_CASHEAR/امتداد عضوية  حتى شهر3/take_away.fmx` | 10 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/امتداد عضوية  حتى شهر3/take_away.fmb` | 10 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/sery_last10-10.fmb` | 9 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, POINT_MANGER, POINT_MEM, POINT_TBL |
| `M_CASHEAR/take_away_withoutStopDes After3-2014.fmx` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/sery_last20.fmb` | 9 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, POINT_MANGER, POINT_MEM, POINT_TBL |
| `M_CASHEAR/take_away_original - Copy.fmx` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/sery_last.fmb` | 9 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, POINT_MANGER, POINT_MEM, POINT_TBL |
| `M_CASHEAR/sery_last.fmx` | 9 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, POINT_MANGER, POINT_MEM, POINT_TBL |
| `M_CASHEAR/takeaway_pizza.fmx` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/takeaway_pizza.fmb` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/xtake_away.fmx` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/take_away - Copy.fmb` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/sery_last12-10.fmb` | 9 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, POINT_MANGER, POINT_MEM, POINT_TBL |
| `M_CASHEAR/take_away.fmb` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/take_away_original - Copy.fmb` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/sery_last_Bridge.fmx` | 9 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, POINT_MANGER, POINT_MEM, POINT_TBL |
| `M_CASHEAR/takeaway_pizza_original.fmb` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/SQL/take_away.fmx` | 9 | DELIVERY, EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_SUB_TYPE, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/sery2.fmb` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/seryehab.fmb` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/sery_w.fmb` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/sery_w.fmx` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/sery.fmx` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/sery_old.fmx` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/take_away.fmx` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/sery2.fmx` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/seryehab.fmx` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/امتداد عضوية  حتى شهر3/sery.fmx` | 8 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, MEMB_TBL, POINT_TBL |
| `M_CASHEAR/sery - original.fmb` | 7 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, POINT_TBL |
| `M_CASHEAR/sery_old.fmb` | 7 | EMP_TBL, INVOICE, INVOICE_HIST, INV_DTL, ITEM_TBL, ITEM_TYPE, POINT_TBL |

Full detail: `analysis/dependency-graphs/form-to-table.csv` (486 edges)
Diagram: `analysis/dependency-graphs/forms.mmd` (top-15 tables)
