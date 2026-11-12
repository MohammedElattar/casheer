# `mhr.dmp` header forensics

Source: `M_CASHEAR/SQL/mhr.dmp`
SHA-256: `4bf2281283769f7152eab49b2c0b0c9ba4ed1c05933ab62523da04eacc3ab635`
Size: 2,072,576 bytes (≈ 2 MB)
Probe tool: `strings -n 6 -e l` (local, read-only).
Session: 2026-11-08.

## Header facts (VERIFIED)

- Format: Oracle classic `exp` export.
- Version marker: **`EXPORT:V09.02.00`** → produced by Oracle 9.2.0 export client.
- Schema: **`MAHROSA`**.
- Role/users export block: `RUSERS`.
- Export timestamp: **`Wed Dec 15 18:25:4 2004`** UTC offset `-07:00`.
- Original dump path on source: `c:\mhr.dmp`.
- Mode flag: `INTERPRETED`.
- Source DB identity marker: `ORCL.US.ORACLE.COM` (inside `dbms_logrep_imp.instantiate_schema`), SCN `8558643`.
- Tablespace: **`MAHROSA_T`**.

## Implication for import

- `exp 9.2` dumps can be imported with `imp` 9.2, 10g, or 11g in most configurations; 12c `imp` has deprecated-but-sometimes-working support; **Oracle 19c is the last widely-supported `imp` for classic 9.x dumps**; 21c usually refuses.
- The user mentioned an `ssh oracle19c` VM — this is the likely import target. **No import attempted this session.**
- Import must land in an isolated schema (not `MAHROSA`) to avoid clashing with anything already present. Approval required per `.agent/RULES.md`.

## Tables visible in header strings dump (INFERRED from DDL leaking in the first 64 KB)

Not the full list; only what the strings pass surfaced. Full list requires `imp show=y`.

- `ARMY_TBL` — ARMY_CODE NUMBER(2), ARMY_NAME VARCHAR2(50).
- `BED_IN` — SERIAL_NO, ORDER_DATE, ROOM_NO, H_NO, B_FROM, B_TO, N_NO, B_PRICE, B_DAY, B_Q. **Hotel/lodging semantics** (rooms, beds, date ranges, nightly price).
- `BLACK_LIST` — SERIAL_NO, BTAKA_NO, BTAKA_TYP, P_NAME, JOB, CUST_TYPE, ADDRESS, TEL, MOBILE, NOTES.
- `DELIVERY` — TEL_NO, D_NAME, D_ADDRESS.
- `DEPT_TBL` — DEPT_CODE NUMBER(3), DEPT_NAME VARCHAR2(100).
- `DIR_TBL` — directors/managers with per-person discount (`PER_DISC`).
- `EMP_POINT` — EMP_ID, POINT_CODE, SHIFT_TYP (shift roster per cashier point).

## Domain revision

Prior hypothesis in `.agent/PROJECT_CONTEXT.md` was **restaurant POS**. The presence of `BED_IN` with room/date-range/price columns and the schema name `MAHROSA` (a well-known Egyptian compound/resort naming pattern) upgrade this to **hotel/resort with on-site restaurant/cashier/takeaway** — a mixed-use hospitality system. Scope is wider than restaurant alone.

- `UPDATE` to `.agent/PROJECT_CONTEXT.md` recorded in `DECISIONS.md` as `DEC-001`.

## Next steps (recorded in `NEXT_ACTIONS.md`)

1. Probe `ssh oracle19c` for `imp` availability.
2. With approval, run `imp show=y file=mhr.dmp log=analysis/conversion-logs/mhr_show.log` to produce a full DDL manifest without touching any schema.
3. Cross-reference the manifest against `المحروسة/MAHROSA_FULL_DRAWSQL_MYSQL.sql` to score coverage of the MySQL mirror.
