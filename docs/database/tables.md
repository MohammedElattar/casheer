# Table catalog — authoritative

Source of truth for the list: `analysis/normalized/svg-schema.csv` (matches 1:1 with `المحروسة/MAHROSA_FULL_DRAWSQL_MYSQL.sql`).

**Total tables: 192**  
**Total columns across all tables: 4398**  
**Foreign-key edges (from SVG): 93**  
**Views (from SQL text extracts): 52**

## Largest tables (by column count)

| Table | Columns |
|---|---|
| `HAGZ_ESKAN_ROOM` | 166 |
| `HAGZ_TBL` | 159 |
| `E_INVOICE` | 111 |
| `HAGZ_ROOM` | 87 |
| `EMP_TBL` | 84 |
| `INVOICE` | 84 |
| `NET_CARD` | 84 |
| `INVOICEE` | 82 |
| `USERINFO` | 80 |
| `INVOICE_HIST` | 77 |
| `TEST111` | 75 |
| `INVOICE_DEL` | 72 |
| `INVOICE_DELL` | 69 |
| `F_ORDER_TBL` | 59 |
| `MAIN_MEMB` | 59 |
| `HFL_ORDERS` | 57 |
| `S_USER` | 46 |
| `M2_INV_DETAILS` | 44 |
| `MEMB_FAM` | 43 |
| `ROOM_ACCOUNT_G` | 43 |

## Full table list (alphabetical)

