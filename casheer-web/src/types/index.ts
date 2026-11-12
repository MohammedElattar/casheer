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

export interface LoginResponse {
  access: string;
  refresh: string;
  employee: Employee;
}
