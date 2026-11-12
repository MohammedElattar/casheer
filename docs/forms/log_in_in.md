# Form: `log_in_in`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/log_in_in.fmb`
- SHA-256: `5d2de1b64a9f97088f3b7c038aae5540c7d895316e8914e18eabe5bbfc7935cb`
- Size: 1826816 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/log_in_in.fmb.strings.txt`
- Trigger rows recovered: **39** (unique)

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

## Block.item references (18)

- `BLK.D`
- `BLK.EMP_ID`
- `BLK.ITEM19`
- `BLK.ITEM60`
- `BLK.ITEM69`
- `BLK.PUSH_BUTTON14`
- `BLK.PUSH_BUTTON29`
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

## Candidate database tables referenced (5)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.

- `DEPT_TBL`
- `EMP_POINT`
- `EMP_TBL`
- `POINT_TBL`
- `SUB_DEPT`

## Triggers (table)

| Trigger | Scope | Block | Item |
|---|---|---|---|
| `KEY-EXIT` | form | `` | `` |
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
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM19` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM60` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `ITEM69` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `PUSH_BUTTON14` |
| `WHEN-BUTTON-PRESSED` | item | `BLK` | `PUSH_BUTTON29` |
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
| `ON-ERROR` | unknown | `` | `` |
| `ON-MESSAGE` | unknown | `` | `` |
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
- Strings generated: 2026-11-08T20:30:09.393041+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
