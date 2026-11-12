# Form: `employee`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/employee.fmb`
- SHA-256: `6c82f1b83edeb196df31ccac6826ec221efe68f001d4b70eb3112808c84e038e`
- Size: 847872 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/employee.fmb.strings.txt`
- Trigger rows recovered: **52** (unique)

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

## Block.item references (22)

- `EMP_POINT.ITEM75`
- `EMP_POINT.POINT_CODE`
- `EMP_POINT.POINT_NAME`
- `EMP_TBL.ITEM75`
- `EMP_TBL.ITEM76`
- `EMP_TBL.JOB_CODE`
- `EMP_TBL.JOB_NAME`
- `EMP_TBL.PHOTO_PATH`
- `EMP_TBL.PUSH_BUTTON790`
- `EMP_TBL.SUB_DEPT_CODE`
- `EMP_TBL.SUB_DEPT_NAME`
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

- `EMP_POINT`
- `JOB_TBL`
- `POINT_TBL`
- `SUB_DEPT`

## Triggers (table)

| Trigger | Scope | Block | Item |
|---|---|---|---|
| `ON-POPULATE-DETAILS` | block | `EMP_TBL` | `` |
| `PRE-DELETE` | block | `EMP_TBL` | `` |
| `WHEN-NEW-RECORD-INSTANCE` | block | `EMP_POINT` | `` |
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
| `WHEN-BUTTON-PRESSED` | item | `EMP_POINT` | `ITEM75` |
| `WHEN-BUTTON-PRESSED` | item | `EMP_TBL` | `ITEM75` |
| `WHEN-BUTTON-PRESSED` | item | `EMP_TBL` | `ITEM76` |
| `WHEN-BUTTON-PRESSED` | item | `EMP_TBL` | `PUSH_BUTTON790` |
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
| `WHEN-MOUSE-DOUBLECLICK` | item | `EMP_POINT` | `POINT_NAME` |
| `WHEN-MOUSE-DOUBLECLICK` | item | `EMP_TBL` | `JOB_CODE` |
| `WHEN-MOUSE-DOUBLECLICK` | item | `EMP_TBL` | `JOB_NAME` |
| `WHEN-MOUSE-DOUBLECLICK` | item | `EMP_TBL` | `SUB_DEPT_CODE` |
| `WHEN-MOUSE-DOUBLECLICK` | item | `EMP_TBL` | `SUB_DEPT_NAME` |
| `KEY-EXIT` | unknown | `` | `` |
| `ON-CLEAR-DETAILS` | unknown | `` | `` |
| `ON-ERROR` | unknown | `` | `` |
| `ON-MESSAGE` | unknown | `` | `` |
| `ON-POPULATE-DETAILS` | unknown | `` | `` |
| `PRE-DELETE` | unknown | `` | `` |
| `PRE-FORM` | unknown | `` | `` |
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
- Strings generated: 2026-11-08T20:30:07.423122+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
