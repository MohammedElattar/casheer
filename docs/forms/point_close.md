# Form: `point_close`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/point_close.fmb`
- SHA-256: `e9251a1c73672b63aafb5d49c4187c851a5a33b7dda563f300577ba7ecc43c2c`
- Size: 282624 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/point_close.fmb.strings.txt`
- Trigger rows recovered: **37** (unique)

## Business purpose — UNKNOWN

Awaiting PL/SQL body recovery (BLK-005 toolchain decision).

## Toolbar buttons (13)

- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.ITEM483`
- `TOOLBAR.ITEM752`
- `TOOLBAR.ITEM763`
- `TOOLBAR.ITEM764`
- `TOOLBAR.ITEMP`
- `TOOLBAR.PUSH_BUTTON481`
- `TOOLBAR.PUSH_BUTTON482`
- `TOOLBAR.PUSH_BUTTON561`
- `TOOLBAR.PUSH_BUTTON588`
- `TOOLBAR.PUSH_BUTTON655`
- `TOOLBAR.PUSH_BUTTON751`

## Block.item references (16)

- `BLK1.EMP_ID`
- `BLK1.POINT_CODE`
- `BLK1.P_NAME`
- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.ITEM483`
- `TOOLBAR.ITEM752`
- `TOOLBAR.ITEM763`
- `TOOLBAR.ITEM764`
- `TOOLBAR.ITEMP`
- `TOOLBAR.PUSH_BUTTON481`
- `TOOLBAR.PUSH_BUTTON482`
- `TOOLBAR.PUSH_BUTTON561`
- `TOOLBAR.PUSH_BUTTON588`
- `TOOLBAR.PUSH_BUTTON655`
- `TOOLBAR.PUSH_BUTTON751`

## Candidate database tables referenced (6)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.

- `DTL_VIEW`
- `EMP_TBL`
- `INVOICE`
- `INVOICE_HIST`
- `INV_DTL`
- `POINT_TBL`

## Triggers (table)

| Trigger | Scope | Block | Item |
|---|---|---|---|
| `WHEN-BUTTON-PRESSED` | block | `TOOLBAR` | `` |
| `KEY-MENU` | form | `` | `` |
| `ON-ERROR` | form | `` | `` |
| `ON-MESSAGE` | form | `` | `` |
| `WHEN-MOUSE-DOWN` | form | `` | `` |
| `WHEN-MOUSE-ENTER` | form | `` | `` |
| `WHEN-MOUSE-UP` | form | `` | `` |
| `WHEN-NEW-FORM-INSTANCE` | form | `` | `` |
| `WHEN-TIMER-EXPIRED` | form | `` | `` |
| `WHEN-WINDOW-CLOSED` | form | `` | `` |
| `WHEN-WINDOW-DEACTIVATED` | form | `` | `` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `CLEAR_RECORD` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `HELP_BUT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM483` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM752` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM763` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM764` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEMP` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON481` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON482` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON561` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON588` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON655` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON751` |
| `WHEN-MOUSE-DOUBLECLICK` | item | `BLK1` | `P_NAME` |
| `KEY-MENU` | unknown | `` | `` |
| `ON-ERROR` | unknown | `` | `` |
| `ON-MESSAGE` | unknown | `` | `` |
| `WHEN-BUTTON-PRESSED` | unknown | `` | `` |
| `WHEN-MOUSE-DOUBLECLICK` | unknown | `` | `` |
| `WHEN-MOUSE-DOWN` | unknown | `` | `` |
| `WHEN-MOUSE-ENTER` | unknown | `` | `` |
| `WHEN-MOUSE-UP` | unknown | `` | `` |
| `WHEN-NEW-FORM-INSTANCE` | unknown | `` | `` |
| `WHEN-TIMER-EXPIRED` | unknown | `` | `` |
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
- Strings generated: 2026-11-08T20:30:06.745705+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
