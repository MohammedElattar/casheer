# Form: `dept`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/dept.fmb`
- SHA-256: `f4e4a44c053739372183994c89de9a18c9bf531d6bfbc0a57d39cf8e042c2764`
- Size: 2588672 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/dept.fmb.strings.txt`
- Trigger rows recovered: **43** (unique)

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

## Block.item references (11)

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

## Candidate database tables referenced (1)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.

- `SUB_DEPT`

## Triggers (table)

| Trigger | Scope | Block | Item |
|---|---|---|---|
| `ON-POPULATE-DETAILS` | block | `DEPT_TBL` | `` |
| `WHEN-NEW-RECORD-INSTANCE` | block | `DEPT_TBL` | `` |
| `WHEN-NEW-RECORD-INSTANCE` | block | `SUB_DEPT` | `` |
| `KEY-EXIT` | form | `` | `` |
| `KEY-F1` | form | `` | `` |
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
| `KEY-F1` | unknown | `` | `` |
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
- Strings generated: 2026-11-08T20:30:05.792251+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
