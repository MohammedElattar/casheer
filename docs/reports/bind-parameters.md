# Report bind-parameter catalog

Distinct parameter names across 25 report sources: **34**

Evidence: strings-derived from `analysis/normalized/report-sql.csv`. Oracle Reports uses `:name` lexical binds; same lexeme in two reports is highly likely the same semantic parameter (operators follow naming conventions), but final confirmation needs `rwconverter` output.

## Shared parameters (used by ≥ 2 reports)

| Parameter | Reports | Used by |
|---|---|---|
| `:B1` | 13 | cash_invoice, invoice, invoice1, invoice_dl, invoice_dl_last, invoice_dl_s, invoice_new, invoice_serial, invoice_serial_b, invoice_sss, invoice_w, invoice_xx, invoicee |
| `:INV_DT` | 12 | cash_invoice, invoice, invoice1, invoice_dl, invoice_dl_s, invoice_new, invoice_prod, invoice_serial, invoice_serial_b, invoice_t, invoice_xx, invoicee |
| `:PT_CODE` | 12 | cash_invoice, invoice, invoice1, invoice_dl, invoice_dl_s, invoice_new, invoice_prod, invoice_serial, invoice_serial_b, invoice_t, invoice_xx, invoicee |
| `:EMP_CODE` | 11 | cash_invoice, invoice, invoice1, invoice_dl, invoice_dl_s, invoice_new, invoice_prod, invoice_serial, invoice_serial_b, invoice_xx, invoicee |
| `:SER_NO` | 9 | cash_invoice, invoice, invoice1, invoice_dl, invoice_dl_s, invoice_new, invoice_t, invoice_xx, invoicee |
| `:H_NO` | 8 | cash_invoice, invoice, invoice1, invoice_dl, invoice_dl_s, invoice_new, invoice_xx, invoicee |
| `:INV_TYP` | 8 | cash_invoice, invoice, invoice1, invoice_dl, invoice_dl_s, invoice_new, invoice_xx, invoicee |
| `:MEM_NAME` | 7 | cash_invoice, invoice, invoice1, invoice_dl, invoice_dl_s, invoice_xx, invoicee |
| `:DB` | 4 | categ_item, item_item, rep_item_rate, rep_points_fatra |
| `:DE` | 4 | categ_item, item_item, rep_item_rate, rep_points_fatra |
| `:SHIFT_T` | 3 | invoice_prod, invoice_serial, invoice_serial_b |
| `:B2` | 2 | invoice_serial, invoice_serial_b |
| `:B3` | 2 | invoice_serial, invoice_serial_b |
| `:B4` | 2 | invoice_serial, invoice_serial_b |
| `:DEL_FLG` | 2 | invoice_serial, invoice_serial_b |
| `:MADF_TYP` | 2 | invoice_serial, invoice_serial_b |
| `:MEM_NAMEE` | 2 | invoice, invoice_new |
| `:MEM_SERIAL` | 2 | invoice, invoice_new |

## Report-unique parameters (used by 1 report)

| Parameter | Report |
|---|---|
| `:A` | invoice_serial_b |
| `:COURIER` | invoice_new |
| `:DELV` | invoice_serial |
| `:DO` | invoice_serial |
| `:EMP` | invoice_serial |
| `:G` | invoice_serial |
| `:II_CODE` | item_item |
| `:KASM` | invoice_serial_b |
| `:KASMAGEL` | invoice_serial |
| `:MDIR` | invoice_serial |
| `:MDNY` | invoice_serial |
| `:MSH` | invoice_serial |
| `:NG` | invoice_serial |
| `:P_D` | pation_kard |
| `:P_I` | pation_kard |
| `:T_CODE` | categ_item |

## Semantic grouping (INFERRED by naming convention)

- **date / range**: `:INV_DT`, `:P_D`
- **invoice**: `:INV_DT`, `:INV_TYP`
- **employee**: `:EMP`, `:EMP_CODE`
- **customer / card**: `:H_NO`, `:KASM`, `:KASMAGEL`
- **item / product**: `:II_CODE`
- **point / shift**: `:SHIFT_T`
- **delivery**: `:COURIER`, `:DELV`, `:DEL_FLG`
