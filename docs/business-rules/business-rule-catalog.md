# Business-rule catalog (VERIFIED — XML + JDAPI PLL dump)

**Source:** `analysis/extracted/forms_xml/*.xml` (65 forms, Forms2XML 12.2.1.19) + `analysis/extracted/pll_bodies/*.txt` (2 PLLs via JDAPI `PlsqlModule`). Parsed by `scripts/legacy-analysis/business_rules.py`.

**Total PL/SQL units with non-empty body:** 5247  
**Buckets:** employee, invoice, item_master, kitchen, points, room, stats, system, takeaway, ui_toolbar, uncategorized

**How to read:** one row per unit. `scope` is `form`/`block`/`item`/`library`; `block.item` locates the handler. `body_len` is chars of PL/SQL. Click through to `analysis/normalized/business-rules.csv` for the full index; full bodies live in the XMLs.

## Counts by domain

| Domain | Units |
|---|---|
| `uncategorized` | 2461 |
| `invoice` | 1400 |
| `takeaway` | 1006 |
| `system` | 681 |
| `employee` | 621 |
| `ui_toolbar` | 245 |
| `item_master` | 79 |
| `room` | 69 |
| `kitchen` | 48 |
| `stats` | 16 |
| `points` | 7 |


## Domain: `uncategorized` (2461 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1600 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-ERROR` | form | `` | 1600 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-ERROR` | form | `` | 1600 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-ERROR` | form | `` | 1600 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-ERROR` | form | `` | 1600 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-ERROR` | form | `` | 1600 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-ERROR` | form | `` | 1600 | `DECLARE` |
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1592 | `DECLARE` |
| `TAKEAWAY_PIZZA` | TRIGGER | `ON-ERROR` | form | `` | 1568 | `DECLARE` |
| `TAKEAWAY_PIZZA` | TRIGGER | `ON-ERROR` | form | `` | 1568 | `DECLARE` |
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1563 | `DECLARE` |
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1563 | `DECLARE` |
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1563 | `DECLARE` |
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1563 | `DECLARE` |
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1563 | `DECLARE` |
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1563 | `DECLARE` |
| `SERY` | TRIGGER | `ON-ERROR` | form | `` | 1563 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `SERY_LAST` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `TAKEAWAY_PIZZA` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `TAKEAWAY_PIZZA` | TRIGGER | `ON-MESSAGE` | form | `` | 1553 | `DECLARE` |
| `STAT_YEAR` | TRIGGER | `ON-MESSAGE` | form | `` | 1472 | `DECLARE` |
| `CASH_MAIN` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `CATEG_MONTH` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `CATEG_YEAR_STAT` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `C_ORDERS` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `DAY_CATEG_VIEW` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `ITEM_SUB_TYPE` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `ITEM_TBL` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `ITEM_TBLL` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `ITEM_TYPE` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `NAT_TBL` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `POINT_CLOSE` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `POINT_CLOSE_TEMP` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `REP_FORM` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `REP_FORM` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `STATISTICS_FORM` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `STAT_DAY` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `STAT_MONTH` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `S_LAYOUT_PRICE` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `S_MAIN` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `S_SUB_ITEM` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `YEAR_CATEG_STAT` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `YEAR_ITEM_STAT` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `YEAR_MONTH_STAT` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `YEAR_POINT_STAT` | TRIGGER | `ON-MESSAGE` | form | `` | 1440 | `DECLARE` |
| `STAT_YEAR` | TRIGGER | `ON-ERROR` | form | `` | 1407 | `DECLARE` |

_(showing 60 of 2461; full list in `analysis/normalized/business-rules.csv`)_

