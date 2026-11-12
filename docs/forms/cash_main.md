# Form: `cash_main`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/cash_main.fmb`
- SHA-256: `6874669fd827f6c733aee2df246b5cb4dbdb06f4a6cc2e0366d885a6b96ed8db`
- Size: 569344 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/cash_main.fmb.strings.txt`
- Trigger rows recovered: **38** (unique)

## Business purpose — UNKNOWN

Awaiting PL/SQL body recovery (BLK-005 toolchain decision).

## Toolbar buttons (16)

- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.DEPT`
- `TOOLBAR.EMPLOYEE`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.ITEM22`
- `TOOLBAR.ITEM23`
- `TOOLBAR.ITEM26`
- `TOOLBAR.ITEM483`
- `TOOLBAR.ITEMS`
- `TOOLBAR.ITM_POINT`
- `TOOLBAR.JOB`
- `TOOLBAR.PUSH_BUTTON481`
- `TOOLBAR.PUSH_BUTTON482`
- `TOOLBAR.PUSH_BUTTON561`
- `TOOLBAR.PUSH_BUTTON588`
- `TOOLBAR.PUSH_BUTTON655`

## Block.item references (16)

- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.DEPT`
- `TOOLBAR.EMPLOYEE`
- `TOOLBAR.HELP_BUT`
- `TOOLBAR.ITEM22`
- `TOOLBAR.ITEM23`
- `TOOLBAR.ITEM26`
- `TOOLBAR.ITEM483`
- `TOOLBAR.ITEMS`
- `TOOLBAR.ITM_POINT`
- `TOOLBAR.JOB`
- `TOOLBAR.PUSH_BUTTON481`
- `TOOLBAR.PUSH_BUTTON482`
- `TOOLBAR.PUSH_BUTTON561`
- `TOOLBAR.PUSH_BUTTON588`
- `TOOLBAR.PUSH_BUTTON655`

## Candidate database tables referenced (0)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.


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
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `DEPT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `EMPLOYEE` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `HELP_BUT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM22` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM23` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM26` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEM483` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITEMS` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `ITM_POINT` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `JOB` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON481` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON482` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON561` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON588` |
| `WHEN-BUTTON-PRESSED` | item | `TOOLBAR` | `PUSH_BUTTON655` |
| `KEY-MENU` | unknown | `` | `` |
| `ON-ERROR` | unknown | `` | `` |
| `ON-MESSAGE` | unknown | `` | `` |
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
- Strings generated: 2026-11-08T20:30:08.903094+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
