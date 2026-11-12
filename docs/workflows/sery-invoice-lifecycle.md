# SERY — Invoice lifecycle (VERIFIED from XML)

The POS core: `M_CASHEAR/sery.fmb` (internal `FormModule.Name=SERY`). This is the form that handles restaurant-floor and room-service invoices. Called from `LOG_IN_IN::PUSH_BUTTON29` when `:POINT_ID NOT IN (12, 13, 60)` (see `docs/forms/dispatch-and-entry-points.md`).

## Form structure

**Data blocks:**

| Block | Base object | Items | Role |
|---|---|---|---|
| `INVOICE` | `INVOICE` (table) | 49 | Master — one row per bill |
| `INV_DTL` | `INV_DTL` (table) | 14 | Detail — one row per line item |
| `INVOICE1` | `INVOICE` (table) | 35 | Alternate master view (print?) |
| `INV_DTL1` | `INV_DTL` (table) | 12 | Alternate detail view |
| `ITEM_PRICE_VIEW` | view | 5 | Menu lookup (code + price) |
| `TABLE_VIEW` | view | 5 | Table lookup |
| `EMP_VIEW` / `EMPP_VIEW` | view | 9 / 7 | Employee / responsible lookups |
| `NZL_VIEW` | view | 9 | Room (نزل) lookup |

**UI blocks:**

| Block | Items | Role |
|---|---|---|
| `TOOLBAR` | 23 | Query / Save / Exit / Commit — standard Casheer toolbar |
| `BLK1` | 94 | Layout grid — item buttons + numeric keypad |
| `BPRNT` | 8 | Print buttons |
| `BLKMIN` | 12 | Minimum-charge banner (shift W_STATUS banner) |
| `MDIR` / `KAED` | 8+8 | Manager discount / adjust popups |
| `BLK2` / `BLK3` / `EMPINV` / `BLK_TABLE` | — | Transient dialog state |

**Trigger counts:** 95 WHEN-BUTTON-PRESSED · 18 WHEN-VALIDATE-ITEM · 17 POST-CHANGE · 4+4 KEY-DOWN/UP · 2 PRE-INSERT · 2 WHEN-VALIDATE-RECORD · 1 WHEN-NEW-FORM-INSTANCE · 1 WHEN-TIMER-EXPIRED.

## Form startup — `WHEN-NEW-FORM-INSTANCE`

```plsql
Set_Window_Property(FORMS_MDI_WINDOW, WINDOW_STATE, MAXIMIZE);
:scr := :system.current_form;
:GLOBAL.S := 0; :global.wstatus := 0; :global.w_mem_id := null;

-- Create 3 recurring 6-second timers
t1 := CREATE_TIMER('invoice_t', 6000, REPEAT);
t2 := CREATE_TIMER('kaed_t',    6000, REPEAT);
t3 := CREATE_TIMER('mdir_t',    6000, REPEAT);

-- Load this point's configuration (min charge, weekday flags, service %)
SELECT min_charge, m_status, d1, d2, d3, d4, d5, d6, d7, p_serv_per INTO ...
   FROM point_tbl WHERE point_code = :parameter.pt_code;

-- Gate: is this POINT_CODE enabled for this shift's weekday?
dy_no := TO_NUMBER(TO_CHAR(:blk1.dt, 'd'));    -- 1..7
IF :BLKMIN.W_STATUS = 1 AND :dd<dy_no> = 1 THEN
   :global.wstatus := 1;        -- point معال (active)
ELSE
   :global.wstatus := 0;        -- point غير معال (disabled)
END IF;
```

**Invariant:** `point_tbl.d1..d7` are the 7 weekday-enable flags. The form loads them into locals `:dd1..:dd7` and refuses sales when the calling day's flag is 0.

**Parameters from LOG_IN_IN:** `dt` (shift date), `e_id` (employee), `pt_code` (point code), `wrdia` (shift kind).

## Invoice creation — `INVOICE::PRE-INSERT`

```plsql
SELECT NVL(MAX(serial_no), 0) + 1 INTO :invoice.serial_no
   FROM invoice_hist
  WHERE POINT_CODE = :blk1.Point_CODE
    AND INV_DATE   = :dt;

:invoice.Point_CODE := :blk1.Point_CODE;
:invoice.INV_DATE   := :blk1.dt;
:invoice.EMP_ID     := :blk1.EMP_ID;
:invoice.SHIFT_TYP  := :blk1.SHIFT_TYP;
:invoice.SHIFT_ok   := :blk1.SHIFT_TYP;

:invoice.serv_q := 0;  :invoice.INV_TOT := 0;
:invoice.DISC_Q := 0;  :invoice.DISC_PER := 0;
```