## Domain: `invoice` (1400 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `SERY_LAST` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 10387 | `declare` |
| `SERY_LAST` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 10387 | `declare` |
| `SERY_LAST` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 10267 | `declare` |
| `SERY_LAST` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 10267 | `declare` |
| `SERY_LAST` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 8400 | `declare` |
| `SERY_LAST` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 8400 | `declare` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6804 | `/*declare` |
| `SERY` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 6443 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6398 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6398 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6396 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6396 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6059 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6059 | `declare` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 5727 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 5602 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 5602 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 5004 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4995 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4995 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 4921 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 4912 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 4912 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4162 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4162 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4140 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4140 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3941 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3591 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3584 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3584 | `declare` |
| `TAKEAWAY_PIZZA` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 3542 | `declare` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3515 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3511 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3511 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3511 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3431 | `--null` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `KEY-NEXT-ITEM` | item | `INVOICE.BAR_CODE` | 3406 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3403 | `declare` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3370 | `declare ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3326 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3326 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3320 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3320 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3320 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3317 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `KAED.PTM77` | 3296 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3285 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3285 | `declare` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3185 | `declare ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `MDIR.PTM77` | 3141 | `begin` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3136 | `--null` |
| `SERY` | TRIGGER | `POST-CHANGE` | item | `INVOICE.BAR_CODE` | 3131 | `null` |
| `SERY` | TRIGGER | `POST-CHANGE` | item | `INVOICE.BAR_CODE` | 3068 | `declare` |

_(showing 60 of 1400; full list in `analysis/normalized/business-rules.csv`)_

## Domain: `takeaway` (1006 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `LOG_IN_IN` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.PUSH_BUTTON29` | 4937 | `/*` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3591 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3511 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3511 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3511 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3431 | `--null` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 3317 | `declare` |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 3136 | `--null` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `MDIR.PTM77` | 3042 | `begin` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `MDIR.PTM77` | 3042 | `begin` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 2853 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 2853 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2828 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 2558 | `--null` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 2558 | `--null` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2551 | `Set_Window_Property(FORMS_MDI_WINDOW,WINDOW_STATE,MAXIMIZE)` |
| `TAKE_AWAY` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2422 | `Set_Window_Property(FORMS_MDI_WINDOW,WINDOW_STATE,MAXIMIZE)` |
| `TAKE_AWAY` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2422 | `Set_Window_Property(FORMS_MDI_WINDOW,WINDOW_STATE,MAXIMIZE)` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2357 | `Set_Window_Property(FORMS_MDI_WINDOW,WINDOW_STATE,MAXIMIZE)` |
| `TAKE_AWAY` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2356 | `Set_Window_Property(FORMS_MDI_WINDOW,WINDOW_STATE,MAXIMIZE)` |
| `TAKE_AWAY` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2356 | `Set_Window_Property(FORMS_MDI_WINDOW,WINDOW_STATE,MAXIMIZE)` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `INVOICE.PTM77` | 2355 | `begin` |
| `TAKE_AWAY` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2304 | `Set_Window_Property(FORMS_MDI_WINDOW,WINDOW_STATE,MAXIMIZE)` |
| `TAKE_AWAY` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2304 | `Set_Window_Property(FORMS_MDI_WINDOW,WINDOW_STATE,MAXIMIZE)` |
| `TAKE_AWAY` | TRIGGER | `POST-CHANGE` | item | `INVOICE.BAR_CODE` | 2289 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `INVOICE.PTM77` | 2055 | `begin` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `INVOICE.PTM77` | 2055 | `begin` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `INVOICE.PTM77` | 2055 | `begin` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.BTM1` | 1994 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.BTM1` | 1990 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.BTM1` | 1990 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.BTM1` | 1990 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.BTM1` | 1990 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.BTM1` | 1990 | `declare` |
| `TAKE_AWAY` | PROGRAM_UNIT | `BUTTON_PROC` | form | `` | 1912 | `PROCEDURE button_proc IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `BUTTON_PROC` | form | `` | 1912 | `PROCEDURE button_proc IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `BUTTON_PROC` | form | `` | 1912 | `PROCEDURE button_proc IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `BUTTON_PROC` | form | `` | 1912 | `PROCEDURE button_proc IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `BUTTON_PROC` | form | `` | 1912 | `PROCEDURE button_proc IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `BUTTON_PROC` | form | `` | 1912 | `PROCEDURE button_proc IS` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1911 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.B1` | 1764 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1762 | `declare ` |

_(showing 60 of 1006; full list in `analysis/normalized/business-rules.csv`)_

