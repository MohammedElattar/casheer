# Reports extraction coverage (REX via rwconverter 12.2.1.19)

**Source:** `analysis/extracted/reports_rex/*.rex`. Produced by `C:\Oracle\Middleware\Oracle_Home\bin\rwconverter.exe STYPE=rdffile DTYPE=rexfile`. Parsed by `scripts/legacy-analysis/parse_rex.py`.

**Reports converted:** 24 (from 25 `.rdf` originals; 1 collision).  
**Queries recovered:** 28  
**Column aliases:** 357  
**Groups:** 55  
**Parameters:** 0

## Top tables referenced across reports

| Table | In schema | References |
|---|---|---|
| `INVOICE` | yes | 12 |
| `INVOICE_HIST` | yes | 5 |
| `HGZ_TBL_PHOTOS` | no | 4 |
| `ITEM_TYPE` | yes | 2 |
| `POINT_TBL` | yes | 2 |
| `PATION_TBL` | no | 1 |
| `HGZ_TBL` | no | 1 |
| `POINT_CAP_VIEW` | no | 1 |

## Per-report summary

| Report | Queries | Columns | Groups | Params | Tables |
|---|---|---|---|---|---|
| `cash_invoice` | 1 | 24 | 2 | 0 | INVOICE |
| `categ_item` | 1 | 7 | 3 | 0 | INVOICE |
| `invoice` | 1 | 20 | 2 | 0 | INVOICE |
| `invoice1` | 1 | 19 | 2 | 0 | INVOICE |
| `invoice_dl` | 1 | 20 | 2 | 0 | INVOICE |
| `invoice_dl_s` | 1 | 20 | 2 | 0 | INVOICE |
| `invoice_new` | 1 | 19 | 2 | 0 | INVOICE |
| `invoice_prod` | 1 | 6 | 2 | 0 | INVOICE_HIST |
| `invoice_serial` | 1 | 10 | 2 | 0 | INVOICE_HIST |
| `invoice_serial_b` | 1 | 10 | 2 | 0 | INVOICE_HIST |
| `invoice_t` | 1 | 15 | 2 | 0 | INVOICE |
| `invoice_take` | 1 | 18 | 2 | 0 | INVOICE |
| `invoice_xx` | 1 | 20 | 2 | 0 | INVOICE |
| `invoicee` | 1 | 19 | 2 | 0 | INVOICE |
| `item_item` | 1 | 7 | 3 | 0 | INVOICE |
| `kart` | 1 | 5 | 2 | 0 | PATION_TBL |
| `pation_kard` | 5 | 73 | 5 | 0 | HGZ_TBL;HGZ_TBL_PHOTOS |
| `point_item` | 1 | 7 | 3 | 0 | INVOICE_HIST |
| `point_itemm` | 1 | 7 | 3 | 0 | INVOICE_HIST |
| `rep_item_rate` | 1 | 6 | 2 | 0 | ITEM_TYPE |
| `rep_items` | 1 | 7 | 3 | 0 | POINT_TBL |
| `rep_points` | 1 | 12 | 3 | 0 | POINT_CAP_VIEW |
| `rep_points_fatra` | 1 | 2 | 1 | 0 | POINT_TBL |
| `rep_typ_rate` | 1 | 4 | 1 | 0 | ITEM_TYPE |
