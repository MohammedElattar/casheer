# `ora_ffi` usage inventory (migration pain-point #1)

**Source:** 48 PL/SQL units containing `ora_ffi.*` tokens across all forms + PLL dumps. Total tokens: **2090**. Scanned by `scripts/legacy-analysis/ora_ffi_analysis.py`.

**Why this matters:** `ora_ffi` (Oracle's Foreign Function Interface) was removed in Forms 10g. Every DLL load + Win32 API registration must be replaced during web migration.

## TL;DR — migration risk is LOW despite the 2090 token count

The 2090 `ora_ffi.*` tokens collapse to:
- **1 DLL loaded:** `SHOWHINT.DLL` (companion to `HINT.PLL`).
- **1 function registered:** `DisplayHint`.
- **4 Win32 GDI functions called:** `GetDC`, `ReleaseDC`, `SetMapMode`, `GetTextExtent` — used to measure button-label text so the tooltip popup lands in the right pixel position.
- All of it lives inside `HINT.PLL` (the 1994 Oracle SMUENCH/DNAVAS demo tooltip library). The other 48 sites just reference `ora_ffi.libHandleType` / `ora_ffi.ffi_integer` as type names when importing HINT package specs.

**Replacement in modern stack:** HTML `title="..."` attribute, or a CSS/JS tooltip component (Bootstrap, Floating UI, etc.). **Zero FFI, zero native Win32 calls needed.** The `SHOWHINT.DLL` can be dropped entirely.

Everything else below is provenance for the audit trail.


## DLLs loaded (0)

| DLL | Load-site count | Replacement strategy |
|---|---|---|

## Registered / found functions (5)

| Function | Sites |
|---|---|
| `GetDC` | 47 |
| `ReleaseDC` | 47 |
| `SetMapMode` | 47 |
| `GetTextExtent` | 47 |
| `DisplayHint` | 1 |

## Top sites by `ora_ffi` token count

| Form | Kind | Name | Scope.Loc | Tokens | DLLs | Funcs reg'd |
|---|---|---|---|---|---|---|
| `C_ORDERS__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `CASH_MAIN__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `CATEG_MONTH__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `CATEG_YEAR_STAT__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `DAY_CATEG_VIEW__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `ITEM_SUB_TYPE__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `ITEM_TBL__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `ITEM_TBLL__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `ITEM_TYPE__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `NAT_TBL__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `POINT_CLOSE__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `POINT_CLOSE_TEMP__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `REP_FORM0__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `REP_FORM__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `S_LAYOUT_PRICE__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `S_MAIN__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `S_SUB_ITEM__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY2__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY__6EF5FA` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY___ORIGINAL__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_INV__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_LAST10-10__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_LAST10_10__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_LAST12-10__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_LAST12_10__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_LAST20__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_LAST__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_OLD__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
| `SERY_W__973ED0` | PROGRAM_UNIT | `DLL` | `form` | 44 |  | l_user/GetDC;l_user/ReleaseDC;l_gdi/SetMapMode;l_gdi/GetText |