## Domain: `system` (681 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `YEAR_MONTH_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12640 | `PACKAGE BODY og IS` |
| `STAT_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 12204 | `PACKAGE BODY og IS` |
| `CATEG_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `CATEG_YEAR_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `DAY_CATEG_VIEW` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `STAT_DAY` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_CATEG_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_ITEM_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_POINT_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `STAT_YEAR` | PROGRAM_UNIT | `OG` | form | `` | 12202 | `PACKAGE BODY og IS` |
| `HINT` | PLL_UNIT | `HINT` | library | `` | 5359 | `PACKAGE BODY HINT IS` |
| `LOG_IN_IN` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.PUSH_BUTTON29` | 4937 | `/*` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4162 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4162 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4140 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4140 | `begin` |
| `CASHER` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `C_ORDERS` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `DEPT` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `EMPLOYEE` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `ITEM_POINT` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `ITEM_SUB_TYPE` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `ITEM_TBL` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `ITEM_TBLL` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `LAYOUT_PRICE` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `MTB_FORM` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `POINTS` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SUB_DEPT` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SUB_ITEM` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `S_LAYOUT_PRICE` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `S_SUB_ITEM` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKEAWAY_PIZZA` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKEAWAY_PIZZA` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2757 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2757 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2757 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2757 | `begin` |
| `SERY` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2736 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2736 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 2736 | `begin` |

_(showing 60 of 681; full list in `analysis/normalized/business-rules.csv`)_

