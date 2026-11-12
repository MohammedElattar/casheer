# PLL comparison — `Lib01.pll` vs `HINT.PLL`

Read-only strings-level comparison; both files are binary Oracle Forms 6i PL/SQL libraries whose procedure/function BODIES are not recoverable without Forms Builder.

| Metric | `Lib01.pll` | `HINT.PLL` |
|---|---|---|
| Version marker | ROS.60050 | ROS.20102 |
| Body size (ASCII strings bytes) | 6570 | 9363 |
| Procedure/Function/Package identifier hits | 6 | 13 |
| PL/SQL keyword hits | 1 | 3 |
| Forms built-in call hits | 10 | 17 |

## `Lib01.pll` procedure/function/package names (6)

- `F_DATECONV`
- `F_DATEDIFF`
- `F_FILTERSTRING`
- `P_DATEGHUPDATE`
- `P_DATEOP`
- `P_EXIT`

## `HINT.PLL` procedure/function/package names (13)

- `BUTTONHELPTIMER`
- `DISPLAYHINT`
- `HIDEBUTTONHELP`
- `HINT`
- `I_DISPLAYHINT`
- `MOUSE_ITEM_IS_ICONIC_BUTTON`
- `MOUSE_ITEM_LABEL`
- `MOUSE_WINDOW`
- `ON_WINDOWS`
- `RELATIVE_HINT_POS`
- `SHOWBUTTONHELP`
- `SHOWBUTTONHELPHANDLER`
- `SYNC_MOUSE_INFO`

## Forms built-in usage (Lib01.pll)

| Built-in | Count |
|---|---|
| `COMMIT_FORM` | 3 |
| `NAME_IN` | 2 |
| `GET_ITEM_PROPERTY` | 2 |
| `SHOW_ALERT` | 2 |
| `MESSAGE` | 1 |

## Forms built-in usage (HINT.PLL)

| Built-in | Count |
|---|---|
| `GET_ITEM_PROPERTY` | 8 |
| `MESSAGE` | 6 |
| `NAME_IN` | 3 |

## Verdict

Sizes comparable — both are substantive libraries. Older `HINT.PLL` version marker may be a false signal from re-import; verify bodies with Forms Builder.

Accurate role classification requires PLL decompilation (blocked on BLK-006).
