export type UUID = string;

export interface Employee {
  id: UUID;
  code: string;
  name: string;
  role: 'CASHIER' | 'SUPERVISOR' | 'ADMIN';
}

export interface Point {
  id: UUID;
  code: number;
  name: string;
  service_percent: string;
  min_charge: string;
  printer_name: string | null;
  weekday_mask: number;
  m_status: number;
  active: boolean;
  shift_kinds?: number[];
}

export interface ItemType {
  id: UUID;
  code: number;
  name: string;
}

export interface Item {
  id: UUID;
  code: number;
  name: string;
  type_id: UUID;
  type_name: string;
  price: string;
  active: boolean;
}

export interface Shift {
  id: UUID;
  shift_date: string;
  shift_kind: number;
  employee_id: UUID;
  point_id: UUID;
  started_at: string;
  closed_at: string | null;
}

export type InvoiceStatus = 'OPEN' | 'PAID' | 'CANCELLED';
export type ClientType = 'CIVILIAN' | 'MEMBER' | 'GUEST';

export interface MemberCard {
  m_bar: string;
  mem_serial: number;
  mem_id: number;
  mem_name: string;
  rank_name: string | null;
  m_kind: number;
  m_year: number;
  m_typ: number;
  discount_percent: string;
  flg_ok: number;
}

export interface OccupiedRoom {
  h_no: string;
  guest_name: string;
  room_no: number;
  h_from: string;
  h_to: string;
  tel_no: string | null;
  eskan_typ: number;
  level_code: number;
  room_type: string;
  reception_rest_total: string;
}

export interface Invoice {
  id: UUID;
  serial_no: number;
  ser_no: number | null;
  point_id: UUID;
  inv_date: string;
  shift_id: UUID;
  employee_id: UUID;
  inv_type: number;
  madf_type: number;
  table_no: number | null;
  person_count: number | null;
  service_percent: string;
  discount_percent: string;
  client_type: ClientType;
  mem_id: number | null;
  mem_serial: number | null;
  mem_bar: string | null;
  mem_name: string | null;
  mem_rank: string | null;
  room_no: number | null;
  h_no: string | null;
  guest_name: string | null;
  subtotal: string;
  service_amount: string;
  discount_amount: string;
  total: string;
  status: InvoiceStatus;
  paid_at: string | null;
  paid_by_employee_id: UUID | null;
  cancelled_at: string | null;
  cancelled_by_employee_id: UUID | null;
  cancel_reason: string | null;
  note: string | null;
  lines_count?: number;
  is_captain_order?: boolean;
  created_at: string;
  updated_at: string;
}

export interface InvoiceLine {
  id: UUID;
  invoice_id: UUID;
  line_no: number;
  item_id: UUID;
  item_code: number;
  item_name: string;
  qty: string;
  unit_price: string;
  line_total: string;
  note: string | null;
  created_at: string;
}

export interface EmployeePortsLookupResponse {
  employee: Employee;
  points: Point[];
}

export interface LoginResponse {
  access: string;
  refresh: string;
  employee: Employee;
  point: Point;
  shift: Shift;
  assigned_points: Point[];
}

export interface ShiftBucket {
  count: number;
  subtotal: string;
  service_amount: string;
  discount_amount: string;
  total: string;
}

export interface ShiftDispensedItem {
  item_code: number;
  item_name: string;
  type_name: string;
  unit_price: string;
  qty_sold: number;
  total_sold: string;
}

export interface ShiftCloseSummary {
  shift: {
    id: UUID;
    shift_date: string;
    shift_kind: number;
    shift_name: string;
    started_at: string;
    closed_at: string | null;
  };
  employee: Employee;
  point: {
    id: UUID;
    code: number;
    name: string;
    service_percent: string;
  };
  breakdown: {
    civilian: ShiftBucket;
    member: ShiftBucket;
    cash_total: ShiftBucket;
    guest: ShiftBucket;
    deferred_total: ShiftBucket;
    grand_total: ShiftBucket;
  };
  open_invoices_count: number;
  cancelled_invoices_count: number;
  invoices: Invoice[];
  items_dispensed: ShiftDispensedItem[];
  items_total_qty: number;
  items_subtotal: string;
}