**Invariant:** `serial_no` is a per-(point, date) running number, computed from `invoice_hist` (not `invoice`). The composite key of `INVOICE` is `(SERIAL_NO, POINT_CODE, INV_DATE, EMP_ID, SHIFT_TYP)`.

## Line-item entry — `INV_DTL.I_CODE::POST-CHANGE`

```plsql
SELECT i_NAME INTO :inv_dtl.i_NAME FROM item_tbl WHERE i_CODE = :inv_dtl.i_CODE;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      MESSAGE('لا توجد بيانات');
      RAISE FORM_TRIGGER_FAILURE;
```

Trivial master-data fill. Quantity is entered via a second numeric-keypad trigger (block `BLK1`, item `ITEM273` / `ITEM1225` in the item grid — both increment `:inv_dtl.qty := TO_NUMBER(:kmia)` with cap 9999).

## Totals calculation — service / discount

Enforced by several WHEN-BUTTON-PRESSED triggers plus WHEN-VALIDATE-RECORD. The canonical formula:

```plsql
:v_serv_q := FLOOR((sum * :invoice.SERV_PER / 100) * 100) / 100;
:v_disc_q := FLOOR((sum * NVL(:invoice.disc_per,0) / 100) * 100) / 100;
:v_inv_tot:= FLOOR((sum + :v_serv_q - :v_disc_q) * 100) / 100;

:invoice.serv_q := NVL(:v_serv_q,0);
:invoice.disc_q := :v_disc_q;
:invoice.inv_tot:= :v_inv_tot;
```

