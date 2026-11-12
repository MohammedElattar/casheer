# Form → report candidate invocations

Evidence: **INFERRED** — strings regex of quoted literals (`'<name>'`) intersected with the 25 report basenames from `analysis/inventory/reports.csv`. Precision limited: a quoted literal matching a report name may be a column alias, not a report call. Validation requires PL/SQL body recovery (BLK-005).

Forms with RUN_PRODUCT/RUN_REPORT_OBJECT builtin hits: **51**  
Forms with at least one candidate report reference: **26**

## Forms invoking reports (top 20 by report count)

| Form | Reports | List |
|---|---|---|
| `M_CASHEAR/rep_form.fmb` | 7 | categ_item, item_item, point_item, point_itemm, rep_item_rate, rep_points_fatra, rep_typ_rate |
| `M_CASHEAR/rep_form0.fmb` | 6 | categ_item, item_item, point_item, rep_item_rate, rep_points_fatra, rep_typ_rate |
| `M_CASHEAR/sery_last10-10.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/sery_last20.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/sery_inv.fmb` | 3 | invoice, invoice1, invoice_serial |
| `M_CASHEAR/sery_last.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/sery.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/takeaway_pizza.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/take_away_withoutStopDes After3-2014.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/sery_last12-10.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/take_away.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/sery_old.fmb` | 3 | invoice, invoice1, invoice_t |
| `M_CASHEAR/sery2.fmb` | 2 | invoice, invoice1 |
| `M_CASHEAR/sery - original.fmb` | 2 | invoice, invoice1 |
| `M_CASHEAR/seryehab.fmb` | 2 | invoice, invoice1 |
| `M_CASHEAR/sery_w.fmb` | 2 | invoice, invoice1 |
| `M_CASHEAR/take_away - Copy.fmb` | 2 | invoice, invoice1 |
| `M_CASHEAR/take_away_original - Copy.fmb` | 2 | invoice, invoice1 |
| `M_CASHEAR/takeaway_pizza_original.fmb` | 2 | invoice, invoice1 |
| `M_CASHEAR/sery_fki.fmb` | 2 | invoice, invoice1 |

## Reports with at least one candidate caller

| Report | Caller count | Sample caller |
|---|---|---|
| `invoice` | 23 | `M_CASHEAR/SQL/take_away.fmb` |
| `invoice1` | 21 | `M_CASHEAR/SQL/take_away.fmb` |
| `invoice_t` | 9 | `M_CASHEAR/sery.fmb` |
| `item_item` | 2 | `M_CASHEAR/rep_form.fmb` |
| `point_item` | 2 | `M_CASHEAR/rep_form.fmb` |
| `categ_item` | 2 | `M_CASHEAR/rep_form.fmb` |
| `rep_typ_rate` | 2 | `M_CASHEAR/rep_form.fmb` |
| `rep_points_fatra` | 2 | `M_CASHEAR/rep_form.fmb` |
| `rep_item_rate` | 2 | `M_CASHEAR/rep_form.fmb` |
| `rep_items` | 1 | `M_CASHEAR/s_LAYOUT_PRICE.fmb` |
| `invoice_serial` | 1 | `M_CASHEAR/sery_inv.fmb` |
| `point_itemm` | 1 | `M_CASHEAR/rep_form.fmb` |

Covered reports: 12 / 28. Uncovered reports may be invoked by literal names outside this strings window, or by variables.
