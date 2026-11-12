# Form: `statistics_form`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/statistics_form.fmb`
- SHA-256: `08172139392d7831b49f0d656908c00d29c751bfdd01bde12deec0aa6e247a43`
- Size: 4276224 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/statistics_form.fmb.strings.txt`
- Trigger rows recovered: **47** (unique)

## Business purpose — UNKNOWN

Awaiting PL/SQL body recovery (BLK-005 toolchain decision).

## Toolbar buttons (8)

- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.ITEM483`
- `TOOLBAR.PUSH_BUTTON481`
- `TOOLBAR.PUSH_BUTTON482`
- `TOOLBAR.PUSH_BUTTON561`
- `TOOLBAR.PUSH_BUTTON588`
- `TOOLBAR.PUSH_BUTTON655`

## Block.item references (24)

- `BLK.ITEM709`
- `BLK.ITEM736`
- `BLK.ITEM738`
- `BLK.ITEM743`
- `BLK.ITEM744`
- `BLK.ITEM745`
- `BLK.ITEM748`
- `BLK.ITEM749`
- `BLK.ITEM750`
- `BLK.ITEM761`
- `BLK.ITEM765`
- `BLK.I_CODE`
- `BLK.PUSH_BUTTON704`
- `BLK.PUSH_BUTTON757`
- `BLK.P_CODE`
- `BLK.T_CODE`
- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.ITEM483`
- `TOOLBAR.PUSH_BUTTON481`
- `TOOLBAR.PUSH_BUTTON482`
- `TOOLBAR.PUSH_BUTTON561`
- `TOOLBAR.PUSH_BUTTON588`
- `TOOLBAR.PUSH_BUTTON655`

## Candidate database tables referenced (9)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.

- `CATEG_VIEW`
- `CATEG_YEAR_VIEW`
- `DAY_VIEW`
- `ITEM_TBL`
- `ITEM_TYPE`
- `MONTH_VIEW`
- `POINT_TBL`
- `POINT_VIEW`
- `YEAR_VIEW`

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
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM709` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM736` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM738` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM743` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM744` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM745` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM748` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM749` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM750` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM761` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM765` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `PUSH_BUTTON704` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `PUSH_BUTTON757` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `CLEAR_RECORD` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `HELP_BUT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM483` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON481` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON482` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON561` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON588` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON655` |
| `WHEN-VALIDATE-ITEM` | item | `BLK` | `I_CODE` |
| `WHEN-VALIDATE-ITEM` | item | `BLK` | `P_CODE` |
| `WHEN-VALIDATE-ITEM` | item | `BLK` | `T_CODE` |
| `KEY-MENU` | unknown | `` | `` |
| `ON-ERROR` | unknown | `` | `` |
| `ON-MESSAGE` | unknown | `` | `` |
| `WHEN-BUTTON-PRESSED` | unknown | `` | `` |
| `WHEN-MOUSE-DOWN` | unknown | `` | `` |
| `WHEN-MOUSE-ENTER` | unknown | `` | `` |
| `WHEN-MOUSE-UP` | unknown | `` | `` |
| `WHEN-NEW-FORM-INSTANCE` | unknown | `` | `` |
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
- Strings generated: 2026-11-08T20:30:10.046288+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
