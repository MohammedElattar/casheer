# Form: `item_type`  — **STUB (strings-derived)**

- Source: `M_CASHEAR/item_type.fmb`
- SHA-256: `860c51a1c6daa10dfa982d1771f5772b2858973615ea8831294016c3ba748dea`
- Size: 155648 bytes
- Version marker: `ROS.60050`
- Strings dump: `analysis/extracted/forms/M_CASHEAR/item_type.fmb.strings.txt`
- Trigger rows recovered: **25** (unique)

## Business purpose — UNKNOWN

Awaiting PL/SQL body recovery (BLK-005 toolchain decision).

## Toolbar buttons (2)

- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.HELP_BUT`

## Block.item references (2)

- `TOOLBAR.CLEAR_RECORD`
- `TOOLBAR.HELP_BUT`

## Candidate database tables referenced (0)

INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.


## Triggers (table)

| Trigger | Scope | Block | Item |
|---|---|---|---|
| `WHEN-BUTTON-PRESSED` | block | `TOOLBAR` | `` |
| `WHEN-NEW-FORM-INSTANCE` | block | `ITEM_TYPE` | `` |
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
- Strings generated: 2026-11-08T20:30:08.858628+00:00
- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`
