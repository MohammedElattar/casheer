# Form: `item_tbl`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/item_tbl.fmb`
- SHA-256: `180e6ac2ec9856c1c9254a0e9da4d702b4e0d9f9e8513f7549fe0a32148e9f87`
- Size: 245760 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/item_tbl.fmb.strings.txt`
- Trigger rows recovered: **37** (unique)

## Business purpose — UNKNOWN

Awaiting PL/SQL body recovery (BLK-005 toolchain decision).

## Toolbar buttons (3)

- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.NEXT`

## Block.item references (9)

- `ITEM_COMPONENT.ITEM703`
- `ITEM_COMPONENT.P_CODE`
- `ITEM_TBL.ITEM739`
- `ITEM_TBL.PUSH_BUTTON693`
- `ITEM_TBL.SUB_TYPE_CODE`
- `ITEM_TBL.T_CODE`
- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.NEXT`

## Candidate database tables referenced (4)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.

- `ITEM_COMPONENT`
- `ITEM_SUB_TYPE`
- `ITEM_TYPE`
- `PRODUCTS`

## Triggers (table)

| Trigger | Scope | Block | Item |
|---|---|---|---|
| `ON-POPULATE-DETAILS` | block | `ITEM_TBL` | `` |
| `PRE-DELETE` | block | `ITEM_TBL` | `` |
| `WHEN-BUTTON-PRESSED` | block | `TOOLBAR` | `` |
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
| `WHEN-BUTTON-PRESSED` | item | `ITEM_COMPONENT` | `ITEM703` |
| `WHEN-BUTTON-PRESSED` | item | `ITEM_TBL` | `ITEM739` |
| `WHEN-BUTTON-PRESSED` | item | `ITEM_TBL` | `PUSH_BUTTON693` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `CLEAR_RECORD` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `HELP_BUT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `NEXT` |
| `KEY-MENU` | unknown | `` | `` |
| `ON-CLEAR-DETAILS` | unknown | `` | `` |
| `ON-ERROR` | unknown | `` | `` |
| `ON-MESSAGE` | unknown | `` | `` |
| `ON-POPULATE-DETAILS` | unknown | `` | `` |
| `PRE-DELETE` | unknown | `` | `` |
| `PRE-INSERT` | unknown | `` | `` |
| `WHEN-BUTTON-PRESSED` | unknown | `` | `` |
| `WHEN-MOUSE-DOUBLECLICK` | unknown | `` | `` |
| `WHEN-MOUSE-DOWN` | unknown | `` | `` |
| `WHEN-MOUSE-ENTER` | unknown | `` | `` |
| `WHEN-MOUSE-UP` | unknown | `` | `` |
| `WHEN-NEW-FORM-INSTANCE` | unknown | `` | `` |
| `WHEN-NEW-RECORD-INSTANCE` | unknown | `` | `` |
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
- Strings generated: 2026-11-08T20:30:08.763368+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
