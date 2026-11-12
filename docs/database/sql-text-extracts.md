# SQL text extracts — object inventory

Sources parsed (11):

- `M_CASHEAR/SQL/views.txt`
- `M_CASHEAR/SQL/trigger.txt`
- `M_CASHEAR/SQL/sql1.txt`
- `M_CASHEAR/SQL/yom_view.txt`
- `M_CASHEAR/SQL/serry.txt`
- `M_CASHEAR/SQL/Cashers.txt`
- `M_CASHEAR/SQL/Reception.txt`
- `M_CASHEAR/SQL/1.txt`
- `M_CASHEAR/inv_update.sql`
- `M_CASHEAR/doc_new/new_stat_view.txt`
- `M_CASHEAR/vist.txt`

## Object counts by kind

| Kind | Count |
|---|---|
| alter | 2 |
| desc | 1 |
| table | 42 |
| trigger-section-for-table | 2 |
| view | 52 |

**Distinct table/view/mview names referenced:** 94

## Tables / views / mviews (distinct names)

- `adf_tbl`
- `bed_in`
- `black_list`
- `categ_point_view`
- `categ_view`
- `categ_year_month_view`
- `categ_year_view`
- `cust_eskan`
- `cust_pay`
- `cust_rest`
- `cust_rest_d`
- `cust_total`
- `day_categ_view`
- `day_item_categ_view`
- `day_view`
- `delivery`
- `dept_tbl`
- `dir_tbl`
- `dob_lang`
- `dtl_view`
- `emp_tbl`
- `emp_view`
- `f_order_details`
- `f_order_tbl`
- `hagz_eskan`
- `hagz_eskan_hist`
- `hagz_room`
- `hagz_tbl`
- `hagz_view`
- `hagz_view_all`
- `i_p_c_view`
- `i_t_d_s_view`
- `i_t_day_view`
- `i_t_m_s_view`
- `inv_dtl`
- `inv_dtl_hist`
- `inv_tbl`
- `inv_view`
- `invoice`
- `invoice_hist`
- `item_categ_month_view`
- `item_categ_point_view`
- `item_categ_view`
- `item_categ_year_view`
- `item_m_c_view`
- `item_point`
- `item_point_categ_view`
- `item_typ`
- `item_year_view`
- `job_tbl`
- `language`
- `mem_view`
- `month_categ_view`
- `month_view`
- `morafek_tbl`
- `nat_tbl`
- `nazel_tbl`
- `nzl_view`
- `order_payments`
- `pday_view`
- `place_tbl`
- `pmonth_view`
- `point_cap_view`
- `point_categ_view`
- `point_inv_view`
- `point_view`
- `point_wrdia_view`
- `point_yom_view`
- `price_list`
- `pyear_view`
- `room_account`
- `room_act`
- `room_hist_view`
- `room_serv`
- `room_tel`
- `room_view`
- `rooms`
- `serv_tbl`
- `shift_tbl`
- `t_d_s_view`
- `t_day_view`
- `t_m_s_view`
- `tday_view`
- `tel_view`
- `tmonth_view`
- `tpday_view`
- `tpmonth_view`
- `tpyear_view`
- `tyear_view`
- `waiting_list`
- `y_m_view`
- `year_month_view`
- `year_month_view_point`
- `year_view`

## Per-source summary

