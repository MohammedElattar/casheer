# Form: `take_away`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/take_away.fmb`
- SHA-256: `dc0af176a330af11967c334d61fc4c7a83d8ac152edd78063e644288bdd0db12`
- Size: 1183744 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/take_away.fmb.strings.txt`
- Trigger rows recovered: **171** (unique)

## Business purpose — UNKNOWN

Awaiting PL/SQL body recovery (BLK-005 toolchain decision).

## Toolbar buttons (12)

- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.DELV`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.ITEM483`
- `TOOLBAR.PUP`
- `TOOLBAR.PUSH_BUTTON481`
- `TOOLBAR.PUSH_BUTTON482`
- `TOOLBAR.PUSH_BUTTON561`
- `TOOLBAR.PUSH_BUTTON588`
- `TOOLBAR.PUSH_BUTTON655`
- `TOOLBAR.TAKEAWAY`
- `TOOLBAR.UPDT`

## Block.item references (138)

- `BLK1.A1`
- `BLK1.A2`
- `BLK1.B1`
- `BLK1.B2`
- `BLK1.BK1`
- `BLK1.BK2`
- `BLK1.BTM1`
- `BLK1.BTM2`
- `BLK1.BTN1`
- `BLK1.BTN2`
- `BLK1.BTN3`
- `BLK1.BTN4`
- `BLK1.CAPTN_NO`
- `BLK1.CAPTN_NOO`
- `BLK1.CC_NO`
- `BLK1.C_NO`
- `BLK1.D_NAME`
- `BLK1.EMP_ID`
- `BLK1.IT1`
- `BLK1.IT2`
- `BLK1.ITEM1008`
- `BLK1.ITEM1009`
- `BLK1.ITEM1035`
- `BLK1.ITEM1038`
- `BLK1.ITEM1050`
- `BLK1.ITEM253`
- `BLK1.ITEM254`
- `BLK1.ITEM255`
- `BLK1.ITEM256`
- `BLK1.ITEM257`
- `BLK1.ITEM258`
- `BLK1.ITEM259`
- `BLK1.ITEM268`
- `BLK1.ITEM269`
- `BLK1.ITEM273`
- `BLK1.ITEM274`
- `BLK1.ITEM753`
- `BLK1.ITEM797`
- `BLK1.ITEM874`
- `BLK1.ITEM909`
- `BLK1.ITEM916`
- `BLK1.ITEM935`
- `BLK1.ITEM946`
- `BLK1.ITEM950`
- `BLK1.I_EMP_CODE`
- `BLK1.I_H_NO`
- `BLK1.I_ROOM_NO`
- `BLK1.NEW_CAPTN_ORD`
- `BLK1.NEW_TBL`
- `BLK1.OK1`
- `BLK1.OK2`
- `BLK1.POINT_CODE`
- `BLK1.PTM1`
- `BLK1.PTM10`
- `BLK1.PTM11`
- `BLK1.PTM12`
- `BLK1.PTM13`
- `BLK1.PTM14`
- `BLK1.PTM15`
- `BLK1.PTM16`
- `BLK1.PTM17`
- `BLK1.PTM18`
- `BLK1.PTM19`
- `BLK1.PTM2`
- `BLK1.PTM20`
- `BLK1.PTM21`
- `BLK1.PTM3`
- `BLK1.PTM4`
- `BLK1.PTM5`
- `BLK1.PTM6`
- `BLK1.PTM7`
- `BLK1.PTM8`
- `BLK1.PTM9`
- `BLK1.PUSH_BUTTON1059`
- `BLK1.PUSH_BUTTON252`
- `BLK1.P_HSB2`
- `BLK1.P_NAME`
- `BLK1.SIT1`
- `BLK1.SIT2`
- `BLK1.SIT3`
- ... (58 more)

## Candidate database tables referenced (12)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.

- `DELIVERY`
- `EMP_TBL`
- `INVOICE`
- `INVOICE_HIST`
- `INV_DTL`
- `ITEM_SUB_TYPE`
- `ITEM_TBL`
- `ITEM_TYPE`
- `MAHRMEMB`
- `MAHROSA`
- `POINT_TBL`
- `ROOM_VIEW`

## Triggers (table)

| Trigger | Scope | Block | Item |
|---|---|---|---|
| `ON-POPULATE-DETAILS` | block | `INVOICE` | `` |
| `ON-POPULATE-DETAILS` | block | `INVOICE1` | `` |
| `PRE-DELETE` | block | `INVOICE` | `` |
| `PRE-INSERT` | block | `INVOICE` | `` |
| `PRE-INSERT` | block | `INV_DTL` | `` |
| `WHEN-BUTTON-PRESSED` | block | `TOOLBAR` | `` |
| `WHEN-MOUSE-DOUBLECLICK` | block | `EMP_VIEW` | `` |
| `WHEN-MOUSE-DOUBLECLICK` | block | `INVOICE1` | `` |
| `WHEN-MOUSE-DOUBLECLICK` | block | `INV_VIEW` | `` |
| `WHEN-MOUSE-DOUBLECLICK` | block | `ITEM_PRICE_VIEW` | `` |
| `WHEN-MOUSE-DOUBLECLICK` | block | `TEL_VIEW` | `` |
| `WHEN-NEW-BLOCK-INSTANCE` | block | `INVOICE` | `` |
| `WHEN-NEW-RECORD-INSTANCE` | block | `INVOICE` | `` |
| `WHEN-NEW-RECORD-INSTANCE` | block | `INV_DTL` | `` |
| `KEY-MENU` | form | `` | `` |
| `ON-CLEAR-DETAILS` | form | `` | `` |
| `ON-ERROR` | form | `` | `` |
| `ON-MESSAGE` | form | `` | `` |
| `WHEN-MOUSE-DOWN` | form | `` | `` |
| `WHEN-MOUSE-ENTER` | form | `` | `` |
| `WHEN-MOUSE-UP` | form | `` | `` |
| `WHEN-NEW-FORM-INSTANCE` | form | `` | `` |
| `WHEN-TIMER-EXPIRED` | form | `` | `` |
| `WHEN-WINDOW-CLOSED` | form | `` | `` |
| `WHEN-WINDOW-DEACTIVATED` | form | `` | `` |
| `ON-ERROR` | item | `INVOICE` | `MADF_TYP` |
| `ON-ERROR` | item | `KAED` | `MADF_TYP` |
| `ON-ERROR` | item | `MDIR` | `MADF_TYP` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `A1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `A2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `B1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `B2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `BK1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `BK2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `BTM1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `BTM2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `BTN1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `BTN2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `BTN3` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `BTN4` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `IT1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `IT2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM1008` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM1009` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM1035` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM1038` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM1050` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM253` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM254` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM255` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM256` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM257` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM258` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM259` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM268` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM269` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM273` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM274` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM753` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM797` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM874` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM909` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM916` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM935` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM946` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `ITEM950` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `NEW_CAPTN_ORD` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `NEW_TBL` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `OK1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `OK2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM10` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM11` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM12` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM13` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM14` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM15` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM16` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM17` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM18` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM19` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM20` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM21` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM3` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM4` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM5` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM6` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM7` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM8` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PTM9` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PUSH_BUTTON1059` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `PUSH_BUTTON252` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `P_HSB2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `SIT1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `SIT2` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `SIT3` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `SIT4` |
| `WHEN-BUTTON-PRESSED` | item | `BLK1` | `SIT5` |
| `WHEN-BUTTON-PRESSED` | item | `BLK2` | `IT1` |
| `WHEN-BUTTON-PRESSED` | item | `BLK2` | `P_HSB` |
| `WHEN-BUTTON-PRESSED` | item | `BLK3` | `ITEM1093` |
| `WHEN-BUTTON-PRESSED` | item | `BLK3` | `ITEM1094` |
| `WHEN-BUTTON-PRESSED` | item | `BLK3` | `ITEM935` |
| `WHEN-BUTTON-PRESSED` | item | `BLK3` | `PTM44` |
| `WHEN-BUTTON-PRESSED` | item | `BLK3` | `PTM55` |
| `WHEN-BUTTON-PRESSED` | item | `EMPINV` | `ITEM935` |
| `WHEN-BUTTON-PRESSED` | item | `EMPINV` | `PTM44` |
| `WHEN-BUTTON-PRESSED` | item | `EMPINV` | `PTM55` |
| `WHEN-BUTTON-PRESSED` | item | `INVOICE` | `PTM44` |
| `WHEN-BUTTON-PRESSED` | item | `INVOICE` | `PTM99` |
| `WHEN-BUTTON-PRESSED` | item | `KAED` | `CANCEL` |
| `WHEN-BUTTON-PRESSED` | item | `KAED` | `DONE` |
| `WHEN-BUTTON-PRESSED` | item | `MDIR` | `PTM66` |
| `WHEN-BUTTON-PRESSED` | item | `MDIR` | `PTM77` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `CLEAR_RECORD` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `DELV` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `HELP_BUT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM483` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUP` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON481` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON482` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON561` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON588` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON655` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `TAKEAWAY` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `UPDT` |
| `WHEN-MOUSE-CLICK` | item | `INVOICE` | `INV_TYP` |
| `WHEN-MOUSE-DOUBLECLICK` | item | `BLK1` | `P_NAME` |
| `WHEN-MOUSE-DOUBLECLICK` | item | `BLK1` | `TYP_NAME` |
| `WHEN-MOUSE-DOUBLECLICK` | item | `INVOICE1` | `PP_NAME` |
| `WHEN-RADIO-CHANGED` | item | `INVOICE` | `INV_TYP` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `CAPTN_NO` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `CAPTN_NOO` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `CC_NO` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `C_NO` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `D_NAME` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `I_EMP_CODE` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `I_ROOM_NO` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `TBBL_NO` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `TBLL_NO` |
| `WHEN-VALIDATE-ITEM` | item | `BLK1` | `TBL_NO` |
| `WHEN-VALIDATE-ITEM` | item | `INVOICE` | `DELVERY_Q` |
| `WHEN-VALIDATE-ITEM` | item | `INVOICE` | `ROOM_NO` |
| `WHEN-VALIDATE-ITEM` | item | `INVOICE` | `TEL_NO` |
| `WHEN-VALIDATE-ITEM` | item | `INV_DTL` | `PRICE` |
| `WHEN-VALIDATE-ITEM` | item | `INV_DTL` | `QTY` |
| `WHEN-VALIDATE-ITEM` | item | `KAED` | `KASM_PER` |
| `WHEN-VALIDATE-ITEM` | item | `KAED` | `M_BARCODE` |
| `WHEN-VALIDATE-ITEM` | item | `MDIR` | `M_BARCODE` |
| `KEY-MENU` | unknown | `` | `` |
| `ON-CLEAR-DETAILS` | unknown | `` | `` |
| `ON-ERROR` | unknown | `` | `` |
| `ON-MESSAGE` | unknown | `` | `` |
| `ON-POPULATE-DETAILS` | unknown | `` | `` |
| `PRE-DELETE` | unknown | `` | `` |
| `PRE-INSERT` | unknown | `` | `` |
| `WHEN-BUTTON-PRESSED` | unknown | `` | `` |
| `WHEN-MOUSE-CLICK` | unknown | `` | `` |
| `WHEN-MOUSE-DOUBLECLICK` | unknown | `` | `` |
| `WHEN-MOUSE-DOWN` | unknown | `` | `` |
| `WHEN-MOUSE-ENTER` | unknown | `` | `` |
| `WHEN-MOUSE-UP` | unknown | `` | `` |
| `WHEN-NEW-BLOCK-INSTANCE` | unknown | `` | `` |
| `WHEN-NEW-FORM-INSTANCE` | unknown | `` | `` |
| `WHEN-NEW-RECORD-INSTANCE` | unknown | `` | `` |
| `WHEN-RADIO-CHANGED` | unknown | `` | `` |
| `WHEN-TIMER-EXPIRED` | unknown | `` | `` |
| `WHEN-VALIDATE-ITEM` | unknown | `` | `` |
| `WHEN-WINDOW-CLOSED` | unknown | `` | `` |
| `WHEN-WINDOW-DEACTIVATED` | unknown | `` | `` |

## Unknown — pending PL/SQL body recovery

- SQL statements executed by each trigger — **UNKNOWN**
- Validation rules — **UNKNOWN** (403 `WHEN-VALIDATE-ITEM` hits exist across all forms, but body text not in strings dump)
- Transaction boundaries (`COMMIT_FORM`, explicit `COMMIT`) — **UNKNOWN**
- Navigation to other forms (`CALL_FORM`, `OPEN_FORM`) — **UNKNOWN** without body
- Report invocations (`RUN_PRODUCT`, `RUN_REPORT_OBJECT`) — **UNKNOWN**
- Error handling behavior — **UNKNOWN**

## Evidence trail

- Strings tool: strings(1) GNU binutils
- Strings generated: 2026-11-08T20:30:08.096642+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
