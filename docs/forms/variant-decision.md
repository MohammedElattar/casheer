# Form-variant decision support (BLK-008 technical resolution)

**Source:** per-file XML analysis of every `sery*` and `take_away*` module. One row per file.

**Verdict signals:**
- `incoming` from `analysis/dependency-graphs/form-to-form.csv` (literal `CALL_FORM('name')` by internal module name).
- `richness` = SQL statements + trigger-body bytes. Highest = latest-evolved candidate.
- `size` = raw XML size on disk (larger ≈ more content, loosely).

**Important caveat:** incoming==0 does NOT mean dormant. Forms launched from the application menu (not `CALL_FORM`) have zero incoming edges by construction. The 14 zero-incoming forms are probably the menu-reachable set. Final verdict requires business-owner confirmation on which `.fmx` each menu entry invokes at runtime.


## Family: `SERY` — 15 files

| XML | Internal name | Blocks | Items | Trigs | SQL≈ | Trig body (KB) | Size (KB) | Incoming CALL_FORM |
|---|---|---|---|---|---|---|---|---|
| `sery_last12-10__973ed0_fmb.xml` | `SERY_LAST` | 20 | 322 | 177 | 120 | 102 | 415 | 0 |
| `sery_last12_10__973ed0_fmb.xml` | `SERY_LAST` | 20 | 322 | 177 | 120 | 102 | 415 | 0 |
| `sery_last20__973ed0_fmb.xml` | `SERY_LAST` | 20 | 322 | 175 | 116 | 99 | 410 | 0 |
| `sery_last__973ed0_fmb.xml` | `SERY_LAST` | 20 | 322 | 175 | 116 | 99 | 410 | 0 |
| `sery_last10-10__973ed0_fmb.xml` | `SERY_LAST` | 20 | 316 | 173 | 108 | 88 | 395 | 0 |
| `sery_last10_10__973ed0_fmb.xml` | `SERY_LAST` | 20 | 316 | 173 | 108 | 88 | 395 | 0 |
| `sery__973ed0_fmb.xml` | `SERY` | 20 | 316 | 174 | 101 | 86 | 393 | 3 |
| `sery_old__973ed0_fmb.xml` | `SERY` | 15 | 266 | 152 | 83 | 74 | 345 | 0 |
| `seryehab__973ed0_fmb.xml` | `SERY` | 12 | 249 | 149 | 69 | 62 | 307 | 0 |
| `sery2__973ed0_fmb.xml` | `SERY` | 12 | 249 | 149 | 68 | 61 | 306 | 0 |
| `sery__6ef5fa_fmb.xml` | `SERY` | 12 | 249 | 149 | 68 | 61 | 306 | 3 |
| `sery_w__973ed0_fmb.xml` | `SERY` | 12 | 249 | 149 | 68 | 61 | 306 | 0 |
| `sery___original__973ed0_fmb.xml` | `SERY` | 12 | 248 | 144 | 65 | 60 | 303 | 0 |
| `sery_fki__973ed0_fmb.xml` | `SERY` | 12 | 248 | 144 | 65 | 60 | 269 | 0 |
| `sery_inv__973ed0_fmb.xml` | `SERY` | 11 | 228 | 129 | 64 | 52 | 278 | 0 |

**Richest file:** `sery_last12-10__973ed0_fmb.xml` (SQL≈120, trig body 102 KB). This is the likely LATEST VERSION on disk. Whether it is the one actually deployed depends on the runtime menu wiring.

## Family: `TAKE_AWAY` — 8 files

| XML | Internal name | Blocks | Items | Trigs | SQL≈ | Trig body (KB) | Size (KB) | Incoming CALL_FORM |
|---|---|---|---|---|---|---|---|---|
| `takeaway_pizza__973ed0_fmb.xml` | `TAKEAWAY_PIZZA` | 16 | 280 | 162 | 87 | 76 | 350 | 0 |
| `take_away__973ed0_fmb.xml` | `TAKE_AWAY` | 15 | 280 | 165 | 87 | 74 | 350 | 2 |
| `take_away_withoutStopDes_After3_2014__973ed0_fmb.xml` | `TAKE_AWAY` | 15 | 280 | 165 | 86 | 73 | 349 | 0 |
| `take_away__917c87_fmb.xml` | `TAKE_AWAY` | 12 | 260 | 155 | 76 | 67 | 318 | 2 |
| `take_away___Copy__973ed0_fmb.xml` | `TAKE_AWAY` | 12 | 264 | 155 | 76 | 68 | 319 | 0 |
| `take_away__6ef5fa_fmb.xml` | `TAKE_AWAY` | 12 | 260 | 155 | 76 | 66 | 318 | 2 |
| `take_away_original___Copy__973ed0_fmb.xml` | `TAKE_AWAY` | 12 | 263 | 156 | 75 | 67 | 320 | 0 |
| `takeaway_pizza_original__973ed0_fmb.xml` | `TAKEAWAY_PIZZA` | 12 | 259 | 150 | 70 | 66 | 315 | 0 |

**Richest file:** `takeaway_pizza__973ed0_fmb.xml` (SQL≈87, trig body 76 KB). This is the likely LATEST VERSION on disk. Whether it is the one actually deployed depends on the runtime menu wiring.

## Recommended action

1. Ask business owner / operator which `.fmx` each menu entry targets in production.
2. For families where the deployed file is the richest one: delete lesser copies (after an off-repo archive of the full `forms_xml/` dump).
3. For families where the deployed file is NOT the richest: investigate why development froze on an older version — pending migration, unresolved bug, or abandoned refactor.