### `M_CASHEAR/SQL/views.txt`  (40 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | view | `hagz_view` |
| 10 | view | `hagz_view_all` |
| 17 | view | `inv_view` |
| 22 | view | `room_view` |
| 28 | view | `room_hist_view` |
| 34 | view | `mem_view` |
| 38 | view | `emp_view` |
| 44 | view | `nzl_view` |
| 50 | view | `tel_view` |
| 56 | view | `day_view` |
| 63 | view | `tday_view` |
| 68 | view | `month_view` |
| 77 | view | `tmonth_view` |
| 84 | view | `year_view` |
| 93 | view | `tyear_view` |
| 99 | view | `pday_view` |
| 112 | view | `tpday_view` |
| 121 | view | `tpmonth_view` |
| 132 | view | `pmonth_view` |
| 147 | view | `tpyear_view` |
| 158 | view | `pyear_view` |
| 173 | view | `year_month_view` |
| 182 | view | `y_m_view` |
| 188 | view | `year_month_view_point` |
| 197 | view | `categ_view` |
| 207 | view | `item_categ_view` |
| 217 | view | `item_categ_month_view` |
| 223 | view | `point_categ_view` |
| 232 | view | `item_point_categ_view` |
| 240 | view | `i_p_c_view` |
| 248 | view | `categ_year_view` |
| 257 | view | `item_categ_year_view` |
| 267 | view | `day_categ_view` |
| 275 | view | `day_item_categ_view` |
| 284 | view | `categ_year_month_view` |
| 296 | view | `point_view` |
| 305 | view | `categ_point_view` |
| 316 | view | `item_categ_point_view` |
| 327 | view | `item_year_view` |
| 338 | view | `dtl_view` |

### `M_CASHEAR/SQL/trigger.txt`  (2 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | trigger-section-for-table | `hagz_tbl` |
| 54 | trigger-section-for-table | `hagz_room` |

### `M_CASHEAR/SQL/sql1.txt`  (0 hits)

Not in repo or no matches.

### `M_CASHEAR/SQL/yom_view.txt`  (4 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | view | `point_yom_view` |
| 9 | view | `point_wrdia_view` |
| 20 | view | `point_inv_view` |
| 30 | view | `point_cap_view` |

### `M_CASHEAR/SQL/serry.txt`  (2 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | table | `language` |
| 6 | table | `dob_lang` |

### `M_CASHEAR/SQL/Cashers.txt`  (12 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | table | `shift_tbl` |
| 5 | table | `emp_tbl` |
| 20 | table | `dept_tbl` |
| 26 | table | `job_tbl` |
| 34 | table | `item_typ` |
| 40 | table | `item_point` |
| 47 | table | `delivery` |
| 54 | table | `inv_tbl` |
| 60 | table | `invoice` |
| 92 | table | `inv_dtl` |
| 108 | table | `invoice_hist` |
| 140 | table | `inv_dtl_hist` |

### `M_CASHEAR/SQL/Reception.txt`  (24 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | table | `nat_tbl` |
| 7 | table | `rooms` |
| 15 | table | `price_list` |
| 23 | table | `dir_tbl` |
| 35 | table | `hagz_tbl` |
| 62 | table | `hagz_room` |
| 73 | table | `room_account` |
| 89 | table | `morafek_tbl` |
| 100 | table | `hagz_eskan` |
| 115 | table | `hagz_eskan_hist` |
| 127 | table | `bed_in` |
| 144 | table | `serv_tbl` |
| 151 | table | `room_tel` |
| 164 | table | `room_serv` |
| 176 | table | `order_payments` |
| 192 | table | `cust_eskan` |
| 204 | table | `room_act` |
| 227 | table | `cust_pay` |
| 241 | table | `nazel_tbl` |
| 254 | table | `cust_total` |
| 262 | table | `cust_rest` |
| 276 | table | `cust_rest_d` |
| 297 | table | `black_list` |
| 311 | table | `waiting_list` |

### `M_CASHEAR/SQL/1.txt`  (1 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | desc | `mogod_mrtb_prim_spec` |

### `M_CASHEAR/inv_update.sql`  (2 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | alter | `EMP_TBL` |
| 4 | alter | `EMP_TBL` |

### `M_CASHEAR/doc_new/new_stat_view.txt`  (8 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | view | `month_categ_view` |
| 15 | view | `item_m_c_view` |
| 30 | view | `t_m_s_view` |
| 45 | view | `i_t_m_s_view` |
| 60 | view | `t_day_view` |
| 70 | view | `i_t_day_view` |
| 81 | view | `t_d_s_view` |
| 95 | view | `i_t_d_s_view` |

### `M_CASHEAR/vist.txt`  (4 hits)

| Line | Kind | Name |
|---|---|---|
| 1 | table | `place_tbl` |
| 5 | table | `adf_tbl` |
| 9 | table | `f_order_tbl` |
| 39 | table | `f_order_details` |