| Table | Columns | In SQL text? | In dump header strings? |
|---|---|---|---|
| `ADF_TBL` | 6 | yes |  |
| `ARMY_TBL` | 6 |  | yes |
| `BED_IN` | 24 | yes | yes |
| `BLACK_LIST` | 24 | yes | yes |
| `BTAKA_TBL` | 5 |  |  |
| `CHECKINOUT` | 21 |  |  |
| `COIN_TBL` | 8 |  |  |
| `CUST_TYPE_TBL` | 6 |  |  |
| `CUST_TYP_TBL` | 6 |  |  |
| `DELIVERY` | 8 | yes | yes |
| `DEPT_TBL` | 6 | yes | yes |
| `DUTY` | 6 |  |  |
| `DYS` | 6 |  |  |
| `EDAFY_TBL` | 16 |  |  |
| `EMP_ATTEND` | 14 |  |  |
| `EMP_EZN` | 12 |  |  |
| `EMP_FAM` | 13 |  |  |
| `EMP_LEAVE` | 14 |  |  |
| `EMP_M2MORYA` | 12 |  |  |
| `EMP_PNSH` | 19 |  |  |
| `EMP_POINT` | 10 |  | yes |
| `EMP_TBL` | 84 | yes |  |
| `EMP_VACANCY` | 12 |  |  |
| `E_INVOICE` | 111 |  |  |
| `E_INVOICE_ROOM` | 40 |  |  |
| `E_INVOICE_ROOMS` | 10 |  |  |
| `E_TIME_TBL` | 22 |  |  |
| `F_ORDER_DETAILS` | 12 | yes |  |
| `F_ORDER_TBL` | 59 | yes |  |
| `GARD_DETAIL_TBL` | 16 |  |  |
| `GARD_TBL` | 7 |  |  |
| `HAGZ_AGENT` | 16 |  |  |
| `HAGZ_COMPANY` | 6 |  |  |
| `HAGZ_COMPANY_DETAILS` | 14 |  |  |
| `HAGZ_ESKAN` | 29 | yes |  |
| `HAGZ_ESKAN_HIST` | 30 | yes |  |
| `HAGZ_ESKAN_OUT` | 22 |  |  |
| `HAGZ_ESKAN_OUT_HIST` | 22 |  |  |
| `HAGZ_ESKAN_ROOM` | 166 |  |  |
| `HAGZ_ESKAN_TOT` | 24 |  |  |
| `HAGZ_HALA_TBL` | 19 |  |  |
| `HAGZ_PHOTO` | 11 |  |  |
| `HAGZ_ROOM` | 87 | yes |  |
| `HAGZ_TBL` | 159 | yes |  |
| `HAGZ_TYPE` | 8 |  |  |
| `HFL_BANDS` | 22 |  |  |
| `HFL_ORDERS` | 57 |  |  |
| `HFL_PAYMENTS` | 20 |  |  |
| `HFL_TBL` | 10 |  |  |
| `HPLACE_TBL` | 6 |  |  |
| `HTYPE_TBL` | 6 |  |  |
| `HUSER_IDS` | 10 |  |  |
| `H_E_H` | 19 |  |  |
| `INOUTDEMO` | 11 |  |  |
| `INOUTTEST` | 10 |  |  |
| `INVOICE` | 84 | yes |  |
| `INVOICEE` | 82 |  |  |
| `INVOICE_DEL` | 72 |  |  |
| `INVOICE_DELL` | 69 |  |  |
| `INVOICE_HIST` | 77 | yes |  |
| `INV_DTL` | 38 | yes |  |
| `INV_DTLL` | 34 |  |  |
| `INV_DTLLL` | 32 |  |  |
| `INV_DTLL_DEL` | 27 |  |  |
| `INV_DTLL_HIST` | 34 |  |  |
| `INV_DTLL_TEST` | 32 |  |  |
| `INV_DTL_BK` | 29 |  |  |
| `INV_DTL_DEL` | 27 |  |  |
| `INV_DTL_DELL` | 27 |  |  |
| `INV_DTL_HIST` | 34 | yes |  |
| `INV_DTL_HISTT` | 34 |  |  |
| `INV_SERIAL_COUNTER` | 9 |  |  |
| `IN_OUT_TBL` | 38 |  |  |
| `ITEM_COMPONENT` | 15 |  |  |
| `ITEM_POINT` | 11 | yes |  |
| `ITEM_SUB_TYPE` | 6 |  |  |
| `ITEM_TBL` | 18 |  |  |
| `ITEM_TYPE` | 8 |  |  |
| `JOB_HIST` | 15 |  |  |
| `JOB_TBL` | 6 | yes |  |
| `JORNAL_TBL` | 18 |  |  |
| `KASM_TBL` | 6 |  |  |
| `LEVEL_TBL` | 6 |  |  |
| `M2_INV` | 25 |  |  |
| `M2_INV_BK12082022` | 23 |  |  |
| `M2_INV_DETAILS` | 44 |  |  |
| `M2_INV_DETAILS_BK12082022` | 41 |  |  |
| `M2_PRINTINGFILES` | 19 |  |  |
| `M2_REPRINT` | 10 |  |  |
| `M2_SERIAL_RESERVATION` | 12 |  |  |
| `MADF_ORDERS` | 16 |  |  |
| `MAIN_MEMB` | 59 |  |  |
| `MAIN_MEMBB` | 5 |  |  |
| `MAIN_MEMB_DETAILS` | 39 |  |  |
| `MAIN_PHOTO` | 8 |  |  |
| `MANG_TBL` | 6 |  |  |
| `MDIR_TBL` | 10 |  |  |
| `MEMB_BAR` | 18 |  |  |
| `MEMB_FAM` | 43 |  |  |
| `MEMB_TBL` | 34 |  |  |
| `MES_TBL` | 8 |  |  |
| `MNSB_TBL` | 10 |  |  |
| `MONTH` | 5 |  |  |
| `MORAFEK_TBL` | 33 | yes |  |
| `MORDERS` | 34 |  |  |
| `MORDERS_TEMP` | 31 |  |  |
| `MORDER_DETAILS` | 25 |  |  |
| `MORDER_DETAILS_TEMP` | 21 |  |  |
| `MTYP_TBL` | 12 |  |  |
| `M_ORDERS` | 20 |  |  |
| `M_ORDER_DETAILS` | 26 |  |  |
| `M_PRODUCTS` | 12 |  |  |
| `M_STOCK_PROD` | 21 |  |  |
| `M_STOCK_TBL` | 6 |  |  |
| `M_TRANSACTIONS` | 8 |  |  |
| `M_USER_IDS` | 10 |  |  |
| `NAT_TBL` | 6 | yes |  |
| `NET_CARD` | 84 |  |  |
| `ORDER_DETAIL_TBL` | 26 |  |  |
| `ORDER_PAYMENTS` | 39 | yes |  |
| `ORDER_TBL` | 23 |  |  |
| `PASS_TBL` | 6 |  |  |
| `PAY_TBL` | 6 |  |  |
| `PHONE` | 32 |  |  |
| `PHONE_CALENDAR` | 16 |  |  |
| `PHONE_CALL_TYPE` | 10 |  |  |
| `PHONE_CATEGORY` | 6 |  |  |
| `PHONE_TEMP` | 19 |  |  |
| `PHON_T` | 19 |  |  |
| `PLACE_TBL` | 8 | yes |  |
| `POINT_MANGER` | 6 |  |  |
| `POINT_MEM` | 9 |  |  |
| `POINT_ORDER` | 18 |  |  |
| `POINT_TBL` | 42 |  |  |
| `PRICE_LIST` | 18 | yes |  |
| `PRNT_TBL` | 6 |  |  |
| `PRODUCTS` | 34 |  |  |
| `PRODUCTS_DTS` | 17 |  |  |
| `PROD_CARD` | 19 |  |  |
| `PROD_CARD_FINAL` | 22 |  |  |
| `RAMDAN_MATAM` | 8 |  |  |
| `RAMDAN_WAGABAT` | 8 |  |  |
| `RANK_TBL` | 6 |  |  |
| `REP_CARD` | 31 |  |  |
| `REP_CARD_HIST` | 33 |  |  |
| `ROOMS` | 24 | yes |  |
| `ROOM_ACCOUNT` | 34 | yes |  |
| `ROOM_ACCOUNT_G` | 43 |  |  |
| `ROOM_ACCOUNT_GD` | 12 |  |  |
| `ROOM_ACCOUNT_INVOICE` | 32 |  |  |
| `ROOM_ACCOUNT_OUT` | 28 |  |  |
| `ROOM_ACCOUNT_TEMP` | 18 |  |  |
| `ROOM_ASIGN` | 15 |  |  |
| `ROOM_SERV` | 19 | yes |  |
| `ROOM_TEL` | 21 | yes |  |
| `ROOM_TYPE_TBL` | 8 |  |  |
| `RORDERS` | 42 |  |  |
| `RORDER_DETAILS` | 21 |  |  |
| `RPAYMENTS` | 19 |  |  |
| `RPLACE_PROD` | 11 |  |  |
| `RPLACE_TBL` | 6 |  |  |
| `RPRODUCTS` | 11 |  |  |
| `RTYPE_TBL` | 6 |  |  |
| `RUSER_IDS` | 10 |  |  |
| `SEL_COLOR` | 5 |  |  |
| `SERV_TBL` | 8 | yes |  |
| `SHIFTS` | 11 |  |  |
| `SHIFT_TBL` | 12 | yes |  |
| `STORES` | 6 |  |  |
| `SUB_DEPT` | 9 |  |  |
| `SUPP_TBL` | 26 |  |  |
| `S_CONTROL` | 3 |  |  |
| `S_PREV` | 7 |  |  |
| `S_PREV_POINT` | 13 |  |  |
| `S_USER` | 46 |  |  |
| `TAX` | 13 |  |  |
| `TEMP_TBL` | 4 |  |  |
| `TEST` | 6 |  |  |
| `TEST111` | 75 |  |  |
| `TEST_TBL` | 11 |  |  |
| `TIME_TBL` | 22 |  |  |
| `TMAM_TBL` | 6 |  |  |
| `TRANSACTIONS` | 6 |  |  |
| `TYPE_TBL` | 6 |  |  |
| `TYP_TBL` | 8 |  |  |
| `UNIT_TBL` | 6 |  |  |
| `USERINFO` | 80 |  |  |
| `USER_IDS` | 10 |  |  |
| `VAC_TYP` | 6 |  |  |
| `WAITING_LIST` | 22 | yes |  |
| `WAIT_LIST_DEL` | 28 |  |  |
| `WRDIA_TBL` | 5 |  |  |
