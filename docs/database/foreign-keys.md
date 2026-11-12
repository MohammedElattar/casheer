# Foreign-key catalog (from MySQL mirror)

Constraints parsed: **93**  
SVG `<path marker-end>` edge count: **93**  
Match verdict: ✓ identical  

## Most-referenced tables (in-degree)

| Table | Referrers |
|---|---|
| `EMP_TBL` | 9 |
| `HAGZ_TBL` | 7 |
| `ITEM_TBL` | 6 |
| `ROOMS` | 5 |
| `POINT_TBL` | 5 |
| `INVOICE` | 4 |
| `PRODUCTS` | 3 |
| `MAIN_MEMB` | 3 |
| `TRANSACTIONS` | 3 |
| `SUB_DEPT` | 2 |
| `E_INVOICE` | 2 |
| `SHIFT_TBL` | 2 |
| `STORES` | 2 |
| `HFL_ORDERS` | 2 |
| `M_STOCK_TBL` | 2 |
| `M_PRODUCTS` | 2 |
| `SUPP_TBL` | 2 |
| `ROOM_ACCOUNT_G` | 2 |
| `RPLACE_TBL` | 2 |
| `RORDERS` | 2 |

## Full list

| Columns | References |
|---|---|
| ``H_NO`` | `HAGZ_TBL` |
| ``ROOM_NO`` | `ROOMS` |
| ``EMP_ID`` | `EMP_TBL` |
| ``EMP_ID`` | `EMP_TBL` |
| ``EMP_ID`` | `EMP_TBL` |
| ``EMP_ID`` | `EMP_TBL` |
| ``POINT_CODE`` | `POINT_TBL` |
| ``SUB_DEPT_CODE`` | `SUB_DEPT` |
| ``DUTYID`` | `DUTY` |
| ``SERIAL_NO`, `INV_DATE`` | `E_INVOICE` |
| ``SERIAL_NO`, `INV_DATE`` | `E_INVOICE` |
| ``POINT_CODE`` | `POINT_TBL` |
| ``EMP_ID`` | `EMP_TBL` |
| ``SHIFT_TYP`` | `SHIFT_TBL` |
| ``A_CODE`` | `ADF_TBL` |
| ``SERIAL_NO`` | `F_ORDER_TBL` |
| ``PLACE_CODE`` | `PLACE_TBL` |
| ``G_DATE`, `STORE_CODE`` | `GARD_TBL` |
| ``P_CODE`` | `PRODUCTS` |
| ``STORE_CODE`` | `STORES` |
| ``H_NO`, `ROOM_NO`` | `HAGZ_ROOM` |
| ``H_NO`` | `HAGZ_TBL` |
| ``ROOM_NO`` | `ROOMS` |
| ``HAGZ_TYP`` | `HAGZ_TYPE` |
| ``SERIAL_NO`, `YY`` | `HFL_ORDERS` |
| ``PLACE_CODE`` | `HPLACE_TBL` |
| ``TYPE_CODE`` | `HTYPE_TBL` |
| ``SERIAL_NO`, `YY`` | `HFL_ORDERS` |
| ``SERIAL_NO`, `POINT_CODE`, `INV_DATE`, `EMP_ID`, `SHIFT_TYP`` | `INVOICE` |
| ``I_CODE`` | `ITEM_TBL` |
| ``I_CODE`` | `ITEM_TBL` |
| ``SERIAL_NO`, `POINT_CODE`, `INV_DATE`, `EMP_ID`, `SHIFT_TYP`` | `INVOICE` |
| ``SERIAL_NO`, `POINT_CODE`, `INV_DATE`, `EMP_ID`, `SHIFT_TYP`` | `INVOICE` |
| ``I_CODE`` | `ITEM_TBL` |
| ``I_CODE`` | `ITEM_TBL` |
| ``SERIAL_NO`, `POINT_CODE`, `INV_DATE`, `EMP_ID`, `SHIFT_TYP`` | `INVOICE` |
| ``EMP_ID`` | `EMP_TBL` |
| ``P_CODE`` | `PRODUCTS` |
| ``I_CODE`` | `ITEM_TBL` |
| ``POINT_CODE`` | `POINT_TBL` |
| ``I_CODE`` | `ITEM_TBL` |
| ``T_CODE`` | `ITEM_TYPE` |
| ``SUB_TYPE_CODE`` | `ITEM_SUB_TYPE` |
| ``EMP_ID`` | `EMP_TBL` |
| ``JOB_CODE`` | `JOB_TBL` |
| ``SUB_DEPT_CODE`` | `SUB_DEPT` |
| ``INV_SERIAL`, `POINTCODE`` | `M2_INV` |
| ``RANK_CODE`` | `RANK_TBL` |
| ``MEM_SERIAL`` | `MAIN_MEMB` |
| ``MEM_SERIAL`` | `MAIN_MEMB` |
| ``MEM_SERIAL`` | `MAIN_MEMB` |
| ``H_NO`` | `HAGZ_TBL` |
| ``YY`, `SERIAL_NO`, `O_DATE`` | `MORDERS` |
| ``TRANS_CODE`` | `M_TRANSACTIONS` |
| ``STOCK_CODE`` | `M_STOCK_TBL` |
| ``P_CODE`` | `M_PRODUCTS` |
| ``SERIAL_NO`, `TRANS_CODE`, `STOCK_CODE`` | `M_ORDERS` |
| ``STOCK_CODE`` | `M_STOCK_TBL` |
| ``P_CODE`` | `M_PRODUCTS` |
| ``P_CODE`` | `PRODUCTS` |
| ``SERIAL_NO`, `ORDER_NO`, `ORDER_DATE`, `TRANS_CODE`` | `ORDER_TBL` |
| ``H_NO`` | `HAGZ_TBL` |
| ``ROOM_NO`` | `ROOMS` |
| ``TRANS_CODE`` | `TRANSACTIONS` |
| ``TYPE_CODE`` | `PHONE_CALL_TYPE` |
| ``POINT_CODE`` | `POINT_TBL` |
| ``TYPE_CODE`` | `TYPE_TBL` |
| ``MES_CODE`` | `MES_TBL` |
| ``SUPP_CODE`` | `SUPP_TBL` |
| ``STORE_CODE`` | `STORES` |
| ``TRANS_CODE`` | `TRANSACTIONS` |
| ``TRANS_CODE`` | `TRANSACTIONS` |
| ``SERIAL_NO`, `O_DATE`` | `ROOM_ACCOUNT_G` |
| ``SERIAL_NO`, `O_DATE`` | `ROOM_ACCOUNT_G` |
| ``H_NO`` | `HAGZ_TBL` |
| ``H_NO`` | `HAGZ_TBL` |
| ``ROOM_NO`` | `ROOMS` |
| ``H_NO`` | `HAGZ_TBL` |
| ``ROOM_NO`` | `ROOMS` |
| ``PLACE_CODE`` | `RPLACE_TBL` |
| ``SERIAL_NO`, `O_DATE`` | `RORDERS` |
| ``P_CODE`` | `RPRODUCTS` |
| ``SERIAL_NO`, `O_DATE`` | `RORDERS` |
| ``P_CODE`` | `RPRODUCTS` |
| ``PLACE_CODE`` | `RPLACE_TBL` |
| ``TYPE_CODE`` | `RTYPE_TBL` |
| ``EMP_ID`` | `EMP_TBL` |
| ``DEPT_CODE`` | `DEPT_TBL` |
| ``SUB_CODE`` | `SUPP_TBL` |
| ``EMP_ID`` | `EMP_TBL` |
| ``SHIFT_TYP`` | `SHIFT_TBL` |
| ``POINT_CODE`` | `POINT_TBL` |
| ``TMAM_CODE`` | `TMAM_TBL` |
