# Report SQL coverage — strings-derived

Reports scanned: **50**  
Candidate SELECT/WITH statements captured: **212**  
Distinct authoritative tables referenced: **6**  
Distinct bind-parameter names (`:name`): **34**

Evidence: **INFERRED**. Strings re-assembly of `.rdf`/`.rep` bytes is lossy; precise statement boundaries and whitespace cannot be recovered. Use this as a starting map; final verification requires `rwconverter` (BLK-007).

## Tables referenced by reports (distinct, matched against authoritative 192)

- `EMP_TBL`
- `HAGZ_TBL`
- `INVOICE`
- `INVOICE_HIST`
- `ITEM_TYPE`
- `POINT_TBL`

## Bind parameters (34)

- `:A`
- `:B1`
- `:B2`
- `:B3`
- `:B4`
- `:COURIER`
- `:DB`
- `:DE`
- `:DELV`
- `:DEL_FLG`
- `:DO`
- `:EMP`
- `:EMP_CODE`
- `:G`
- `:H_NO`
- `:II_CODE`
- `:INV_DT`
- `:INV_TYP`
- `:KASM`
- `:KASMAGEL`
- `:MADF_TYP`
- `:MDIR`
- `:MDNY`
- `:MEM_NAME`
- `:MEM_NAMEE`
- `:MEM_SERIAL`
- `:MSH`
- `:NG`
- `:PT_CODE`
- `:P_D`
- `:P_I`
- `:SER_NO`
- `:SHIFT_T`
- `:T_CODE`

## Per-report summary

