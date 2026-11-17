-- 0005_clients_members_rooms.sql
-- Support for the 3 Mahrosa Client Types on Invoices:
--   1. مشترك (MEMBER)   -> QR / Barcode Card Scan (MAIN_MEMB, MEMB_BAR, POINT_MEM)
--   2. نزيل   (GUEST)    -> Hotel Room Charge sent to Reception (ROOMS, HAGZ_TBL, ROOM_ACCOUNT, CUST_REST)
--   3. مدنى   (CIVILIAN) -> Regular Customer
-- Plus default 12% service charge (الخدمة 12%).

-- 1. Ensure default service charge on dining points and invoices is 12%
ALTER TABLE points ALTER COLUMN service_percent SET DEFAULT 12.00;
UPDATE points SET service_percent = 12.00 WHERE service_percent > 0;

ALTER TABLE invoices ALTER COLUMN service_percent SET DEFAULT 12.00;

-- 2. Add client, member (مشترك), and hotel guest/room (نزيل) columns to invoices
ALTER TABLE invoices
  ADD COLUMN IF NOT EXISTS client_type TEXT NOT NULL DEFAULT 'CIVILIAN'
    CHECK (client_type IN ('CIVILIAN', 'MEMBER', 'GUEST')),
  ADD COLUMN IF NOT EXISTS mem_id      BIGINT,
  ADD COLUMN IF NOT EXISTS mem_serial  BIGINT,
  ADD COLUMN IF NOT EXISTS mem_bar     TEXT,
  ADD COLUMN IF NOT EXISTS mem_name    TEXT,
  ADD COLUMN IF NOT EXISTS mem_rank    TEXT,
  ADD COLUMN IF NOT EXISTS room_no     INTEGER,
  ADD COLUMN IF NOT EXISTS h_no        TEXT,
  ADD COLUMN IF NOT EXISTS guest_name  TEXT;

-- 3. Legacy-compatible Membership Tables (MAIN_MEMB & MEMB_BAR) for QR / Barcode Card Scanning
CREATE TABLE IF NOT EXISTS main_memb (
  mem_serial  BIGINT PRIMARY KEY,
  mem_name    TEXT NOT NULL,
  rank_name   TEXT,
  tel         TEXT,
  mobil       TEXT,
  active      BOOLEAN NOT NULL DEFAULT TRUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS memb_bar (
  m_bar            TEXT PRIMARY KEY,               -- Scanned QR / Barcode string on member card
  mem_serial       BIGINT NOT NULL REFERENCES main_memb(mem_serial) ON DELETE CASCADE,
  mem_id           BIGINT NOT NULL,                -- Membership card number (رقم العضوية)
  m_kind           SMALLINT NOT NULL DEFAULT 1,    -- 1 = عضو عامل (Primary), 2 = تابع (Dependent)
  m_year           INTEGER NOT NULL DEFAULT EXTRACT(YEAR FROM CURRENT_DATE)::INT,
  m_typ            SMALLINT NOT NULL DEFAULT 1,
  discount_percent NUMERIC(5,2) NOT NULL DEFAULT 15.00 CHECK (discount_percent >= 0 AND discount_percent <= 100),
  flg_ok           SMALLINT NOT NULL DEFAULT 1,    -- 1 = Active/Valid card, 0 = Stopped
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS ix_memb_bar_mem_id ON memb_bar (mem_id);

-- 4. Legacy-compatible Hotel Reception / Room Tables (ROOMS, HAGZ_TBL, ROOM_ACCOUNT, CUST_REST)
CREATE TABLE IF NOT EXISTS rooms (
  room_no     INTEGER PRIMARY KEY,
  level_code  SMALLINT NOT NULL DEFAULT 1,
  room_type   TEXT NOT NULL DEFAULT 'غرفة مزدوجة',
  status      SMALLINT NOT NULL DEFAULT 1          -- 1 = Occupied (مشغولة), 0 = Vacant (شاغرة)
);

CREATE TABLE IF NOT EXISTS hagz_tbl (
  h_no        TEXT PRIMARY KEY,                    -- Reservation number (رقم الحجز)
  h_name      TEXT NOT NULL,                       -- Guest full name (اسم النزيل)
  room_no     INTEGER NOT NULL REFERENCES rooms(room_no),
  h_from      DATE NOT NULL DEFAULT CURRENT_DATE,
  h_to        DATE NOT NULL DEFAULT (CURRENT_DATE + 3),
  tel_no      TEXT,
  eskan_typ   SMALLINT NOT NULL DEFAULT 1,
  out_flag    SMALLINT NOT NULL DEFAULT 0,         -- 0 = Currently Checked-In (مقيم حالياً), 1 = Checked-Out
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS ix_hagz_tbl_room_active ON hagz_tbl (room_no, out_flag);

CREATE TABLE IF NOT EXISTS room_account (
  h_no        TEXT NOT NULL REFERENCES hagz_tbl(h_no) ON DELETE CASCADE,
  room_no     INTEGER NOT NULL REFERENCES rooms(room_no),
  r_date      DATE NOT NULL DEFAULT CURRENT_DATE,
  price       NUMERIC(12,2) NOT NULL DEFAULT 0,    -- Room accommodation charge
  rest_q      NUMERIC(12,2) NOT NULL DEFAULT 0,    -- Restaurant / POS charges sent to Reception (مطاعم وكافيتريات)
  r_rem       TEXT,
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (h_no, room_no, r_date)
);

CREATE TABLE IF NOT EXISTS cust_rest (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_id  UUID UNIQUE REFERENCES invoices(id) ON DELETE CASCADE,
  serial_no   INTEGER NOT NULL,
  ser_no      INTEGER,
  point_code  INTEGER NOT NULL,
  point_name  TEXT,
  inv_date    DATE NOT NULL,
  shift_typ   SMALLINT NOT NULL DEFAULT 1,
  room_no     INTEGER NOT NULL,
  h_no        TEXT NOT NULL,
  guest_name  TEXT NOT NULL,
  inv_tot     NUMERIC(12,2) NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS ix_cust_rest_room ON cust_rest (room_no, h_no);
