-- 0004_captain_order_m2.sql
-- Legacy-compatible Captain Order tables (M2_INV, M2_INV_DETAILS, M2_SERIAL_RESERVATION, M2_PRINTINGFILES)
-- plus PostgreSQL triggers that automatically synchronize Captain Order submissions
-- into the Cashier's `invoices` (status = 'OPEN') and `invoice_lines` tables.

CREATE SEQUENCE IF NOT EXISTS m2_inv_serial_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE IF NOT EXISTS m2_inv (
  inv_serial      BIGINT PRIMARY KEY DEFAULT nextval('m2_inv_serial_seq'),
  inv_number      INTEGER,                          -- Maps to invoices.serial_no
  inv_date        DATE NOT NULL DEFAULT CURRENT_DATE,
  table_number    INTEGER,                          -- Maps to invoices.table_no
  remarks         TEXT,                             -- Maps to invoices.note
  point_code      INTEGER NOT NULL,                 -- Maps to points.code
  user_id         TEXT,                             -- Maps to employees.code (Captain ID)
  noofperson      INTEGER,                          -- Maps to invoices.person_count
  shift_type      SMALLINT NOT NULL DEFAULT 1,      -- Maps to shifts.shift_kind (1,2,3)
  kitchen_notify   VARCHAR(10) DEFAULT '0',
  halawany_notify VARCHAR(10) DEFAULT '0',
  invoice_id      UUID REFERENCES invoices(id) ON DELETE SET NULL,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS ix_m2_inv_point_date ON m2_inv (point_code, inv_date);
CREATE INDEX IF NOT EXISTS ix_m2_inv_invoice_id ON m2_inv (invoice_id);

CREATE TABLE IF NOT EXISTS m2_inv_details (
  inv_serial           BIGINT NOT NULL REFERENCES m2_inv(inv_serial) ON DELETE CASCADE,
  serial               INTEGER NOT NULL,
  good_code             VARCHAR(100) NOT NULL,       -- Maps to items.code
  good_name            VARCHAR(1000),               -- Maps to items.name
  quantity             NUMERIC(10,3) NOT NULL CHECK (quantity > 0 AND quantity <= 9999),
  canceled             VARCHAR(10) DEFAULT '0',
  start_time           TIMESTAMPTZ,
  end_time             TIMESTAMPTZ,
  blocked              VARCHAR(10) DEFAULT '0',
  inv_i_serial         INTEGER,                     -- Maps to invoice_lines.line_no
  request_del_stat     VARCHAR(10),
  user_request_del     VARCHAR(100),
  user_started         VARCHAR(50),
  user_end             VARCHAR(50),
  manager_deal_request VARCHAR(50),
  remarks              VARCHAR(1000),               -- Maps to invoice_lines.note
  addtime              TIMESTAMPTZ NOT NULL DEFAULT now(),
  curr_user_id         VARCHAR(50),
  start_token          VARCHAR(50),
  pointcode            INTEGER NOT NULL,
  invoice_line_id      UUID,
  PRIMARY KEY (inv_serial, serial, pointcode)
);

ALTER TABLE m2_inv_details DROP CONSTRAINT IF EXISTS m2_inv_details_invoice_line_id_fkey;

CREATE TABLE IF NOT EXISTS m2_serial_reservation (
  point_code  INTEGER NOT NULL,
  inv_day     DATE NOT NULL,
  inv_number  INTEGER NOT NULL,
  inv_serial  BIGINT NOT NULL,
  PRIMARY KEY (point_code, inv_day, inv_number)
);

CREATE TABLE IF NOT EXISTS m2_printingfiles (
  serial         BIGSERIAL,
  printer_name   VARCHAR(200),
  file_name      VARCHAR(200) NOT NULL,
  printed        VARCHAR(10) DEFAULT '0',
  file_date      TIMESTAMPTZ DEFAULT now(),
  print_date     TIMESTAMPTZ,
  ping_status    VARCHAR(200),
  printer_status VARCHAR(1000),
  PRIMARY KEY (serial, file_name)
);

-- Helper function: recompute an invoice's totals using legacy FLOOR(x*100)/100 rule.
CREATE OR REPLACE FUNCTION recompute_invoice_totals_fn(p_invoice_id UUID) RETURNS VOID AS $$
DECLARE
  v_sub       NUMERIC(12,2);
  v_serv_per  NUMERIC(5,2);
  v_disc_per  NUMERIC(5,2);
  v_serv_amt  NUMERIC(12,2);
  v_disc_amt  NUMERIC(12,2);
  v_total     NUMERIC(12,2);
BEGIN
  SELECT COALESCE(SUM(line_total), 0)
    INTO v_sub
    FROM invoice_lines
   WHERE invoice_id = p_invoice_id;

  v_sub := FLOOR(v_sub * 100) / 100;

  SELECT service_percent, discount_percent
    INTO v_serv_per, v_disc_per
    FROM invoices
   WHERE id = p_invoice_id;

  v_serv_amt := FLOOR((v_sub * COALESCE(v_serv_per, 0) / 100.0) * 100) / 100;
  v_disc_amt := FLOOR((v_sub * COALESCE(v_disc_per, 0) / 100.0) * 100) / 100;
  v_total    := FLOOR((v_sub + v_serv_amt - v_disc_amt) * 100) / 100;

  UPDATE invoices
     SET subtotal        = v_sub,
         service_amount  = v_serv_amt,
         discount_amount = v_disc_amt,
         total           = v_total
   WHERE id = p_invoice_id;
END;
$$ LANGUAGE plpgsql;

-- Trigger 1: When a Captain Order header is inserted into M2_INV,
-- automatically find or create an OPEN invoice in `invoices` for that point/date/table.
CREATE OR REPLACE FUNCTION trg_m2_inv_before_insert() RETURNS TRIGGER AS $$
DECLARE
  v_point        RECORD;
  v_emp_id       UUID;
  v_shift_id     UUID;
  v_existing_inv RECORD;
  v_serial_no    INTEGER;
  v_invoice_id   UUID;
BEGIN
  IF NEW.inv_date IS NULL THEN
    NEW.inv_date := CURRENT_DATE;
  END IF;
  IF NEW.shift_type IS NULL OR NEW.shift_type NOT IN (1, 2, 3) THEN
    NEW.shift_type := 1;
  END IF;

  -- 1. Resolve point by point_code
  SELECT id, code, service_percent
    INTO v_point
    FROM points
   WHERE code = NEW.point_code AND active = TRUE
   LIMIT 1;

  IF v_point.id IS NULL THEN
    RAISE EXCEPTION 'M2_INV: Point code % not found or inactive', NEW.point_code;
  END IF;

  -- 2. Resolve employee by user_id (code), or fallback to an assigned employee on this point
  IF NEW.user_id IS NOT NULL THEN
    SELECT id INTO v_emp_id FROM employees WHERE code = NEW.user_id AND active = TRUE LIMIT 1;
  END IF;

  IF v_emp_id IS NULL THEN
    SELECT e.id
      INTO v_emp_id
      FROM employees e
      JOIN employee_point_permissions epp ON epp.employee_id = e.id
     WHERE epp.point_id = v_point.id AND e.active = TRUE
     ORDER BY e.created_at
     LIMIT 1;
  END IF;

  IF v_emp_id IS NULL THEN
    SELECT id INTO v_emp_id FROM employees WHERE active = TRUE ORDER BY created_at LIMIT 1;
  END IF;

  -- 3. Reuse an active open shift on this point & date, or open/upsert one
  SELECT id
    INTO v_shift_id
    FROM shifts
   WHERE point_id = v_point.id
     AND shift_date = NEW.inv_date
     AND shift_kind = NEW.shift_type
     AND closed_at IS NULL
   ORDER BY started_at DESC
   LIMIT 1;

  IF v_shift_id IS NULL THEN
    INSERT INTO shifts (shift_date, shift_kind, employee_id, point_id)
    VALUES (NEW.inv_date, NEW.shift_type, v_emp_id, v_point.id)
    ON CONFLICT (shift_date, shift_kind, employee_id, point_id)
    DO UPDATE SET closed_at = NULL
    RETURNING id INTO v_shift_id;
  END IF;

  -- 4. If an OPEN invoice already exists for this (point, date, table_number), attach to it
  -- so additional Captain Orders for the same table append to the open bill.
  IF NEW.table_number IS NOT NULL THEN
    SELECT id, serial_no
      INTO v_existing_inv
      FROM invoices
     WHERE point_id = v_point.id
       AND inv_date = NEW.inv_date
       AND table_no = NEW.table_number
       AND status = 'OPEN'
     ORDER BY created_at DESC
     LIMIT 1;
  END IF;

  IF v_existing_inv.id IS NOT NULL THEN
    NEW.inv_number := v_existing_inv.serial_no;
    NEW.invoice_id := v_existing_inv.id;
    IF NEW.noofperson IS NOT NULL THEN
      UPDATE invoices SET person_count = NEW.noofperson WHERE id = v_existing_inv.id;
    END IF;
  ELSE
    SELECT COALESCE(MAX(serial_no), 0) + 1
      INTO v_serial_no
      FROM invoices
     WHERE point_id = v_point.id AND inv_date = NEW.inv_date;

    INSERT INTO invoices (
      serial_no, point_id, inv_date, shift_id, employee_id,
      inv_type, madf_type, table_no, person_count,
      service_percent, status, note
    ) VALUES (
      v_serial_no, v_point.id, NEW.inv_date, v_shift_id, v_emp_id,
      1, 1, NEW.table_number, NEW.noofperson,
      v_point.service_percent, 'OPEN', NEW.remarks
    )
    RETURNING id INTO v_invoice_id;

    NEW.inv_number := v_serial_no;
    NEW.invoice_id := v_invoice_id;

    INSERT INTO m2_serial_reservation (point_code, inv_day, inv_number, inv_serial)
    VALUES (NEW.point_code, NEW.inv_date, v_serial_no, NEW.inv_serial)
    ON CONFLICT (point_code, inv_day, inv_number) DO NOTHING;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_m2_inv_sync ON m2_inv;
CREATE TRIGGER trg_m2_inv_sync
  BEFORE INSERT ON m2_inv
  FOR EACH ROW
  EXECUTE FUNCTION trg_m2_inv_before_insert();

-- Trigger 2: When Captain Order line items are inserted/updated/deleted in M2_INV_DETAILS,
-- automatically insert/update/delete the corresponding row in `invoice_lines` and recompute totals.
CREATE OR REPLACE FUNCTION trg_m2_inv_details_sync_fn() RETURNS TRIGGER AS $$
DECLARE
  v_m2          RECORD;
  v_inv         RECORD;
  v_item        RECORD;
  v_price       NUMERIC(10,2);
  v_line_no     INTEGER;
  v_line_total  NUMERIC(12,2);
  v_line_id     UUID;
  v_is_canceled BOOLEAN;
BEGIN
  IF TG_OP = 'DELETE' THEN
    IF OLD.invoice_line_id IS NOT NULL THEN
      SELECT invoice_id INTO v_inv FROM invoice_lines WHERE id = OLD.invoice_line_id;
      DELETE FROM invoice_lines WHERE id = OLD.invoice_line_id;
      IF v_inv.invoice_id IS NOT NULL THEN
        PERFORM recompute_invoice_totals_fn(v_inv.invoice_id);
      END IF;
    END IF;
    RETURN OLD;
  END IF;

  -- Locate parent M2_INV row
  SELECT * INTO v_m2 FROM m2_inv WHERE inv_serial = NEW.inv_serial LIMIT 1;
  IF v_m2.inv_serial IS NULL OR v_m2.invoice_id IS NULL THEN
    RAISE EXCEPTION 'M2_INV_DETAILS: Parent M2_INV % not found', NEW.inv_serial;
  END IF;

  -- Check that target invoice is still OPEN
  SELECT * INTO v_inv FROM invoices WHERE id = v_m2.invoice_id FOR UPDATE;
  IF v_inv.id IS NULL THEN
    RAISE EXCEPTION 'M2_INV_DETAILS: Linked invoice % not found', v_m2.invoice_id;
  END IF;
  IF v_inv.status <> 'OPEN' THEN
    RAISE EXCEPTION 'M2_INV_DETAILS: Cannot modify closed/cancelled invoice (status=%)', v_inv.status;
  END IF;

  v_is_canceled := COALESCE(NEW.canceled, '0') IN ('1', 'Y', 'y', 'true', 'TRUE');

  IF TG_OP = 'INSERT' THEN
    -- Resolve item by code (GOOD_CODE)
    SELECT i.id, i.code, i.name, COALESCE(pi.price, i.default_price) AS unit_price
      INTO v_item
      FROM items i
      LEFT JOIN point_items pi ON pi.item_id = i.id AND pi.point_id = v_inv.point_id
     WHERE i.code = NEW.good_code::integer AND i.active = TRUE
     LIMIT 1;

    IF v_item.id IS NULL THEN
      RAISE EXCEPTION 'M2_INV_DETAILS: Item code % not found or inactive', NEW.good_code;
    END IF;

    IF NEW.good_name IS NULL OR NEW.good_name = '' THEN
      NEW.good_name := v_item.name;
    END IF;

    IF NOT v_is_canceled THEN
      SELECT COALESCE(MAX(line_no), 0) + 1
        INTO v_line_no
        FROM invoice_lines
       WHERE invoice_id = v_inv.id;

      v_price      := v_item.unit_price;
      v_line_total := FLOOR((NEW.quantity * v_price) * 100) / 100;

      INSERT INTO invoice_lines (
        invoice_id, line_no, item_id, qty, unit_price, line_total, note
      ) VALUES (
        v_inv.id, v_line_no, v_item.id, NEW.quantity, v_price, v_line_total, NEW.remarks
      )
      RETURNING id INTO v_line_id;

      NEW.inv_i_serial    := v_line_no;
      NEW.invoice_line_id := v_line_id;

      PERFORM recompute_invoice_totals_fn(v_inv.id);
    END IF;
    RETURN NEW;

  ELSIF TG_OP = 'UPDATE' THEN
    IF v_is_canceled AND OLD.invoice_line_id IS NOT NULL THEN
      DELETE FROM invoice_lines WHERE id = OLD.invoice_line_id;
      NEW.invoice_line_id := NULL;
      PERFORM recompute_invoice_totals_fn(v_inv.id);
    ELSIF NOT v_is_canceled AND OLD.invoice_line_id IS NOT NULL THEN
      UPDATE invoice_lines
         SET qty        = NEW.quantity,
             line_total = FLOOR((NEW.quantity * unit_price) * 100) / 100,
             note       = NEW.remarks
       WHERE id = OLD.invoice_line_id;
      PERFORM recompute_invoice_totals_fn(v_inv.id);
    END IF;
    RETURN NEW;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_m2_inv_details_sync ON m2_inv_details;
CREATE TRIGGER trg_m2_inv_details_sync
  BEFORE INSERT OR UPDATE OR DELETE ON m2_inv_details
  FOR EACH ROW
  EXECUTE FUNCTION trg_m2_inv_details_sync_fn();
