# PLL body extraction — BLK-006 CLOSED 2026-11-09

## Method

Oracle Forms 12.2.1.19 JDAPI (`oracle.forms.jdapi.PlsqlModule`) via custom Java tool `scripts/legacy-analysis/PllDump.java`. Forms 12c dropped `LibraryModule` from JDAPI in favor of `PlsqlModule` for `.pll` access. Run on `dobat12c_win_server` with JDK 1.8.0_202; classpath `C:\Oracle\Middleware\Oracle_Home\jlib\frmjdapi.jar`; `NLS_LANG=AMERICAN_AMERICA.AR8MSWIN1256`.

Reused pre-existing JDAPI toolkit location `C:\navy\jdapi\` and wrapper pattern from `C:\dobat\_restore\runjdapi.ps1`. User had previously set this up for the unrelated `dobat` project — same JDK + JDAPI jar works for Casheer.

Original `.pll` files on repo and VM byte-identical post-run (read-only open).

## Output

- `analysis/extracted/pll_bodies/Lib01.pll.txt` — 4 program units, 2466 bytes
- `analysis/extracted/pll_bodies/HINT.pll.txt` — 13 program units, 5633 bytes

Arabic string literals rendered as `?` because the Windows 1256 bytes in the legacy PLL were not mapped by the Java `PrintStream` UTF-8 writer. PL/SQL structure and identifier names are intact; Arabic prompts/labels can be recovered byte-for-byte from the `strings` dump in `analysis/strings/` if needed (already parsed).

## Lib01.pll findings

**Project-specific library.** `ROS.60050` marker (Forms 6i).

| PU | Kind | Finding |
|---|---|---|
| `P_DATEOP` (spec) | PACKAGE | `F_DATEDIFF(DATE,DATE)->NUMBER`, `F_DATECONV(DATE)->VARCHAR2`, `P_DATEGHUPDATE` |
| `P_DATEOP` (body) | PACKAGE BODY | **STUB.** `F_DATEDIFF` returns hard-coded `1`. `F_DATECONV` returns hard-coded `'01-01-1421'` (a Hijri date literal). `P_DATEGHUPDATE` is `NULL;`. All three functions have `-- -- --` comment bodies suggesting removed Hijri-conversion logic. |
| `P_EXIT` | PROCEDURE | Real work: if `SYSTEM.FORM_STATUS = 'CHANGED'` and `TOOLBAR.SAVE` enabled, shows a 3-button Arabic/English alert `THREEBUTTON` (Yes/No/Cancel) with `DO_KEY('COMMIT_FORM')` on Yes, `EXIT_FORM(NO_VALIDATE)` on No. Otherwise `EXIT_FORM(NO_VALIDATE)`. |
| `F_FILTERSTRING` | FUNCTION | Trivial: returns `INITCAP(pSting)`. |

**Implication — verified 2026-11-09:** scanned all 65 extracted Forms XMLs and both PLL dumps for calls to `F_DATECONV`, `F_DATEDIFF`, `P_DATEGHUPDATE`, `F_FILTERSTRING`. **Zero callers**. The stubbed values are inert dead code. Only `P_EXIT` from `Lib01.pll` is actually exercised (32 call sites — standard exit-confirmation dialog). Hijri conversion is therefore NOT in Forms code; if the production system displays Hijri dates, the logic lives on the DB side (view/stored proc) or in one of the missing `.fmb` files (`k_main2`, etc., see BLK-010). Needs business-owner confirmation.

## HINT.PLL findings

**Generic, 3rd-party library — NOT Casheer code.** Header comment: `-- SMUENCH/DNAVAS, 1994`. These are Oracle developers Steven Muench and Dan Navas, authors of a well-known Forms 4.5-era tooltip demo library. Package `HINT` wraps `ora_ffi` (Oracle Foreign Function Interface) calls to Win32 APIs for mouse-position-based tooltip popups.

Exported procedures: `ShowButtonHelp(timedelay NUMBER:=500)`, `ShowButtonHelpHandler`, `HideButtonHelp`.

Internal state: `BUTTONHELPTIMER`, `hint_is_displayed`, `on_windows_flag`, `mouse_item`, `mouse_canvas`, `mouse_item_hint`, `appInst`, `HWind`, `lh_SHOWHINT ora_ffi.libHandleType`.

**Implication:** modernization MUST NOT port this file. Use the target platform's native tooltip/title-attr mechanism. The reason this `.pll` carries the older `ROS.20102` version marker (vs project `ROS.60050`) is consistent with "imported intact from the original 1994 Oracle demo" — matches the BLK-009 finding.

## Deprecated-builtin inventory impact

Across both PLLs, the following Forms built-ins and APIs should be noted for the migration catalog (`docs/migration/deprecated-builtins.md`):

- `ora_ffi.*` — removed in Forms 10g+. Entire HINT.PLL fails on any modernization that does not provide a tooltip replacement. (Pre-existing observation, confirmed.)
- `SYSTEM.FORM_STATUS`, `GET_ITEM_PROPERTY(..., ENABLED)`, `FIND_ALERT`, `SET_ALERT_PROPERTY`, `SET_ALERT_BUTTON_PROPERTY`, `SHOW_ALERT`, `DO_KEY('COMMIT_FORM')`, `EXIT_FORM(NO_VALIDATE)` — all still valid in Forms 12c; need semantic port, not rename.
- `INITCAP` — standard SQL, portable as-is.
