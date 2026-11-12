# Deprecated-builtin inventory (VERIFIED)

**Source:** same as business-rule catalog. Scanned 5247 PL/SQL units.

**How to read:** each row is one Forms 6i built-in + its call sites. `count` is total matches. `sites` is distinct `(form, name)` units containing the call. Modern replacement in the `migration note` column.

## Call-count summary

| Built-in | Total calls | Distinct sites | Migration note |
|---|---|---|---|
| `ora_ffi` | 2090 | 29 | removed in Forms 10g+; WebUtil or JavaBean |
| `TEXT_IO` | 637 | 41 | client-side only; use WebUtil.CLIENT_TEXT_IO on 3-tier |
| `ADD_PARAMETER` | 609 | 43 | still works but Report params moved to RUN_REPORT_OBJECT |
| `RUN_PRODUCT` | 313 | 55 | removed in Forms 11g; use RUN_REPORT_OBJECT |
| `READ_IMAGE_FILE` | 267 | 3 | 3-tier: WebUtil.CLIENT_IMAGE_IO |
| `GET_FILE_NAME` | 1 | 1 | 3-tier: WebUtil.CLIENT_GET_FILE_NAME |

## Call sites per built-in


### `ora_ffi` — 2090 calls across 29 sites

_removed in Forms 10g+; WebUtil or JavaBean_

