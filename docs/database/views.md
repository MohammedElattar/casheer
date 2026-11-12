# View catalog

Views parsed: **52** from `M_CASHEAR/SQL/{views,yom_view}.txt` and `M_CASHEAR/doc_new/new_stat_view.txt`.

Each view lists candidate referenced names (tables + sub-views). An uppercase name is matched against the 192 authoritative tables and flagged as `table` or `view/unknown`.

| View | Source | Table deps | View/other deps |
|---|---|---|---|
| `categ_point_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL` |  |
| `categ_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE` |  |
| `categ_year_month_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE` |  |
| `categ_year_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE` |  |
| `day_categ_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE` |  |
| `day_item_categ_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE` |  |
| `day_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `POINT_TBL`, `SHIFT_TBL` |  |
| `dtl_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `INV_DTL_HIST` |  |
| `emp_view` | `M_CASHEAR/SQL/views.txt` | `EMP_TBL`, `INVOICE` |  |
| `hagz_view` | `M_CASHEAR/SQL/views.txt` | `HAGZ_ESKAN`, `HAGZ_TBL` |  |
| `hagz_view_all` | `M_CASHEAR/SQL/views.txt` | `HAGZ_ESKAN`, `HAGZ_TBL` |  |
| `i_p_c_view` | `M_CASHEAR/SQL/views.txt` | `MONTH` | `ITEM_POINT_CATEG_VIEW` |
| `i_t_d_s_view` | `M_CASHEAR/doc_new/new_stat_view.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL`, `SHIFT_TBL` |  |
| `i_t_day_view` | `M_CASHEAR/doc_new/new_stat_view.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL` |  |
| `i_t_m_s_view` | `M_CASHEAR/doc_new/new_stat_view.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL`, `SHIFT_TBL` |  |
| `inv_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE` |  |
| `item_categ_month_view` | `M_CASHEAR/SQL/views.txt` | `MONTH` | `ITEM_CATEG_VIEW` |
| `item_categ_point_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL` |  |
| `item_categ_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE` |  |
| `item_categ_year_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE` |  |
| `item_m_c_view` | `M_CASHEAR/doc_new/new_stat_view.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL` |  |
| `item_point_categ_view` | `M_CASHEAR/SQL/views.txt` | `ITEM_TBL`, `ITEM_TYPE` | `TPMONTH_VIEW` |
| `item_year_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `ITEM_TBL` |  |
| `mem_view` | `M_CASHEAR/SQL/views.txt` | `MAIN_MEMB`, `MEMB_TBL` |  |
| `month_categ_view` | `M_CASHEAR/doc_new/new_stat_view.txt` | `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL` |  |
| `month_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `POINT_TBL`, `SHIFT_TBL` |  |
| `nzl_view` | `M_CASHEAR/SQL/views.txt` | `HAGZ_TBL`, `INVOICE` |  |
| `pday_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `POINT_TBL`, `SHIFT_TBL` |  |
| `pmonth_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `POINT_TBL`, `SHIFT_TBL` |  |
| `point_cap_view` | `M_CASHEAR/SQL/yom_view.txt` | `EMP_TBL`, `INVOICE`, `INV_DTL`, `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL`, `SHIFT_TBL` |  |
| `point_categ_view` | `M_CASHEAR/SQL/views.txt` | `ITEM_TBL`, `ITEM_TYPE` | `TPMONTH_VIEW` |
| `point_inv_view` | `M_CASHEAR/SQL/yom_view.txt` | `EMP_TBL`, `INVOICE_HIST`, `POINT_TBL`, `SHIFT_TBL` |  |
| `point_view` | `M_CASHEAR/SQL/views.txt` | `INV_DTL_HIST`, `POINT_TBL` |  |
| `point_wrdia_view` | `M_CASHEAR/SQL/yom_view.txt` | `EMP_TBL`, `INVOICE_HIST`, `POINT_TBL`, `SHIFT_TBL` |  |
| `point_yom_view` | `M_CASHEAR/SQL/yom_view.txt` | `INVOICE_HIST`, `POINT_TBL` |  |
| `pyear_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `POINT_TBL`, `SHIFT_TBL` |  |
| `room_hist_view` | `M_CASHEAR/SQL/views.txt` | `HAGZ_ESKAN_HIST`, `HAGZ_TBL` |  |
| `room_view` | `M_CASHEAR/SQL/views.txt` | `HAGZ_ESKAN`, `HAGZ_TBL` |  |
| `t_d_s_view` | `M_CASHEAR/doc_new/new_stat_view.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL`, `SHIFT_TBL` |  |
| `t_day_view` | `M_CASHEAR/doc_new/new_stat_view.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL` |  |
| `t_m_s_view` | `M_CASHEAR/doc_new/new_stat_view.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `ITEM_TYPE`, `POINT_TBL`, `SHIFT_TBL` |  |
| `tday_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `POINT_TBL` |  |
| `tel_view` | `M_CASHEAR/SQL/views.txt` | `DELIVERY`, `INVOICE` |  |
| `tmonth_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `POINT_TBL` |  |
| `tpday_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `POINT_TBL` |  |
| `tpmonth_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `POINT_TBL` |  |
| `tpyear_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `INV_DTL_HIST`, `ITEM_TBL`, `POINT_TBL` |  |
| `tyear_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `POINT_TBL` |  |
| `y_m_view` | `M_CASHEAR/SQL/views.txt` | `MONTH` | `YEAR_MONTH_VIEW` |
| `year_month_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `MONTH` |  |
| `year_month_view_point` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `MONTH`, `POINT_TBL` |  |
| `year_view` | `M_CASHEAR/SQL/views.txt` | `INVOICE_HIST`, `POINT_TBL`, `SHIFT_TBL` |  |