**Invariant:** 2-decimal floor-rounding (NOT banker's rounding) on every component. Service percent is from `point_tbl.p_serv_per` at form load; discount percent is per-invoice.

## Payment / close — `p_ok` state machine

Initial state: `invoice.p_ok IS NULL or 0` → row editable; both `INVOICE` and `INV_DTL` have `UPDATE_ALLOWED=TRUE, DELETE_ALLOWED=TRUE`.

On payment, a trigger flips `p_ok := 1`, recomputes totals, and **assigns the customer-facing receipt number** via `WHEN-VALIDATE-RECORD`:

```plsql
IF :invoice.p_ok = 1 AND NVL(:invoice.ser_no,0) = 0 THEN
   set_block_property('invoice', update_allowed, property_true);
   SELECT NVL(MAX(ser_no),0) + 1 INTO :invoice.ser_no
      FROM invoice
     WHERE point_code = :blk1.point_code
       AND inv_date   = :blk1.inv_time
       AND p_ok       = 1;

   UPDATE invoice_hist SET ser_no = :invoice.ser_no WHERE
          SERIAL_NO = :invoice.SERIAL_NO AND POINT_CODE = :invoice.POINT_CODE AND
          INV_DATE  = :invoice.INV_DATE  AND EMP_ID = :invoice.EMP_ID AND
          SHIFT_TYP = :invoice.SHIFT_TYP;
END IF;
```

After payment, `WHEN-NEW-RECORD-INSTANCE` re-enters the row and flips everything to read-only:

```plsql
IF NVL(:invoice.p_ok,0) = 0 THEN
   set_block_property('invoice',  update_allowed, property_true);
   set_block_property('invoice',  delete_allowed, property_true);
   set_block_property('inv_dtl',  update_allowed, property_true);
   set_block_property('inv_dtl',  delete_allowed, property_true);
ELSE
   set_block_property('invoice',  update_allowed, property_false);
   set_block_property('invoice',  delete_allowed, property_false);
   set_block_property('inv_dtl',  update_allowed, property_false);
   set_block_property('inv_dtl',  delete_allowed, property_false);
END IF;
```

**Dual numbering scheme (critical migration invariant):**

| Column | Scope | When assigned | Purpose |
|---|---|---|---|
| `INVOICE.SERIAL_NO` | per (POINT_CODE, INV_DATE) | On `PRE-INSERT` | Internal row identifier |
| `INVOICE.SER_NO` | per (POINT_CODE, INV_DATE, `p_ok=1`) | On `p_ok=1` via `WHEN-VALIDATE-RECORD` | Customer receipt number |

The two run on independent counters; `ser_no` is a tighter subset (only paid invoices increment).

## Invoice types — `INV_TYP`

Inferred from branch coverage:

| `INV_TYP` | Semantic | Handling |
|---|---|---|
| 1 | Regular table-dining | Normal flow. Needs `table_no`. Prints `invoice_new.rdf`. |
| 2 | Room / defer payment | Requires `wstatus=1`. Captures `BLKMIN.w_m_q` (minimum charge). Can override `MADF_TYP`. |
| 3 | MODEER (manager discount) | Opens `MDIR` subblock. `MADF_TYP IN (1,2)` → `kasm_per` locked; `=3` → editable. |
| 4 | Fixed-sum override | Does `v_serv_q := 0`, recomputes totals on current sum. |
| 5 | Employee invoice | Sets `serv_per := 0, serv_q := 0`. Opens `EMPINV`. |

`MADF_TYP IN (1,2,3)` is the payment deferral type (immediate / postponed / manager-approved). When `inv_typ=2 AND madf_typ=2`, the record-validate trigger forces `disc_per:=0`, resets `serv_per` from point default, nulls `room_no`, and demotes `madf_typ` to 1 — apparently a "convert back to immediate payment" path.

## Delete flow — `BLK1.ITEM1050::WHEN-BUTTON-PRESSED`

```plsql
k := show_alert('del');
IF k = 88 THEN RETURN; END IF;        -- 88 = cancel button on alert 'del'
set_block_property('invoice', update_allowed, property_true);
set_block_property('invoice', delete_allowed, property_true);

:del_flg          := 1;
:invoice.p_ok     := 1;               -- force to read-only state
:del_q            := :invoice.inv_tot;
:invoice.inv_tot  := 0;
:invoice.p_emp_id := :blk1.emp_id;

DELETE FROM inv_dtl WHERE serial_no = :invoice.serial_no AND
       point_code = :invoice.point_code AND emp_id = :invoice.emp_id AND
       INV_DATE   = :invoice.INV_DATE AND SHIFT_TYP = :invoice.SHIFT_TYP;
COMMIT;

set_block_property('invoice', update_allowed, property_false);
set_block_property('invoice', delete_allowed, property_false);
```

**Semantics:** a "delete" here means "cancel invoice" — INVOICE row stays (for audit); INV_DTL rows are deleted; `inv_tot` zeroed; `del_flg=1` flags the audit trail; `p_ok=1` locks the row.

## Print flow — `BPRNT.PUSH_BUTTON1165::WHEN-BUTTON-PRESSED`

```plsql
t := :global.prnt || ',LPT1:';     -- :global.prnt was read from point_tbl.prnt_n
list_id := create_parameter_list('data');
add_parameter(list_id, 'destype', TEXT_parameter, 'printer');
add_parameter(list_id, 'desname', TEXT_parameter, t);
add_parameter(list_id, 'ser_no',  TEXT_parameter, TO_CHAR(:invoice.serial_no));
add_parameter(list_id, 'inv_dt',  TEXT_parameter, TO_CHAR(:invoice.inv_date));
add_parameter(list_id, 'pt_code', TEXT_parameter, TO_CHAR(:invoice.point_code));
add_parameter(list_id, 'P_EMP_ID',TEXT_parameter, TO_CHAR(:invoice.p_emp_id));

IF :invoice.p_ok = 1 THEN
   IF :invoice.INV_TYP = 1 THEN
      run_product(reports, 'd:\m_cashear\invoice_new',     synchronous, runtime, filesystem, list_id, null);
      run_product(reports, 'd:\m_cashear\invoice_new',     synchronous, runtime, filesystem, list_id, null);
   ELSE
      run_product(reports, 'd:\m_cashear\invoice_new_min.rep', synchronous, runtime, filesystem, list_id, null);
      run_product(reports, 'd:\m_cashear\invoice_new_min.rep', synchronous, runtime, filesystem, list_id, null);
   END IF;
   destroy_parameter_list(list_id);
   ...
END IF;
```

**Findings:**
- The `run_product` call is made **twice** — deliberate "print 2 copies" (not a bug).
- Target report is `invoice_new.rdf` (paid, table-dining) OR `invoice_new_min.rep` (paid, other). The latter is **NOT in the recovered REX catalog** (see BLK-010 — it's a compiled `.rep` not in the `M_CASHEAR` dir; probably on the production machine only).
- Printer name is `point_tbl.prnt_n || ',LPT1:'` — Windows-style printer port suffix, hardcoded to LPT1.

## Timers — `invoice_t`, `kaed_t`, `mdir_t`

Three 6-second repeat timers, created on form open. `WHEN-TIMER-EXPIRED` handles auto-refresh of the master-detail queries (likely polling for kitchen state changes or external invoice edits on the same (POINT, DATE) combo).

## State-change graph (invoice lifecycle)

```
                ┌────────────┐
                │  FORM OPEN │ ← LOG_IN_IN dispatches with parameters
                │ POINT gate │   (dt, e_id, pt_code, wrdia)
                └──────┬─────┘
                       │ wstatus=1 ?
                       ▼
          ┌──────────────────────┐
          │  NEW INVOICE (empty) │
          │   p_ok=0, ser_no=0   │
          └──────────┬───────────┘
                     │
                     │ PRE-INSERT → serial_no := MAX+1 from invoice_hist
                     ▼
          ┌──────────────────────┐
          │  OPEN INVOICE        │
          │   serial_no set      │
          │   editable           │◄──┐
          └──────────┬───────────┘   │ add/remove items
                     │ POST-CHANGE   │ update qty
                     │ item lookup   │
                     ▼               │
          ┌──────────────────────┐   │
          │   INV_DTL rows       │───┘
          │   totals recomputed  │
          └──────────┬───────────┘
                     │
            ┌────────┴────────┐
            │                 │
       PAY button         DELETE button
            │                 │
            │ p_ok := 1       │ show_alert('del') → 88 cancels
            │ ser_no := MAX+1 │ DELETE inv_dtl
            │ (from WHERE     │ invoice.p_ok := 1, inv_tot := 0, del_flg := 1
            │  p_ok=1 subset) │
            ▼                 ▼
          ┌──────────────────────┐
          │  CLOSED INVOICE      │
          │   p_ok=1             │
          │   read-only          │
          └──────────┬───────────┘
                     │ PRINT button
                     ▼
          ┌──────────────────────┐
          │  run_product ×2      │
          │  invoice_new[_min]   │
          │  destype=printer     │
          │  desname=<prnt>,LPT1:│
          └──────────────────────┘
```

## Modernization notes

1. **Dual counter must be preserved.** `SERIAL_NO` and `SER_NO` are independent per-(point, date) counters; reports and the receipt layout depend on `SER_NO` being the "paid-only" subset. A naive single-sequence replacement will break reporting.

2. **Weekday enable flags** (`point_tbl.d1..d7`) are the only thing preventing a cashier from opening a sale on a closed day. Port this to the modern config system — do NOT drop it.

3. **Timer-driven auto-refresh** (6s polling) is a Forms-specific way to get real-time updates. In modern stack, replace with WebSocket push or SSE; the polling frequency itself can be relaxed.

4. **Printer hardwired to LPT1.** Needs conversion to IPP / CUPS / Windows printer queue by name. `point_tbl.prnt_n` already carries the printer name; drop the `,LPT1:` suffix.

5. **Report invocation**: the `run_product(reports, 'd:\m_cashear\invoice_new', ...)` call style must become `RUN_REPORT_OBJECT` or (in web) a direct call to the Reports server URL. The `invoice_new_min.rep` file is missing from the repo — recover from production (BLK-010).

6. **2-decimal floor rounding** on money fields is the house convention. All migration code must match (PostgreSQL: `FLOOR(x*100)/100`; application tier: `math.floor(x*100)/100`). Banker's rounding will change totals by one cent in some cases.

7. **Audit fields**: `del_flg` (soft-delete), `p_emp_id` (paid-by-whom), `u_ok`/`u_emp_id` (updated-by, found commented-out — never released). Keep `del_flg` + `p_emp_id` in the migrated schema.

8. **`p_ok` semantics**: the column is paid-flag AND locked-flag AND included-in-reports flag. Three semantics in one boolean. Consider splitting on migration (status enum: `OPEN`/`PAID`/`CANCELLED` + separate immutability guard).
