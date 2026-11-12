-- Casheer initial schema (redesigned from legacy MAHROSA.* Oracle schema).
-- Preserves business invariants, drops Oracle-specific baggage.
-- Reference: ../../casheer/docs/workflows/sery-invoice-lifecycle.md

CREATE EXTENSION IF NOT EXISTS pgcrypto;  -- for gen_random_uuid()

-- ─── Employees ────────────────────────────────────────────────────────────
-- Replaces legacy emp_tbl.
CREATE TABLE employees (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code            TEXT NOT NULL UNIQUE,              -- was emp_tbl.emp_id
  name            TEXT NOT NULL,
  password_hash   TEXT NOT NULL,                     -- bcrypt(password, 12)
  role            TEXT NOT NULL CHECK (role IN ('CASHIER','SUPERVISOR','ADMIN')),
  active          BOOLEAN NOT NULL DEFAULT TRUE,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ─── Points of sale ───────────────────────────────────────────────────────
-- Replaces legacy point_tbl. Preserves weekday mask + service % + min charge.
CREATE TABLE points (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code                INTEGER NOT NULL UNIQUE,       -- was point_tbl.point_code
  name                TEXT NOT NULL,
  service_percent     NUMERIC(5,2) NOT NULL DEFAULT 0,  -- was p_serv_per
  min_charge          NUMERIC(10,2) NOT NULL DEFAULT 0, -- was min_charge
  printer_name        TEXT,                              -- was prnt_n
  -- 7-bit weekday enable flags: bit i = day-of-week i (ISO: 1=Mon .. 7=Sun).
  -- bit set -> point open that weekday. Replaces legacy d1..d7 columns.
  weekday_mask        SMALLINT NOT NULL DEFAULT 127 CHECK (weekday_mask BETWEEN 0 AND 127),
  m_status            SMALLINT NOT NULL DEFAULT 1,    -- was w_status: 0 disabled, 1 enabled
  active              BOOLEAN NOT NULL DEFAULT TRUE,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ─── Item types / categories ──────────────────────────────────────────────
CREATE TABLE item_types (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code        INTEGER NOT NULL UNIQUE,              -- was item_type.t_code
  name        TEXT NOT NULL,
  active      BOOLEAN NOT NULL DEFAULT TRUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ─── Items (menu) ─────────────────────────────────────────────────────────
CREATE TABLE items (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code          INTEGER NOT NULL UNIQUE,            -- was item_tbl.i_code
  name          TEXT NOT NULL,
  type_id       UUID NOT NULL REFERENCES item_types(id),
  default_price NUMERIC(10,2) NOT NULL,
  active        BOOLEAN NOT NULL DEFAULT TRUE,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Per-point price override. Was item_point (point_code, i_code, price).
CREATE TABLE point_items (
  point_id    UUID NOT NULL REFERENCES points(id)   ON DELETE CASCADE,
  item_id     UUID NOT NULL REFERENCES items(id)    ON DELETE CASCADE,
  price       NUMERIC(10,2) NOT NULL,
  PRIMARY KEY (point_id, item_id)
);

-- ─── Shifts ───────────────────────────────────────────────────────────────
-- Replaces the flat (emp_id, point_id, shift_typ, inv_date) tuple that
-- every legacy table dragged around.
CREATE TABLE shifts (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  shift_date    DATE NOT NULL,
  shift_kind    SMALLINT NOT NULL,                 -- was shift_typ / wrdia
  employee_id   UUID NOT NULL REFERENCES employees(id),
  point_id      UUID NOT NULL REFERENCES points(id),
  started_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  closed_at     TIMESTAMPTZ,
  UNIQUE (shift_date, shift_kind, employee_id, point_id)
);

-- Replaces emp_point (per-employee-per-point-per-shift allow list).
CREATE TABLE employee_point_permissions (
  employee_id   UUID NOT NULL REFERENCES employees(id) ON DELETE CASCADE,
  point_id      UUID NOT NULL REFERENCES points(id)    ON DELETE CASCADE,
  shift_kind    SMALLINT NOT NULL,
  PRIMARY KEY (employee_id, point_id, shift_kind)
);

-- ─── Invoice types ────────────────────────────────────────────────────────
-- Values preserved from legacy inv_typ to keep report semantics:
--   1 = TABLE (regular dine-in)
--   2 = ROOM  (hotel-room charge / deferred)
--   3 = MANAGER_OVERRIDE
--   4 = FIXED_SUM
--   5 = EMPLOYEE
-- Represented as a CHECK constraint to keep JSON payloads simple.

-- ─── Invoices ─────────────────────────────────────────────────────────────
-- Dual counter: serial_no (all invoices) vs ser_no (paid-only receipt number).
-- Replaces INVOICE + the `p_ok` / `del_flg` boolean overload with status enum.
CREATE TABLE invoices (
  id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  serial_no               INTEGER NOT NULL,
  ser_no                  INTEGER,
  point_id                UUID    NOT NULL REFERENCES points(id),
  inv_date                DATE    NOT NULL,
  shift_id                UUID    NOT NULL REFERENCES shifts(id),
  employee_id             UUID    NOT NULL REFERENCES employees(id),

  inv_type                SMALLINT NOT NULL CHECK (inv_type BETWEEN 1 AND 5),
  madf_type               SMALLINT NOT NULL DEFAULT 1 CHECK (madf_type BETWEEN 1 AND 3),

  table_no                INTEGER,
  person_count            INTEGER,

  service_percent         NUMERIC(5,2) NOT NULL DEFAULT 0,
  discount_percent        NUMERIC(5,2) NOT NULL DEFAULT 0,

  subtotal                NUMERIC(12,2) NOT NULL DEFAULT 0,  -- sum of lines
  service_amount          NUMERIC(12,2) NOT NULL DEFAULT 0,  -- FLOOR(subtotal*serv/100*100)/100
  discount_amount         NUMERIC(12,2) NOT NULL DEFAULT 0,  -- FLOOR(subtotal*disc/100*100)/100
  total                   NUMERIC(12,2) NOT NULL DEFAULT 0,  -- subtotal + service - discount

  status                  TEXT NOT NULL DEFAULT 'OPEN'
                          CHECK (status IN ('OPEN','PAID','CANCELLED')),

  paid_at                 TIMESTAMPTZ,
  paid_by_employee_id     UUID REFERENCES employees(id),
  cancelled_at            TIMESTAMPTZ,
  cancelled_by_employee_id UUID REFERENCES employees(id),
  cancel_reason           TEXT,

  note                    TEXT,
  created_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at              TIMESTAMPTZ NOT NULL DEFAULT now(),

  UNIQUE (point_id, inv_date, serial_no)
);

-- ser_no is unique only within paid invoices for a (point, date). Partial unique index.
CREATE UNIQUE INDEX uq_invoices_serno_paid
  ON invoices (point_id, inv_date, ser_no)
  WHERE status = 'PAID' AND ser_no IS NOT NULL;

CREATE INDEX ix_invoices_status  ON invoices (status);
CREATE INDEX ix_invoices_point_date ON invoices (point_id, inv_date);
CREATE INDEX ix_invoices_shift   ON invoices (shift_id);

-- ─── Invoice lines ────────────────────────────────────────────────────────
-- Replaces INV_DTL. Composite legacy key becomes a simple FK to invoices.id.
CREATE TABLE invoice_lines (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_id    UUID NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,
  line_no       INTEGER NOT NULL,            -- 1-based display order
  item_id       UUID NOT NULL REFERENCES items(id),
  qty           NUMERIC(10,3) NOT NULL CHECK (qty > 0 AND qty <= 9999),
  unit_price    NUMERIC(10,2) NOT NULL,
  line_total    NUMERIC(12,2) NOT NULL,      -- qty * unit_price, floor-rounded
  note          TEXT,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (invoice_id, line_no)
);

CREATE INDEX ix_invoice_lines_invoice ON invoice_lines (invoice_id);

-- ─── Refresh tokens (JWT refresh rotation) ────────────────────────────────
CREATE TABLE refresh_tokens (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  employee_id   UUID NOT NULL REFERENCES employees(id) ON DELETE CASCADE,
  token_hash    TEXT NOT NULL UNIQUE,         -- SHA-256 of refresh JWT
  expires_at    TIMESTAMPTZ NOT NULL,
  revoked_at    TIMESTAMPTZ,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX ix_refresh_tokens_employee ON refresh_tokens (employee_id);

-- ─── updated_at trigger ───────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION set_updated_at() RETURNS TRIGGER AS $$
BEGIN NEW.updated_at := now(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_employees_updated BEFORE UPDATE ON employees FOR EACH ROW EXECUTE FUNCTION set_updated_at();
CREATE TRIGGER trg_points_updated    BEFORE UPDATE ON points    FOR EACH ROW EXECUTE FUNCTION set_updated_at();
CREATE TRIGGER trg_items_updated     BEFORE UPDATE ON items     FOR EACH ROW EXECUTE FUNCTION set_updated_at();
CREATE TRIGGER trg_invoices_updated  BEFORE UPDATE ON invoices  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
