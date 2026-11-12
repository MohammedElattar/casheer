# Trigger coverage — from strings extraction

Source: `analysis/extracted/forms`

Files parsed: **166**  
Unique trigger rows (form, trigger, scope, block, item): **5120**

## Top 15 trigger names across all forms

| Trigger | Count |
|---|---|
| `WHEN-BUTTON-PRESSED` | 2470 |
| `WHEN-VALIDATE-ITEM` | 402 |
| `WHEN-MOUSE-DOUBLECLICK` | 276 |
| `ON-ERROR` | 135 |
| `WHEN-NEW-FORM-INSTANCE` | 127 |
| `ON-MESSAGE` | 126 |
| `WHEN-MOUSE-ENTER` | 126 |
| `WHEN-MOUSE-UP` | 126 |
| `WHEN-TIMER-EXPIRED` | 126 |
| `WHEN-MOUSE-DOWN` | 126 |
| `WHEN-WINDOW-DEACTIVATED` | 126 |
| `WHEN-WINDOW-CLOSED` | 126 |
| `ON-POPULATE-DETAILS` | 103 |
| `WHEN-NEW-RECORD-INSTANCE` | 96 |
| `KEY-MENU` | 94 |

## Scope distribution

| Scope | Count |
|---|---|
| item | 2921 |
| unknown | 1047 |
| form | 707 |
| block | 445 |

## Per-form trigger total (top 20)

| Form | Unique triggers |
|---|---|
| `M_CASHEAR/sery_last12-10.fmb` | 172 |
| `M_CASHEAR/sery_last.fmb` | 171 |
| `M_CASHEAR/sery_last20.fmb` | 171 |
| `M_CASHEAR/take_away.fmb` | 171 |
| `M_CASHEAR/take_away_withoutStopDes After3-2014.fmb` | 171 |
| `M_CASHEAR/sery.fmb` | 169 |
| `M_CASHEAR/sery_last10-10.fmb` | 169 |
| `M_CASHEAR/takeaway_pizza.fmb` | 168 |
| `M_CASHEAR/take_away_original - Copy.fmb` | 164 |
| `M_CASHEAR/SQL/take_away.fmb` | 163 |
| `M_CASHEAR/take_away - Copy.fmb` | 163 |
| `M_CASHEAR/امتداد عضوية  حتى شهر3/take_away.fmb` | 163 |
| `M_CASHEAR/takeaway_pizza_original.fmb` | 157 |
| `M_CASHEAR/sery2.fmb` | 152 |
| `M_CASHEAR/sery_w.fmb` | 152 |
| `M_CASHEAR/seryehab.fmb` | 152 |
| `M_CASHEAR/امتداد عضوية  حتى شهر3/sery.fmb` | 152 |
| `M_CASHEAR/sery_old.fmb` | 150 |
| `M_CASHEAR/sery - original.fmb` | 146 |
| `M_CASHEAR/sery_fki.fmb` | 146 |

Full detail: `analysis/normalized/triggers-per-form.csv`