## Domain: `employee` (621 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `YEAR_MONTH_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12640 | `PACKAGE BODY og IS` |
| `STAT_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 12204 | `PACKAGE BODY og IS` |
| `CATEG_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `CATEG_YEAR_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `DAY_CATEG_VIEW` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `STAT_DAY` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_CATEG_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_ITEM_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_POINT_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `STAT_YEAR` | PROGRAM_UNIT | `OG` | form | `` | 12202 | `PACKAGE BODY og IS` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6804 | `/*declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6398 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6398 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6396 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6396 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6059 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6059 | `declare` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK2.IT1` | 5727 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 5602 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 5602 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 5004 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4995 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4995 | `declare` |
| `LOG_IN_IN` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.PUSH_BUTTON29` | 4937 | `/*` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 4921 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 4912 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 4912 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4162 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4162 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4140 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.PUSH_BUTTON1228` | 4140 | `begin` |
| `CASHER` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `C_ORDERS` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `DEPT` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `EMPLOYEE` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `ITEM_POINT` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `ITEM_SUB_TYPE` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `ITEM_TBL` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `ITEM_TBLL` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `LAYOUT_PRICE` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `MTB_FORM` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `POINTS` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SERY_LAST` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SUB_DEPT` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `SUB_ITEM` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `S_LAYOUT_PRICE` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |
| `S_SUB_ITEM` | PROGRAM_UNIT | `CLEAR_ALL_MASTER_DETAILS` | form | `` | 3955 | `PROCEDURE Clear_All_Master_Details IS` |

_(showing 60 of 621; full list in `analysis/normalized/business-rules.csv`)_

## Domain: `ui_toolbar` (245 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `YEAR_MONTH_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12640 | `PACKAGE BODY og IS` |
| `STAT_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 12204 | `PACKAGE BODY og IS` |
| `CATEG_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `CATEG_YEAR_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `DAY_CATEG_VIEW` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `STAT_DAY` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_CATEG_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_ITEM_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `YEAR_POINT_STAT` | PROGRAM_UNIT | `OG` | form | `` | 12203 | `PACKAGE BODY og IS` |
| `STAT_YEAR` | PROGRAM_UNIT | `OG` | form | `` | 12202 | `PACKAGE BODY og IS` |
| `HINT` | PLL_UNIT | `HINT` | library | `` | 5359 | `PACKAGE BODY HINT IS` |
| `CATEG_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `CATEG_YEAR_STAT` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `DAY_CATEG_VIEW` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `STAT_DAY` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `STAT_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `STAT_YEAR` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `YEAR_CATEG_STAT` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `YEAR_ITEM_STAT` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `YEAR_MONTH_STAT` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `YEAR_POINT_STAT` | PROGRAM_UNIT | `OG` | form | `` | 3423 | `PACKAGE og IS` |
| `CASH_MAIN` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `CATEG_MONTH` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `CATEG_YEAR_STAT` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `C_ORDERS` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `DAY_CATEG_VIEW` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `ITEM_SUB_TYPE` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `ITEM_TBL` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `ITEM_TBLL` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `ITEM_TYPE` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `NAT_TBL` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `POINT_CLOSE` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `POINT_CLOSE_TEMP` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `REP_FORM` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `REP_FORM` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `STATISTICS_FORM` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `STAT_DAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `STAT_MONTH` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `STAT_YEAR` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `S_LAYOUT_PRICE` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `S_MAIN` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `S_SUB_ITEM` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKEAWAY_PIZZA` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKEAWAY_PIZZA` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 3153 | `PACKAGE BODY DLL IS` |

_(showing 60 of 245; full list in `analysis/normalized/business-rules.csv`)_

## Domain: `item_master` (79 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3414 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3370 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 3185 | `declare ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 2771 | `declare ` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 2771 | `declare ` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 2771 | `declare ` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 2771 | `declare ` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 2771 | `declare ` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 2451 | `declare ` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 2451 | `declare ` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1762 | `declare ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1762 | `declare ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1762 | `declare ` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1734 | `declare ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1734 | `declare ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1732 | `declare ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1732 | `declare ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | 1732 | `declare ` |
| `S_LAYOUT_PRICE` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_TYPE` | 505 | `declare` |
| `S_LAYOUT_PRICE` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `ITEM_POINT.I_CODE` | 446 | `declare` |
| `ITEM_POINT` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_TBLL` | 394 | `declare` |
| `ITEM_POINT` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_TBL` | 390 | `declare` |
| `S_LAYOUT_PRICE` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_TBL` | 189 | `insert into item_point(point_code,i_code,price) values` |
| `C_ORDERS` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `C_ORDERS` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.QTY` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |
| `SERY_LAST` | TRIGGER | `WHEN-VALIDATE-ITEM` | item | `INV_DTL.PRICE` | 46 | `:inv_dtl.i_q := :inv_dtl.qty * :inv_dtl.price` |

_(showing 60 of 79; full list in `analysis/normalized/business-rules.csv`)_

## Domain: `room` (69 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1911 | `declare` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1907 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1836 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1833 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1833 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1833 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1833 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1833 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1833 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1779 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1646 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1646 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1646 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1646 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1646 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1646 | `declare` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A2` | 1646 | `declare` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM950` | 224 | `DECLARE   ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.A1` | 92 | `begin` |

_(showing 60 of 69; full list in `analysis/normalized/business-rules.csv`)_

## Domain: `kitchen` (48 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `POINT_CLOSE` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.ITEM752` | 1784 | `declare` |
| `POINT_CLOSE_TEMP` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.ITEM752` | 1236 | `declare` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 140 | `commit` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 140 | `commit` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 140 | `commit` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 140 | `commit` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 140 | `commit` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 140 | `commit` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 140 | `commit` |
| `TAKE_AWAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 140 | `commit` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY_LAST` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 133 | `hide_view('order')` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM1009` | 119 | `begin ` |
| `SERY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | 117 | `hide_view('order')` |

## Domain: `stats` (16 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `CASHER` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 699 | `DECLARE` |
| `DELV` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 699 | `DECLARE` |
| `MANAGER` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 699 | `DECLARE` |
| `TEMPLET` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 699 | `DECLARE` |
| `DEPT` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `EMPLOYEE` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `ITEM_POINT` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `ITEM_TYP` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `JOB` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `JOBS` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `LAYOUT_PRICE` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `LOG_IN_IN` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `MTB_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `POINTS` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `SUB_DEPT` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |
| `SUB_ITEM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.PRINT` | 692 | `DECLARE` |

## Domain: `points` (7 units)

| Form | Kind | Name | Scope | Block.Item | Len | First line |
|---|---|---|---|---|---|---|
| `LOG_IN_IN` | TRIGGER | `POST-CHANGE` | item | `BLK.EMP_ID` | 833 | `declare` |
| `LOG_IN_IN` | TRIGGER | `POST-CHANGE` | item | `BLK.D` | 833 | `declare` |
| `TAKE_AWAY` | TRIGGER | `PRE-INSERT` | block | `INVOICE` | 655 | `declare` |
| `LOG_IN_IN` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM19` | 279 | `/*go_item('point')` |
| `REP_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.PUSH_BUTTON757` | 222 | `DECLARE` |
| `REP_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.PUSH_BUTTON757` | 222 | `DECLARE` |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.PUSH_BUTTON757` | 222 | `DECLARE` |
