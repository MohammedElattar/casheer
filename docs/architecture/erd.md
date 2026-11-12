# Casheer — V1 ERD (new Postgres schema)

**Target:** Postgres 16. Snake_case identifiers. `BIGSERIAL` PKs. All FK with `ON DELETE RESTRICT` unless noted. `created_at timestamptz NOT NULL DEFAULT now()`, `updated_at timestamptz NOT NULL DEFAULT now()` on every mutable table (trigger refreshes `updated_at`).

No `MAHROSA.*` prefix. No multi-column `d1..d7` layouts. Every invariant from `invariants.md` is enforced by a column or constraint below; trace column is in the right-hand notes.

## Tables

### `point`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `code` | `text UNIQUE NOT NULL` | legacy `point_tbl.point_code` |
| `name_ar` | `text NOT NULL` | Arabic |
| `name_en` | `text` | optional |
| `service_pct` | `numeric(5,2) NOT NULL DEFAULT 0` | % 0..100 |
| `min_charge` | `numeric(12,2) NOT NULL DEFAULT 0` | |
| `weekday_enabled` | `boolean[] NOT NULL` | **CHECK** `array_length(weekday_enabled,1) = 7`. ISO `1=Mon..7=Sun`. INV-03 |
| `printer_name` | `text` | OS print queue name |
| `active` | `boolean NOT NULL DEFAULT true` | |
| `created_at`, `updated_at` | `timestamptz` | |

### `employee`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `code` | `text UNIQUE NOT NULL` | |
| `name_ar` | `text NOT NULL` | |
| `username` | `text UNIQUE NOT NULL` | login |
| `password_hash` | `text NOT NULL` | bcrypt cost 12. INV-06 |
| `role` | `employee_role NOT NULL` | ENUM `CASHIER` / `MANAGER` / `ADMIN` |
| `active` | `boolean NOT NULL DEFAULT true` | |
| `created_at`, `updated_at` | `timestamptz` | |

ENUM: `CREATE TYPE employee_role AS ENUM ('CASHIER','MANAGER','ADMIN');`

### `item_type`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `code` | `text UNIQUE NOT NULL` | |
| `name_ar` | `text NOT NULL` | |
| `active` | `boolean NOT NULL DEFAULT true` | |

### `item`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `code` | `text UNIQUE NOT NULL` | legacy `i_code` |
| `name_ar` | `text NOT NULL` | legacy `i_name` |
| `item_type_id` | `bigint NOT NULL REFERENCES item_type(id)` | |
| `active` | `boolean NOT NULL DEFAULT true` | |
| `created_at`, `updated_at` | `timestamptz` | |

### `item_price` (history)

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `item_id` | `bigint NOT NULL REFERENCES item(id)` | |
| `price` | `numeric(12,2) NOT NULL CHECK (price >= 0)` | |
| `effective_from` | `timestamptz NOT NULL DEFAULT now()` | |

Lookup current price: `SELECT price FROM item_price WHERE item_id=$1 AND effective_from <= now() ORDER BY effective_from DESC LIMIT 1`. Index `(item_id, effective_from DESC)`.

### `shift`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `point_id` | `bigint NOT NULL REFERENCES point(id)` | |
| `shift_date` | `date NOT NULL` | |
| `shift_type` | `smallint NOT NULL` | 1=morning, 2=evening etc |
| `emp_id` | `bigint NOT NULL REFERENCES employee(id)` | opener |
| `opened_at` | `timestamptz NOT NULL DEFAULT now()` | |
| `closed_at` | `timestamptz` | NULL while open |
| `created_at`, `updated_at` | `timestamptz` | |
| UNIQUE `(point_id, shift_date, shift_type)` | | one shift per slot |

### `restaurant_table`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `code` | `text UNIQUE NOT NULL` | legacy `table_no` |
| `label` | `text` | |
| `active` | `boolean NOT NULL DEFAULT true` | |

### `room`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `code` | `text UNIQUE NOT NULL` | legacy `room_no` |
| `label` | `text` | |
| `active` | `boolean NOT NULL DEFAULT true` | |

### `invoice`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | surrogate |
| `point_id` | `bigint NOT NULL REFERENCES point(id)` | |
| `shift_id` | `bigint NOT NULL REFERENCES shift(id)` | |
| `inv_date` | `date NOT NULL` | denormalized from shift for counter speed |
| `serial_no` | `integer NOT NULL CHECK (serial_no > 0)` | INV-01 |
| `ser_no` | `integer CHECK (ser_no > 0)` | NULL until PAY. INV-01 |
| `emp_id` | `bigint NOT NULL REFERENCES employee(id)` | |
| `p_emp_id` | `bigint REFERENCES employee(id)` | PAID-by / CANCEL-by |
| `inv_type` | `invoice_type NOT NULL` | ENUM below |
| `status` | `invoice_status NOT NULL DEFAULT 'OPEN'` | INV-04 |
| `table_id` | `bigint REFERENCES restaurant_table(id)` | required when `inv_type='REGULAR'` |
| `room_id` | `bigint REFERENCES room(id)` | required when `inv_type='ROOM_CHARGE'` |
| `serv_pct` | `numeric(5,2) NOT NULL` | snapshot at OPEN. INV-10 |
| `serv_q` | `numeric(12,2) NOT NULL DEFAULT 0` | INV-02, INV-08 |
| `disc_pct` | `numeric(5,2) NOT NULL DEFAULT 0` | |
| `disc_q` | `numeric(12,2) NOT NULL DEFAULT 0` | INV-02, INV-08 |
| `inv_tot` | `numeric(12,2) NOT NULL DEFAULT 0` | INV-02, INV-08 |
| `del_flg` | `boolean NOT NULL DEFAULT false` | cancellation audit. INV-05 |
| `created_at` | `timestamptz NOT NULL DEFAULT now()` | |
| `paid_at` | `timestamptz` | |
| `cancelled_at` | `timestamptz` | |
| `updated_at` | `timestamptz NOT NULL DEFAULT now()` | |

