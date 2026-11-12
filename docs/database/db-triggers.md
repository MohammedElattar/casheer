# Database triggers — parsed from `M_CASHEAR/SQL/trigger.txt`

Source: `M_CASHEAR/SQL/trigger.txt`

Trigger blocks found: **12**  
Tables with triggers: **2**

Convention: each `<table>---…` header starts a trigger block for that table. Event line encodes `<timing> <event> [<columns>]`. Body fragment shows first non-separator line to confirm trigger has code.

## Per-table triggers

### `HAGZ_ROOM`

| Line | Timing | Event | Column scope | Body first line | SQL kw hits |
|---|---|---|---|---|---|
| 55 |  | insert |  | `declare` | 7 |
| 76 |  | delete |  | `BEGIN` | 9 |
| 103 |  | insert |  | `declare` | 4 |
| 115 |  | delete |  | `declare` | 12 |
| 148 |  | insert |  | `BEGIN` | 2 |
| 154 |  | delete |  | `BEGIN` | 6 |
| 172 |  | insert |  | `BEGIN` | 10 |
| 190 |  | delete |  | `BEGIN` | 30 |
| 239 |  | insert |  | `BEGIN` | 2 |
| 245 |  | delete |  | `BEGIN` | 5 |

### `HAGZ_TBL`

| Line | Timing | Event | Column scope | Body first line | SQL kw hits |
|---|---|---|---|---|---|
| 2 |  | update | h_name,h_flag | `BEGIN` | 3 |
| 10 |  | update | out_date,h_from,h_to,h_day | `declare` | 21 |