| Form | Kind | Unit | Scope | Block.Item | Count |
|---|---|---|---|---|---|
| `CASH_MAIN` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `CATEG_MONTH` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `CATEG_YEAR_STAT` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `C_ORDERS` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `DAY_CATEG_VIEW` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `ITEM_SUB_TYPE` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `ITEM_TBL` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `ITEM_TBLL` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `ITEM_TYPE` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `NAT_TBL` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `POINT_CLOSE` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `POINT_CLOSE_TEMP` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `REP_FORM` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `REP_FORM` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `SERY_LAST` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `STATISTICS_FORM` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `STAT_DAY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `STAT_MONTH` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `STAT_YEAR` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `S_LAYOUT_PRICE` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `S_MAIN` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `S_SUB_ITEM` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `TAKEAWAY_PIZZA` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `TAKEAWAY_PIZZA` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |
| `TAKE_AWAY` | PROGRAM_UNIT | `DLL` | form | `` | 44 |

_(showing 40 of 48; full list in `analysis/normalized/deprecated-builtins.csv`)_

### `TEXT_IO` — 637 calls across 41 sites

_client-side only; use WebUtil.CLIENT_TEXT_IO on 3-tier_

| Form | Kind | Unit | Scope | Block.Item | Count |
|---|---|---|---|---|---|
| `CATEG_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `CATEG_YEAR_STAT` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `DAY_CATEG_VIEW` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `STAT_DAY` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `STAT_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `STAT_YEAR` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `YEAR_CATEG_STAT` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `YEAR_ITEM_STAT` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `YEAR_MONTH_STAT` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `YEAR_POINT_STAT` | PROGRAM_UNIT | `OG` | form | `` | 32 |
| `CATEG_MONTH` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `CATEG_YEAR_STAT` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `DAY_CATEG_VIEW` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `STAT_MONTH` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `STAT_YEAR` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `YEAR_CATEG_STAT` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `YEAR_ITEM_STAT` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `YEAR_MONTH_STAT` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `YEAR_POINT_STAT` | TRIGGER | `KEY-EXIT` | form | `` | 16 |
| `STAT_DAY` | TRIGGER | `KEY-EXIT` | form | `` | 10 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM738` | 7 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM745` | 7 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM748` | 7 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM749` | 7 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM750` | 7 |
| `STAT_YEAR` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `TYEAR_VIEW` | 7 |
| `CATEG_MONTH` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `CATEG_VIEW` | 4 |
| `CATEG_YEAR_STAT` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `CATEG_YEAR_VIEW` | 4 |
| `DAY_CATEG_VIEW` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `DAY_CATEG_VIEW` | 4 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.PUSH_BUTTON704` | 4 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM709` | 4 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM736` | 4 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM743` | 4 |
| `STATISTICS_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM744` | 4 |
| `STAT_DAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `DAY_VIEW` | 4 |
| `STAT_DAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `T_DAY_VIEW` | 4 |
| `STAT_DAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `T_D_S_VIEW` | 4 |
| `STAT_DAY` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 4 |
| `STAT_MONTH` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `TMONTH_VIEW` | 4 |
| `STAT_MONTH` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `MONTH_CATEG_VIEW` | 4 |

_(showing 40 of 84; full list in `analysis/normalized/deprecated-builtins.csv`)_

### `ADD_PARAMETER` — 609 calls across 43 sites

_still works but Report params moved to RUN_REPORT_OBJECT_

| Form | Kind | Unit | Scope | Block.Item | Count |
|---|---|---|---|---|---|
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 13 |
| `CATEG_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `CATEG_YEAR_STAT` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `DAY_CATEG_VIEW` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `STAT_DAY` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `STAT_MONTH` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `STAT_YEAR` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `YEAR_CATEG_STAT` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `YEAR_ITEM_STAT` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `YEAR_MONTH_STAT` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `YEAR_POINT_STAT` | PROGRAM_UNIT | `OG` | form | `` | 9 |
| `LOG_IN_IN` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.PUSH_BUTTON29` | 8 |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 6 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 6 |
| `POINT_CLOSE` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.ITEMP` | 5 |
| `POINT_CLOSE` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.ITEM764` | 5 |
| `POINT_CLOSE_TEMP` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `TOOLBAR.ITEMP` | 5 |

_(showing 40 of 173; full list in `analysis/normalized/deprecated-builtins.csv`)_

### `RUN_PRODUCT` — 313 calls across 55 sites

_removed in Forms 11g; use RUN_REPORT_OBJECT_

| Form | Kind | Unit | Scope | Block.Item | Count |
|---|---|---|---|---|---|
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 16 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 10 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 10 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 10 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 10 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 10 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 10 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BPRNT.PUSH_BUTTON1165` | 10 |
| `TAKEAWAY_PIZZA` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 8 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4 |
| `TAKE_AWAY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 4 |
| `REP_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM744` | 2 |
| `REP_FORM` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK.ITEM797` | 2 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2 |
| `SERY` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2 |
| `SERY_LAST` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `BLK1.ITEM797` | 2 |
| `STAT_DAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | item | `TOOLBAR.DAY_STAT` | 2 |
| `STAT_DAY` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `DAY_VIEW` | 2 |
| `STAT_MONTH` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | item | `TOOLBAR.MONTH_STAT` | 2 |
| `STAT_MONTH` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `TMONTH_VIEW` | 2 |
| `STAT_YEAR` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | item | `TOOLBAR.YEAR_STAT` | 2 |
| `STAT_YEAR` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | block | `TYEAR_VIEW` | 2 |
| `YEAR_MONTH_STAT` | TRIGGER | `WHEN-MOUSE-DOUBLECLICK` | item | `TOOLBAR.YEAR_MONTH_STAT` | 2 |
| `CASHER` | PROGRAM_UNIT | `P_RUNREPORT` | form | `` | 1 |

_(showing 40 of 152; full list in `analysis/normalized/deprecated-builtins.csv`)_

### `READ_IMAGE_FILE` — 267 calls across 3 sites

_3-tier: WebUtil.CLIENT_IMAGE_IO_

| Form | Kind | Unit | Scope | Block.Item | Count |
|---|---|---|---|---|---|
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I14` | 18 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I15` | 18 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I16` | 18 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I17` | 18 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I1` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I2` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I3` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I4` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I5` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I6` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I8` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I11` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I12` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I13` | 16 |
| `CASHER` | TRIGGER | `WHEN-MOUSE-CLICK` | item | `INVOICE.I18` | 16 |
| `CASHER` | TRIGGER | `WHEN-NEW-FORM-INSTANCE` | form | `` | 16 |
| `EMPLOYEE` | TRIGGER | `POST-CHANGE` | item | `EMP_TBL.PHOTO_PATH` | 3 |

### `GET_FILE_NAME` — 1 calls across 1 sites

_3-tier: WebUtil.CLIENT_GET_FILE_NAME_

| Form | Kind | Unit | Scope | Block.Item | Count |
|---|---|---|---|---|---|
| `EMPLOYEE` | TRIGGER | `WHEN-BUTTON-PRESSED` | item | `EMP_TBL.PUSH_BUTTON790` | 1 |