ENUMs:

```sql
CREATE TYPE invoice_type AS ENUM
  ('REGULAR','ROOM_CHARGE','MANAGER_DISCOUNT','FIXED_SUM','EMPLOYEE_MEAL');
CREATE TYPE invoice_status AS ENUM ('OPEN','PAID','CANCELLED');
```

Constraints:

```sql
ALTER TABLE invoice
  ADD CONSTRAINT uniq_invoice_serial
    UNIQUE (point_id, inv_date, serial_no);           -- INV-09

CREATE UNIQUE INDEX uniq_invoice_ser_no
  ON invoice(point_id, inv_date, ser_no)
  WHERE ser_no IS NOT NULL;                           -- INV-09

ALTER TABLE invoice
  ADD CONSTRAINT chk_table_when_regular
    CHECK (inv_type <> 'REGULAR' OR table_id IS NOT NULL);

ALTER TABLE invoice
  ADD CONSTRAINT chk_room_when_room_charge
    CHECK (inv_type <> 'ROOM_CHARGE' OR room_id IS NOT NULL);

ALTER TABLE invoice
  ADD CONSTRAINT chk_pay_ser_no
    CHECK (status <> 'PAID' OR ser_no IS NOT NULL);
```

Indexes:

```sql
CREATE INDEX idx_invoice_point_date   ON invoice(point_id, inv_date);
CREATE INDEX idx_invoice_status_open  ON invoice(point_id, inv_date) WHERE status='OPEN';
CREATE INDEX idx_invoice_shift        ON invoice(shift_id);
```

### `invoice_line`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `invoice_id` | `bigint NOT NULL REFERENCES invoice(id) ON DELETE CASCADE` | cancel path. INV-05 |
| `line_no` | `integer NOT NULL CHECK (line_no > 0)` | |
| `item_id` | `bigint NOT NULL REFERENCES item(id)` | |
| `qty` | `numeric(10,3) NOT NULL CHECK (qty > 0 AND qty <= 9999)` | legacy cap |
| `unit_price` | `numeric(12,2) NOT NULL CHECK (unit_price >= 0)` | snapshot at insert. INV-10 |
| `line_total` | `numeric(12,2) NOT NULL` | `qty * unit_price`, floored to 2dp. INV-02 |
| `note` | `text` | |
| `created_at`, `updated_at` | `timestamptz` | |
| UNIQUE `(invoice_id, line_no)` | | INV-09 |

### `audit_log`

| Column | Type | Notes |
|---|---|---|
| `id` | `bigserial PK` | |
| `event` | `text NOT NULL` | `LOGIN`, `INVOICE_PAID`, `INVOICE_CANCELLED`, `PASSWORD_CHANGED`, etc |
| `actor_id` | `bigint REFERENCES employee(id)` | NULL on failed-login |
| `target_table` | `text` | |
| `target_id` | `bigint` | |
| `payload` | `jsonb NOT NULL DEFAULT '{}'::jsonb` | event-specific data |
| `occurred_at` | `timestamptz NOT NULL DEFAULT now()` | append-only |

Append-only: no UPDATE/DELETE grant. Index `(event, occurred_at DESC)`, `(actor_id, occurred_at DESC)`.

## Legacy → V1 column crosswalk (partial, informative)

| Legacy (Oracle) | V1 (Postgres) | Note |
|---|---|---|
| `INVOICE.SERIAL_NO` | `invoice.serial_no` | INV-01 preserved |
| `INVOICE.SER_NO` | `invoice.ser_no` | INV-01 preserved |
| `INVOICE.P_OK` | `invoice.status` | ENUM, see INV-04 |
| `INVOICE.DEL_FLG` | `invoice.del_flg` | preserved for audit |
| `INVOICE.P_EMP_ID` | `invoice.p_emp_id` | preserved |
| `POINT_TBL.D1..D7` | `point.weekday_enabled boolean[7]` | collapsed |
| `POINT_TBL.P_SERV_PER` | `point.service_pct` | renamed |
| `POINT_TBL.PRNT_N` | `point.printer_name` | no `,LPT1:` suffix |
| `ITEM_TBL.I_CODE/I_NAME` | `item.code/name_ar` | |
| `ITEM_PRICE_VIEW` | `item_price` table | view → effective-dated table |
| `EMP_TBL.PASS` | `employee.password_hash` | bcrypt. advisor back-door GONE |
| `BED_IN`, `HAGZ_*` | — | NOT in V1 |

## Open decisions

- Decimal size: `numeric(12,2)` accommodates up to ~10 billion units. Switch to `numeric(14,2)` if any point uses higher ceilings; review during seed.
- `item_price.effective_to`? Deliberately omitted — effective_from + ORDER BY handles history unambiguously, no close-off writes.
- `shift.close_totals` snapshot: deferred until `point_close` form is ported. For V1, shift close is just `closed_at := now()`.
