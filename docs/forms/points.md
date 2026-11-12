# Form: `points`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/points.fmb`
- SHA-256: `7c7481d84424566d2c68917412c2bb851dbb5e34f0c28fbde584f9a78e9987f8`
- Size: 565248 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/points.fmb.strings.txt`
- Trigger rows recovered: **42** (unique)

## Business purpose — UNKNOWN

Awaiting PL/SQL body recovery (BLK-005 toolchain decision).

## Toolbar buttons (11)

- `TOOLBAR.ADD`
- `TOOLBAR.DELETE`
- `TOOLBAR.EXIT`
- `TOOLBAR.FIRST`
- `TOOLBAR.LAST`
- `TOOLBAR.NEXT`
- `TOOLBAR.PREVIOUS`
- `TOOLBAR.PRINT`
- `TOOLBAR.QUERY`
- `TOOLBAR.SAVE`
- `TOOLBAR.VIEW`

## Block.item references (12)

- `BLK.ITEM753`
- `TOOLBAR.ADD`
- `TOOLBAR.DELETE`
- `TOOLBAR.EXIT`
- `TOOLBAR.FIRST`
- `TOOLBAR.LAST`
- `TOOLBAR.NEXT`
- `TOOLBAR.PREVIOUS`
- `TOOLBAR.PRINT`
- `TOOLBAR.QUERY`
- `TOOLBAR.SAVE`
- `TOOLBAR.VIEW`

## Candidate database tables referenced (4)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.

- `INV_DTL_HIST`
- `POINT_INV_VIEW`
- `POINT_WRDIA_VIEW`
- `POINT_YOM_VIEW`

## Triggers (table)

| Trigger | Scope | Block | Item |
|---|---|---|---|
| `ON-POPULATE-DETAILS` | block | `POINT_INV_VIEW` | `` |
| `ON-POPULATE-DETAILS` | block | `POINT_TBL` | `` |
| `ON-POPULATE-DETAILS` | block | `POINT_WRDIA_VIEW` | `` |
| `ON-POPULATE-DETAILS` | block | `POINT_YOM_VIEW` | `` |
| `KEY-EXIT` | form | `` | `` |
| `ON-CLEAR-DETAILS` | form | `` | `` |
| `ON-ERROR` | form | `` | `` |
| `ON-MESSAGE` | form | `` | `` |
| `PRE-FORM` | form | `` | `` |
| `WHEN-MOUSE-DOWN` | form | `` | `` |
| `WHEN-MOUSE-ENTER` | form | `` | `` |
| `WHEN-MOUSE-UP` | form | `` | `` |
| `WHEN-NEW-FORM-INSTANCE` | form | `` | `` |
| `WHEN-TIMER-EXPIRED` | form | `` | `` |
| `WHEN-WINDOW-CLOSED` | form | `` | `` |
| `WHEN-WINDOW-DEACTIVATED` | form | `` | `` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM753` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ADD` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `DELETE` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `EXIT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `FIRST` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `LAST` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `NEXT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PREVIOUS` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PRINT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `QUERY` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `SAVE` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `VIEW` |
| `KEY-EXIT` | unknown | `` | `` |
| `ON-CLEAR-DETAILS` | unknown | `` | `` |
| `ON-ERROR` | unknown | `` | `` |
| `ON-MESSAGE` | unknown | `` | `` |
| `ON-POPULATE-DETAILS` | unknown | `` | `` |
| `PRE-FORM` | unknown | `` | `` |
| `WHEN-BUTTON-PRESSED` | unknown | `` | `` |
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
- Strings generated: 2026-11-08T20:30:08.794684+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