| Report | Stmts | Tables | Params |
|---|---|---|---|
| `M_CASHEAR/SQL/invoice_serial.RDF` | 36 | INVOICE_HIST | B1, B2, B3, B4 … |
| `M_CASHEAR/SQL/invoice_serial.rep` | 16 | INVOICE_HIST | B1, B2, B3, B4 … |
| `M_CASHEAR/cash_invoice.RDF` | 3 | EMP_TBL, HAGZ_TBL, INVOICE | B1, EMP_CODE, H_NO, INV_DT … |
| `M_CASHEAR/cash_invoice.rep` | 2 | EMP_TBL, HAGZ_TBL, INVOICE | B1, INV_DT, PT_CODE, SER_NO |
| `M_CASHEAR/categ_item.RDF` | 1 | INVOICE | DB, DE, T_CODE |
| `M_CASHEAR/categ_item.rep` | 1 | INVOICE | DB, DE, T_CODE |
| `M_CASHEAR/invoice.RDF` | 4 | EMP_TBL, HAGZ_TBL, INVOICE | B1, EMP_CODE, H_NO, INV_DT … |
| `M_CASHEAR/invoice.rep` | 1 | EMP_TBL, HAGZ_TBL | B1 |
| `M_CASHEAR/invoice1.RDF` | 3 | EMP_TBL, HAGZ_TBL, INVOICE | B1, EMP_CODE, H_NO, INV_DT … |
| `M_CASHEAR/invoice_dl.RDF` | 3 | EMP_TBL, HAGZ_TBL, INVOICE | B1, EMP_CODE, H_NO, INV_DT … |
| `M_CASHEAR/invoice_dl.rep` | 1 | EMP_TBL, HAGZ_TBL | B1 |
| `M_CASHEAR/invoice_dl_last.rep` | 1 | EMP_TBL, HAGZ_TBL | B1 |
| `M_CASHEAR/invoice_dl_s.RDF` | 3 | EMP_TBL, HAGZ_TBL, INVOICE | B1, EMP_CODE, H_NO, INV_DT … |
| `M_CASHEAR/invoice_dl_s.rep` | 1 | EMP_TBL, HAGZ_TBL | B1 |
| `M_CASHEAR/invoice_new.RDF` | 8 | EMP_TBL, HAGZ_TBL, INVOICE | B1, EMP_CODE, H_NO, INV_DT … |
| `M_CASHEAR/invoice_new.rep` | 4 | EMP_TBL, HAGZ_TBL, INVOICE | B1, COURIER, INV_DT, MEM_NAMEE … |
| `M_CASHEAR/invoice_prod.RDF` | 1 | INVOICE_HIST | EMP_CODE, INV_DT, PT_CODE, SHIFT_T |
| `M_CASHEAR/invoice_prod.rep` | 1 | INVOICE_HIST | EMP_CODE, INV_DT, PT_CODE, SHIFT_T |
| `M_CASHEAR/invoice_serial.RDF` | 37 | INVOICE_HIST | B1, B2, B3, B4 … |
| `M_CASHEAR/invoice_serial.rep` | 15 | INVOICE_HIST | B1, B2, B3, B4 … |
| `M_CASHEAR/invoice_serial_b.RDF` | 29 | INVOICE_HIST | A, B1, B2, B3 … |
| `M_CASHEAR/invoice_serial_b.rep` | 19 | INVOICE_HIST | B1, B2, B3, B4 … |
| `M_CASHEAR/invoice_sss.rep` | 1 | EMP_TBL, HAGZ_TBL | B1 |
| `M_CASHEAR/invoice_t.RDF` | 1 | INVOICE | INV_DT, PT_CODE, SER_NO |
| `M_CASHEAR/invoice_t.rep` | 1 | INVOICE | INV_DT, PT_CODE, SER_NO |
| `M_CASHEAR/invoice_take.RDF` | 0 |  |  |
| `M_CASHEAR/invoice_take.rep` | 0 |  |  |
| `M_CASHEAR/invoice_w.rep` | 1 | EMP_TBL, HAGZ_TBL | B1 |
| `M_CASHEAR/invoice_xx.RDF` | 3 | EMP_TBL, HAGZ_TBL, INVOICE | B1, EMP_CODE, H_NO, INV_DT … |
| `M_CASHEAR/invoicee.RDF` | 3 | EMP_TBL, HAGZ_TBL, INVOICE | B1, EMP_CODE, H_NO, INV_DT … |
| `M_CASHEAR/invoicee.rep` | 1 | EMP_TBL, HAGZ_TBL | B1 |
| `M_CASHEAR/item_item.RDF` | 1 | INVOICE | DB, DE, II_CODE |
| `M_CASHEAR/item_item.rep` | 1 | INVOICE | DB, DE, II_CODE |
| `M_CASHEAR/kart.RDF` | 1 |  |  |
| `M_CASHEAR/p_anal_gen_ck2.rep` | 0 |  |  |
| `M_CASHEAR/pation_kard.RDF` | 2 |  | P_D, P_I |
| `M_CASHEAR/pation_kard.rep` | 2 |  | P_D, P_I |
| `M_CASHEAR/point_item.RDF` | 0 |  |  |
| `M_CASHEAR/point_item.rep` | 0 |  |  |
| `M_CASHEAR/point_itemm.RDF` | 0 |  |  |
| `M_CASHEAR/point_itemm.rep` | 0 |  |  |
| `M_CASHEAR/rep_item_rate.RDF` | 1 | ITEM_TYPE | DB, DE |
| `M_CASHEAR/rep_item_rate.rep` | 1 | ITEM_TYPE | DB, DE |
| `M_CASHEAR/rep_items.RDF` | 0 |  |  |
| `M_CASHEAR/rep_points.rdf` | 0 |  |  |
| `M_CASHEAR/rep_points.rep` | 0 |  |  |
| `M_CASHEAR/rep_points_fatra.RDF` | 1 | POINT_TBL | DB, DE |
| `M_CASHEAR/rep_points_fatra.rep` | 1 | POINT_TBL | DB, DE |
| `M_CASHEAR/rep_typ_rate.RDF` | 0 |  |  |
| `M_CASHEAR/rep_typ_rate.rep` | 0 |  |  |

Full detail: `analysis/normalized/report-sql.csv`
