import { useCallback, useEffect, useState } from 'react';
import { api, HttpError } from '@/api/client';
import { useAuth } from '@/hooks/useAuth';
import { ar } from '@/i18n/ar';
import { getShiftDates } from '@/pages/Login';
import { ShiftCloseModal } from '@/components/ShiftCloseModal';
import type {
  Point, Item, Shift, Invoice, InvoiceLine,
  ClientType, MemberCard, OccupiedRoom, ShiftCloseSummary,
} from '@/types';

interface CaptainCartItem {
  item: Item;
  qty: number;
  remarks: string;
}

const CLIENT_TYPE_OPTIONS: { key: ClientType; label: string; icon: string; sub: string }[] = [
  { key: 'CIVILIAN', label: 'مدنى',  icon: '👤', sub: 'سداد مباشر بالكاشير' },
  { key: 'MEMBER',   label: 'مشترك', icon: '🪪', sub: 'مسح QR الكارنيه بالجهاز' },
  { key: 'GUEST',    label: 'نزيل',  icon: '🏨', sub: 'تحويل للريسبشن (غرف)' },
];

export function POSPage() {
  const { point: sessionPoint, shift: sessionShift, assignedPoints, setSessionShift } = useAuth();
  const { today, yesterday } = getShiftDates();

  const [points, setPoints]         = useState<Point[]>(assignedPoints);
  const [point, setPoint]           = useState<Point | null>(sessionPoint);
  const [shift, setShift]           = useState<Shift | null>(sessionShift);
  const [shiftKind, setShiftKind]   = useState<1 | 2 | 3>(1);
  const [shiftDate, setShiftDate]   = useState<string>(today);
  const [items, setItems]           = useState<Item[]>([]);
  const [activeType, setActiveType] = useState<string>('ALL');

  // Active invoice & lines
  const [invoice, setInvoice]       = useState<Invoice | null>(null);
  const [lines, setLines]           = useState<InvoiceLine[]>([]);
  const [openOrders, setOpenOrders] = useState<Invoice[]>([]);

  // Lookup data for Member QR cards & Hotel Rooms
  const [memberCards, setMemberCards]     = useState<MemberCard[]>([]);
  const [occupiedRooms, setOccupiedRooms] = useState<OccupiedRoom[]>([]);

  const [error, setError]   = useState<string | null>(null);
  const [notice, setNotice] = useState<string | null>(null);

  // Shift Closing Modal state (`نموذج إغلاق وردية منفذ` — POINT_CLOSE)
  const [shiftCloseSummary, setShiftCloseSummary] = useState<ShiftCloseSummary | null>(null);
  const [closingShiftBusy, setClosingShiftBusy]   = useState(false);

  // Captain Order Tablet simulator modal/drawer state (ONLY for non-Takeaway-Pizza ports)
  const [showCaptainPad, setShowCaptainPad] = useState(false);
  const [capTableNo, setCapTableNo]         = useState('5');
  const [capPersons, setCapPersons]         = useState('4');
  const [capRemarks, setCapRemarks]         = useState('');
  const [capCart, setCapCart]               = useState<CaptainCartItem[]>([]);
  const [capBusy, setCapBusy]               = useState(false);

  const isNightShift = shiftKind === 3;
  // Business Rule: ONLY Takeaway Pizza (Port #5: تيك اواى بيتزا وحلويات) has direct access to Items (الأصناف) and has NO Captain Order.
  // All other dining ports receive orders strictly from Captain Order (M2_INV) and Cashier cannot edit items.
  const isTakeawayPizza = point?.code === 5;

  function handleShiftKindChange(newKind: 1 | 2 | 3) {
    setShiftKind(newKind);
    const { today: currentToday } = getShiftDates();
    if (newKind !== 3) {
      setShiftDate(currentToday);
    }
  }

  // Sync with session point/shift when AuthProvider updates.
  useEffect(() => {
    if (sessionPoint) setPoint(sessionPoint);
    if (sessionShift) setShift(sessionShift);
  }, [sessionPoint, sessionShift]);

  // Load assigned points + members + occupied hotel rooms on mount.
  const loadClientsMeta = useCallback(async () => {
    try {
      const [mRes, rRes] = await Promise.all([
        api<{ members: MemberCard[] }>('/clients/members'),
        api<{ rooms: OccupiedRoom[] }>('/clients/rooms'),
      ]);
      setMemberCards(mRes.members);
      setOccupiedRooms(rRes.rooms);
    } catch {
      // ignore if not yet migrated
    }
  }, []);

  useEffect(() => {
    api<{ points: Point[] }>('/points')
      .then((r) => {
        setPoints(r.points);
        if (!point && r.points.length > 0) {
          setPoint(sessionPoint ?? r.points[0]);
        }
      })
      .catch((e) => setError(String(e)));
    loadClientsMeta();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Load items when point selected.
  useEffect(() => {
    if (!point) return;
    api<{ items: Item[] }>(`/items?point_id=${point.id}`)
      .then((r) => setItems(r.items))
      .catch((e) => setError(String(e)));
  }, [point]);

  // Poll OPEN invoices every 6 seconds (matching legacy SERY invoice_t timer).
  const loadOpenOrders = useCallback(async () => {
    if (!point || !shift) return;
    try {
      const workDate = shift.shift_date.slice(0, 10);
      const r = await api<{ invoices: Invoice[] }>(
        `/invoices?point_id=${point.id}&inv_date=${workDate}&status=OPEN`,
      );
      setOpenOrders(r.invoices);

      if (invoice && invoice.status === 'OPEN') {
        const updated = r.invoices.find((i) => i.id === invoice.id);
        if (updated && (updated.total !== invoice.total || updated.lines_count !== lines.length)) {
          const detail = await api<{ invoice: Invoice; lines: InvoiceLine[] }>(`/invoices/${invoice.id}`);
          setInvoice(detail.invoice);
          setLines(detail.lines);
        }
      }
    } catch {
      // ignore transient background poll errors
    }
  }, [point, shift, invoice, lines.length]);

  useEffect(() => {
    if (!point || !shift) return;
    loadOpenOrders();
    const timer = window.setInterval(loadOpenOrders, 6000);
    return () => window.clearInterval(timer);
  }, [point, shift, loadOpenOrders]);

  async function selectOpenInvoice(invId: string) {
    setError(null);
    setNotice(null);
    try {
      const r = await api<{ invoice: Invoice; lines: InvoiceLine[] }>(`/invoices/${invId}`);
      setInvoice(r.invoice);
      setLines(r.lines);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function openShift() {
    if (!point) return;
    setError(null);
    setNotice(null);
    try {
      const effectiveDate = isNightShift ? shiftDate : getShiftDates().today;
      const r = await api<{ shift: Shift }>('/shifts', {
        method: 'POST',
        body: JSON.stringify({
          point_id: point.id,
          shift_date: effectiveDate,
          shift_kind: shiftKind,
        }),
      });
      setShift(r.shift);
      setSessionShift(r.shift);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function openShiftCloseDialog() {
    if (!shift) return;
    setError(null);
    setNotice(null);
    try {
      const summary = await api<ShiftCloseSummary>(`/shifts/${shift.id}/close-preview`);
      setShiftCloseSummary(summary);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function confirmCloseActiveShift() {
    if (!shift) return;
    setError(null);
    setClosingShiftBusy(true);
    try {
      const r = await api<{ shift: Shift; summary: ShiftCloseSummary }>(`/shifts/${shift.id}/close`, {
        method: 'POST',
      });
      setShiftCloseSummary(r.summary);
      setShift(null);
      setSessionShift(null);
      setInvoice(null);
      setLines([]);
      setOpenOrders([]);
      setNotice(ar.auth.shift_closed_ok);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    } finally {
      setClosingShiftBusy(false);
    }
  }

  // Only used by Takeaway Pizza (point.code === 5)
  async function newTakeawayInvoice() {
    if (!point || !shift || !isTakeawayPizza) return;
    setError(null);
    setNotice(null);
    try {
      const r = await api<{ invoice: Invoice }>('/invoices', {
        method: 'POST',
        body: JSON.stringify({
          point_id:    point.id,
          inv_date:    shift.shift_date.slice(0, 10),
          shift_id:    shift.id,
          client_type: 'CIVILIAN',
        }),
      });
      setInvoice(r.invoice);
      setLines([]);
      await loadOpenOrders();
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function updateClientOnInvoice(payload: {
    client_type: ClientType;
    barcode?: string | null;
    room_no?: number | null;
    h_no?: string | null;
  }) {
    if (!invoice) return;
    setError(null);
    setNotice(null);
    try {
      const r = await api<{ invoice: Invoice }>(`/invoices/${invoice.id}/client`, {
        method: 'PATCH',
        body: JSON.stringify(payload),
      });
      setInvoice(r.invoice);
      if (r.invoice.client_type === 'MEMBER') {
        setNotice(`تم استقبال صورة الكارنيه من جهاز الـ QR والتحقق من بيانات المشترك: ${r.invoice.mem_name} (خصم ${r.invoice.discount_percent}% + خدمة ${r.invoice.service_percent}%)`);
      } else if (r.invoice.client_type === 'GUEST') {
        setNotice(`تم ربط الفاتورة بغرفة #${r.invoice.room_no} (${r.invoice.guest_name}) لتحويلها إلى حساب الغرفة بالريسبشن`);
      } else {
        setNotice('تم تحديد نوع العميل: مدنى (مع خدمة 12%)');
      }
      await loadOpenOrders();
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  // Item modification functions — ONLY enabled for Takeaway Pizza (isTakeawayPizza === true)
  async function addItem(item: Item) {
    if (!isTakeawayPizza || !point || !shift) return;
    setError(null);
    try {
      let targetInvoice = invoice;
      let currentLines = lines;
      // If no open invoice is selected yet on Takeaway Pizza, auto-open one on first item click
      if (!targetInvoice || targetInvoice.status !== 'OPEN') {
        const opened = await api<{ invoice: Invoice }>('/invoices', {
          method: 'POST',
          body: JSON.stringify({
            point_id:    point.id,
            inv_date:    shift.shift_date.slice(0, 10),
            shift_id:    shift.id,
            client_type: 'CIVILIAN',
          }),
        });
        targetInvoice = opened.invoice;
        currentLines = [];
      }

      const existing = currentLines.find((l) => l.item_id === item.id);
      if (existing) {
        const r = await api<{ line: InvoiceLine; invoice: Invoice }>(
          `/invoices/${targetInvoice.id}/lines/${existing.id}`,
          { method: 'PATCH', body: JSON.stringify({ qty: Number(existing.qty) + 1 }) },
        );
        setLines(currentLines.map((l) => (l.id === existing.id ? { ...r.line, item_name: l.item_name, item_code: l.item_code } : l)));
        setInvoice(r.invoice);
      } else {
        const r = await api<{ line: InvoiceLine; invoice: Invoice }>(
          `/invoices/${targetInvoice.id}/lines`,
          { method: 'POST', body: JSON.stringify({ item_id: item.id, qty: 1 }) },
        );
        setLines([...currentLines, { ...r.line, item_name: item.name, item_code: item.code }]);
        setInvoice(r.invoice);
      }
      await loadOpenOrders();
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function changeQty(line: InvoiceLine, newQty: number) {
    if (!isTakeawayPizza || !invoice || !(newQty > 0)) return;
    setError(null);
    try {
      const r = await api<{ line: InvoiceLine; invoice: Invoice }>(
        `/invoices/${invoice.id}/lines/${line.id}`,
        { method: 'PATCH', body: JSON.stringify({ qty: newQty }) },
      );
      setLines(lines.map((l) => (l.id === line.id ? { ...r.line, item_name: l.item_name, item_code: l.item_code } : l)));
      setInvoice(r.invoice);
      await loadOpenOrders();
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function removeLine(line: InvoiceLine) {
    if (!isTakeawayPizza || !invoice) return;
    setError(null);
    try {
      const r = await api<{ invoice: Invoice }>(
        `/invoices/${invoice.id}/lines/${line.id}`,
        { method: 'DELETE' },
      );
      setLines(lines.filter((l) => l.id !== line.id));
      setInvoice(r.invoice);
      await loadOpenOrders();
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function closeInvoice() {
    if (!invoice) return;
    setError(null);
    setNotice(null);
    try {
      const r = await api<{ invoice: Invoice }>(`/invoices/${invoice.id}/close`,
        { method: 'POST' });
      setInvoice(r.invoice);
      if (r.invoice.client_type === 'GUEST') {
        setNotice(
          `تم إغلاق الفاتورة رقم #${r.invoice.ser_no} وترحيل مبلغ ${r.invoice.total} ج.م إلى حساب غرفة #${r.invoice.room_no} (${r.invoice.guest_name}) في الريسبشن بنجاح`,
        );
        await loadClientsMeta();
      } else {
        setNotice(`تم إغلاق وسداد الفاتورة رقم #${r.invoice.ser_no} بمبلغ ${r.invoice.total} ج.م بنجاح`);
      }
      await loadOpenOrders();
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function cancelInvoice() {
    if (!invoice) return;
    if (!confirm(ar.pos.confirm_cancel)) return;
    setError(null);
    try {
      const r = await api<{ invoice: Invoice }>(`/invoices/${invoice.id}/cancel`,
        { method: 'POST', body: JSON.stringify({}) });
      setInvoice(r.invoice);
      setLines([]);
      await loadOpenOrders();
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  function printInvoice(copies = 1) {
    if (!invoice) return;
    for (let i = 0; i < copies; i++) {
      window.open(`/api/v1/invoices/${invoice.id}/pdf?copy=${i + 1}`, '_blank', 'noopener');
    }
  }

  // Captain Order Tablet helper functions (for non-Takeaway-Pizza ports)
  function addCaptainCartItem(it: Item) {
    setCapCart((prev) => {
      const existing = prev.find((c) => c.item.id === it.id);
      if (existing) {
        return prev.map((c) => (c.item.id === it.id ? { ...c, qty: c.qty + 1 } : c));
      }
      return [...prev, { item: it, qty: 1, remarks: '' }];
    });
  }

  function openCaptainPadForTable(tblNo?: number | null) {
    if (tblNo) setCapTableNo(String(tblNo));
    setShowCaptainPad(true);
  }

  async function submitCaptainOrder() {
    if (!point || !shift) return;
    if (!capTableNo || Number(capTableNo) <= 0) {
      setError('أدخل رقم الترابيزة لطلب الكابتن أوردر');
      return;
    }
    if (capCart.length === 0) {
      setError('اختر صنفاً واحداً على الأقل لإرسال طلب الكابتن أوردر');
      return;
    }
    setError(null);
    setNotice(null);
    setCapBusy(true);
    try {
      const r = await api<{
        invoice: Invoice;
        lines: InvoiceLine[];
      }>('/captain-orders', {
        method: 'POST',
        body: JSON.stringify({
          point_id:     point.id,
          point_code:   point.code,
          inv_date:     shift.shift_date.slice(0, 10),
          shift_type:   shift.shift_kind,
          table_number: Number(capTableNo),
          noofperson:   capPersons ? Number(capPersons) : null,
          remarks:      capRemarks || null,
          items: capCart.map((c) => ({
            good_code: c.item.code,
            quantity:  c.qty,
            remarks:   c.remarks || null,
          })),
        }),
      });
      setCapCart([]);
      setCapRemarks('');
      setShowCaptainPad(false);
      setInvoice(r.invoice);
      setLines(r.lines);
      setNotice(`تم إرسال الأوردر من تابلت الكابتن (ترابيزة #${capTableNo}) إلى جدول M2_INV وتسميعه في فاتورة الكاشير #${r.invoice.serial_no}`);
      await loadOpenOrders();
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    } finally {
      setCapBusy(false);
    }
  }

  const itemTypeNames = Array.from(new Set(items.map((it) => it.type_name)));
  const visibleItems = activeType === 'ALL'
    ? items
    : items.filter((it) => it.type_name === activeType);

  return (
    <div>
      {error && <div className="msg error">{error}</div>}
      {notice && <div className="msg ok">{notice}</div>}

      {shiftCloseSummary && (
        <ShiftCloseModal
          summary={shiftCloseSummary}
          closing={closingShiftBusy}
          onConfirmClose={confirmCloseActiveShift}
          onBack={() => setShiftCloseSummary(null)}
        />
      )}

      {/* Point + shift picker (only shown if no shift is active) */}
      {!shift && (
        <div className="card" style={{ marginBottom: 16 }}>
          <h2 style={{ marginTop: 0 }}>{ar.pos.open_shift}</h2>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr auto', gap: 12, alignItems: 'end' }}>
            <label>
              <span className="muted" style={{ fontSize: 12 }}>{ar.pos.point}</span>
              <select
                value={point?.id ?? ''}
                onChange={(e) => setPoint(points.find((p) => p.id === e.target.value) ?? null)}
              >
                <option value="">—</option>
                {points.map((p) => <option key={p.id} value={p.id}>{p.name} (#{p.code})</option>)}
              </select>
            </label>
            <label>
              <span className="muted" style={{ fontSize: 12 }}>{ar.auth.shift}</span>
              <select
                value={shiftKind}
                onChange={(e) => handleShiftKindChange(Number(e.target.value) as 1 | 2 | 3)}
              >
                <option value={1}>{ar.auth.shifts[1]}</option>
                <option value={2}>{ar.auth.shifts[2]}</option>
                <option value={3}>{ar.auth.shifts[3]}</option>
              </select>
            </label>
            <label>
              <span className="muted" style={{ fontSize: 12 }}>{ar.auth.date}</span>
              {isNightShift ? (
                <select value={shiftDate} onChange={(e) => setShiftDate(e.target.value)}>
                  <option value={today}>{today} ({ar.auth.today_label})</option>
                  <option value={yesterday}>{yesterday} ({ar.auth.yesterday_night_label})</option>
                </select>
              ) : (
                <input value={today} readOnly disabled style={{ background: '#f5f2ea', color: 'var(--muted)' }} />
              )}
            </label>
            <button className="btn primary" disabled={!point} onClick={openShift}>
              {ar.pos.open_shift}
            </button>
          </div>
        </div>
      )}

      {shift && (
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 500px', gap: 16, alignItems: 'start' }}>
          {/* LEFT PANE:
              - For Normal Dining Ports (isTakeawayPizza === false): ONLY Captain Order Incoming Queue (NO Items Catalog in Cashier!)
              - For Takeaway Pizza (isTakeawayPizza === true): Direct Items Catalog & Takeaway Order Creation (NO Captain Order!)
          */}
          <section className="card">
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14, flexWrap: 'wrap', gap: 8 }}>
              <div>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                  <h2 style={{ margin: 0 }}>
                    {point?.name} {point ? `(#${point.code})` : ''}
                  </h2>
                  <span style={{
                    fontSize: 11,
                    fontWeight: 700,
                    padding: '3px 10px',
                    borderRadius: 999,
                    background: isTakeawayPizza ? '#E6F4EE' : '#EBF3F5',
                    color: isTakeawayPizza ? 'var(--green)' : 'var(--navy)',
                  }}>
                    {isTakeawayPizza
                      ? '🍕 منفذ تيك أواي بيتزا (طلب مباشر للأصناف بدون كابتن أوردر)'
                      : '📱 استقبال طلبات الكابتن أوردر فقط (الأصناف للقراءة فقط بالكاشير)'}
                  </span>
                </div>
                <span className="muted" style={{ fontSize: 13 }}>
                  {ar.auth.shift}: {ar.auth.shifts[shift.shift_kind] ?? shift.shift_kind} · {shift.shift_date.slice(0, 10)} · الخدمة المقررة: {Number(point?.service_percent ?? 12).toFixed(0)}%
                </span>
              </div>

              <div style={{ display: 'flex', gap: 8 }}>
                {isTakeawayPizza ? (
                  <button className="btn primary" onClick={newTakeawayInvoice}>
                    + فاتورة تيك أواي جديدة
                  </button>
                ) : (
                  <button
                    type="button"
                    className="btn gold"
                    onClick={() => setShowCaptainPad((v) => !v)}
                  >
                    📱 {showCaptainPad ? 'إخفاء محاكي تابلت الكابتن' : 'محاكاة إرسال / تزويد أوردر من تابلت الكابتن'}
                  </button>
                )}
                <button className="btn" onClick={loadOpenOrders}>
                  تحديث ↻
                </button>
                <button className="btn ghost" onClick={openShiftCloseDialog} style={{ color: 'var(--red)' }}>
                  {ar.auth.close_shift}
                </button>
              </div>
            </div>

            {/* MODE A: Normal Dining Cashier (NO Items Catalog on Cashier — Receives orders from Captain Order M2_INV) */}
            {!isTakeawayPizza && (
              <>
                {/* Captain Order Tablet Simulator (for testing incoming orders & adding to open tables) */}
                {showCaptainPad && (
                  <div style={{
                    padding: 16,
                    marginBottom: 16,
                    borderRadius: 10,
                    background: '#F4F8FA',
                    border: '2px dashed var(--navy)',
                  }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 8 }}>
                      <strong style={{ color: 'var(--navy)', fontSize: 14 }}>
                        📱 محاكي جهاز تابلت الكابتن أوردر (يكتب في M2_INV & M2_INV_DETAILS ويظهر تلقائياً عند الكاشير)
                      </strong>
                      <span style={{ fontSize: 11, color: 'var(--muted)' }}>
                        * إذا اخترت رقم ترابيزة مفتوحة حالياً سيتم تزويد الأصناف عليها تلقائياً
                      </span>
                    </div>

                    <div style={{ display: 'grid', gridTemplateColumns: '140px 140px 1fr', gap: 10, marginBottom: 12 }}>
                      <label>
                        <span className="muted" style={{ fontSize: 12 }}>رقم الترابيزة (TABLE_NUMBER)</span>
                        <input
                          type="number"
                          min={1}
                          value={capTableNo}
                          onChange={(e) => setCapTableNo(e.target.value)}
                        />
                      </label>
                      <label>
                        <span className="muted" style={{ fontSize: 12 }}>عدد الأفراد (NOOFPERSON)</span>
                        <input
                          type="number"
                          min={1}
                          value={capPersons}
                          onChange={(e) => setCapPersons(e.target.value)}
                        />
                      </label>
                      <label>
                        <span className="muted" style={{ fontSize: 12 }}>ملاحظات الأوردر (REMARKS)</span>
                        <input
                          value={capRemarks}
                          onChange={(e) => setCapRemarks(e.target.value)}
                          placeholder="مثال: ترابيزة VIP / بدون تأخير"
                        />
                      </label>
                    </div>

                    <div style={{ fontSize: 12, fontWeight: 600, marginBottom: 6, color: 'var(--navy)' }}>
                      أصناف تابلت الكابتن:
                    </div>
                    <div style={{ display: 'flex', gap: 6, flexWrap: 'wrap', marginBottom: 10 }}>
                      {items.map((it) => (
                        <button
                          key={it.id}
                          type="button"
                          className="btn"
                          onClick={() => addCaptainCartItem(it)}
                          style={{ padding: '6px 10px', fontSize: 12, background: 'white' }}
                        >
                          + {it.name} ({Number(it.price).toFixed(2)})
                        </button>
                      ))}
                    </div>

                    {capCart.length > 0 && (
                      <div style={{ background: 'white', padding: 10, borderRadius: 8, border: '1px solid var(--line)', marginBottom: 10 }}>
                        {capCart.map((c, idx) => (
                          <div key={c.item.id} style={{ display: 'grid', gridTemplateColumns: '1fr 80px 1fr auto', gap: 8, alignItems: 'center', padding: '4px 0' }}>
                            <strong>{c.item.name} (#{c.item.code})</strong>
                            <input
                              type="number"
                              min={1}
                              value={c.qty}
                              onChange={(e) => {
                                const q = Number(e.target.value);
                                if (q > 0) {
                                  setCapCart(capCart.map((x, i) => (i === idx ? { ...x, qty: q } : x)));
                                }
                              }}
                              style={{ padding: 4, textAlign: 'center' }}
                            />
                            <input
                              placeholder="ملاحظة للمطبخ..."
                              value={c.remarks}
                              onChange={(e) => setCapCart(capCart.map((x, i) => (i === idx ? { ...x, remarks: e.target.value } : x)))}
                              style={{ padding: 4, fontSize: 12 }}
                            />
                            <button
                              type="button"
                              className="btn ghost"
                              style={{ color: 'var(--red)', padding: '2px 8px' }}
                              onClick={() => setCapCart(capCart.filter((_, i) => i !== idx))}
                            >
                              ×
                            </button>
                          </div>
                        ))}
                      </div>
                    )}

                    <div style={{ display: 'flex', justifyContent: 'flex-end', gap: 8 }}>
                      <button
                        type="button"
                        className="btn primary"
                        disabled={capBusy || capCart.length === 0}
                        onClick={submitCaptainOrder}
                      >
                        {capBusy ? ar.common.loading : `إرسال من تابلت الكابتن إلى ترابيزة #${capTableNo}`}
                      </button>
                    </div>
                  </div>
                )}

                {/* Incoming Open Orders Board for Cashier */}
                <div style={{
                  padding: 14,
                  borderRadius: 10,
                  background: '#FFFCF5',
                  border: '1px solid var(--gold)',
                }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                      <strong style={{ color: 'var(--navy)', fontSize: 16 }}>
                        📋 الأوردرات والترابيزات المفتوحة الواردة للكاشير
                      </strong>
                      <span style={{
                        fontSize: 12,
                        fontWeight: 700,
                        padding: '2px 10px',
                        borderRadius: 999,
                        background: 'var(--navy)',
                        color: 'white',
                      }}>
                        {openOrders.length} أوردر مفتوح
                      </span>
                    </div>
                    <span className="muted" style={{ fontSize: 12 }}>
                      طول ما الأوردر مفتوح يمكن للكابتن أوردر التزويد عليه فقط
                    </span>
                  </div>

                  {openOrders.length === 0 ? (
                    <div style={{
                      padding: 32,
                      textAlign: 'center',
                      background: 'white',
                      borderRadius: 8,
                      border: '1px dashed var(--line)',
                    }}>
                      <div style={{ fontSize: 32, marginBottom: 8 }}>🍽️</div>
                      <strong style={{ color: 'var(--navy)', display: 'block', marginBottom: 4 }}>
                        لا توجد أوردرات مفتوحة حالياً في انتظار المحاسبة
                      </strong>
                      <p className="muted" style={{ fontSize: 13, margin: '0 0 12px' }}>
                        الكاشير يستقبل الأوردرات تلقائياً فور إرسالها من تابلت الكابتن أوردر (M2_INV).
                      </p>
                      <button
                        type="button"
                        className="btn gold"
                        onClick={() => setShowCaptainPad(true)}
                      >
                        📱 إرسال أوردر تجريبي من تابلت الكابتن
                      </button>
                    </div>
                  ) : (
                    <div style={{
                      display: 'grid',
                      gridTemplateColumns: 'repeat(auto-fill, minmax(220px, 1fr))',
                      gap: 12,
                    }}>
                      {openOrders.map((ord) => {
                        const isActive = invoice?.id === ord.id;
                        const cType = ord.client_type || 'CIVILIAN';
                        return (
                          <div
                            key={ord.id}
                            onClick={() => selectOpenInvoice(ord.id)}
                            style={{
                              cursor: 'pointer',
                              borderRadius: 10,
                              padding: 14,
                              border: isActive ? '2px solid var(--navy)' : '1px solid var(--gold)',
                              background: isActive ? '#EBF3F5' : 'white',
                              transition: 'all 0.15s ease',
                            }}
                          >
                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                              <strong style={{ color: 'var(--navy)', fontSize: 16 }}>
                                {ord.table_no ? `ترابيزة #${ord.table_no}` : `أوردر #${ord.serial_no}`}
                              </strong>
                              <span style={{
                                fontSize: 11,
                                fontWeight: 700,
                                padding: '2px 8px',
                                borderRadius: 999,
                                background: cType === 'MEMBER' ? '#E6F4EE' : cType === 'GUEST' ? '#FFF4D9' : '#EEF2F6',
                                color: cType === 'MEMBER' ? 'var(--green)' : cType === 'GUEST' ? 'var(--amber)' : 'var(--navy)',
                              }}>
                                {ar.client[cType]}
                              </span>
                            </div>

                            <div className="muted" style={{ fontSize: 12, marginTop: 6, display: 'flex', justifyContent: 'space-between' }}>
                              <span>فاتورة #{ord.serial_no} · {ord.lines_count ?? 0} أصناف</span>
                              {ord.person_count ? <span>👥 {ord.person_count} أفراد</span> : null}
                            </div>

                            <div style={{
                              marginTop: 10,
                              paddingTop: 8,
                              borderTop: '1px dashed var(--line)',
                              display: 'flex',
                              justifyContent: 'space-between',
                              alignItems: 'center',
                            }}>
                              <span style={{ fontWeight: 800, color: 'var(--green)', fontSize: 15 }}>
                                {Number(ord.total).toFixed(2)} ج.م
                              </span>
                              <button
                                type="button"
                                className="btn"
                                onClick={(e) => {
                                  e.stopPropagation();
                                  openCaptainPadForTable(ord.table_no);
                                }}
                                style={{ padding: '3px 8px', fontSize: 11 }}
                                title="تزويد أصناف على الترابيزة المفتوحة من تابلت الكابتن"
                              >
                                + تزويد من الكابتن
                              </button>
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  )}
                </div>
              </>
            )}

            {/* MODE B: Takeaway Pizza User (point.code === 5) — Direct Access to Items Catalog, NO Captain Order */}
            {isTakeawayPizza && (
              <>
                {openOrders.length > 0 && (
                  <div style={{ marginBottom: 14, padding: 10, background: '#FFFCF5', borderRadius: 8, border: '1px solid var(--gold)' }}>
                    <div style={{ fontSize: 12, fontWeight: 700, color: 'var(--navy)', marginBottom: 6 }}>
                      طلبات التيك أواي المفتوحة حالياً ({openOrders.length}):
                    </div>
                    <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap' }}>
                      {openOrders.map((ord) => (
                        <button
                          key={ord.id}
                          type="button"
                          onClick={() => selectOpenInvoice(ord.id)}
                          className={`btn ${invoice?.id === ord.id ? 'primary' : ''}`}
                          style={{ padding: '6px 12px', fontSize: 12 }}
                        >
                          طلب #{ord.serial_no} ({ord.lines_count ?? 0} أصناف · {Number(ord.total).toFixed(2)} ج.م)
                        </button>
                      ))}
                    </div>
                  </div>
                )}

                <div style={{ marginBottom: 10, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <strong style={{ color: 'var(--navy)', fontSize: 15 }}>
                    🍕 قائمة الأصناف (متاحة لكاشير تيك أواي بيتزا وحلويات فقط لإنشاء الطلب مباشرة):
                  </strong>
                </div>

                {/* Category Tabs */}
                <div style={{ display: 'flex', gap: 6, marginBottom: 12, flexWrap: 'wrap' }}>
                  <button
                    type="button"
                    className={`btn ${activeType === 'ALL' ? 'primary' : ''}`}
                    onClick={() => setActiveType('ALL')}
                    style={{ padding: '6px 14px', fontSize: 13 }}
                  >
                    الكل ({items.length})
                  </button>
                  {itemTypeNames.map((tName) => (
                    <button
                      key={tName}
                      type="button"
                      className={`btn ${activeType === tName ? 'primary' : ''}`}
                      onClick={() => setActiveType(tName)}
                      style={{ padding: '6px 14px', fontSize: 13 }}
                    >
                      {tName}
                    </button>
                  ))}
                </div>

                <div style={{
                  display: 'grid',
                  gridTemplateColumns: 'repeat(auto-fill, minmax(150px, 1fr))',
                  gap: 10,
                }}>
                  {visibleItems.map((it) => (
                    <button
                      key={it.id}
                      onClick={() => addItem(it)}
                      disabled={invoice != null && invoice.status !== 'OPEN'}
                      className="btn"
                      style={{
                        padding: '14px 10px',
                        textAlign: 'center',
                        flexDirection: 'column',
                        background: 'white',
                        borderColor: 'var(--line)',
                        borderRadius: 10,
                      }}
                    >
                      <strong style={{ fontSize: 14, color: 'var(--navy)' }}>{it.name}</strong>
                      <span style={{
                        fontSize: 12,
                        marginTop: 6,
                        fontWeight: 700,
                        color: 'var(--gold)',
                        background: '#FFFDF7',
                        padding: '2px 8px',
                        borderRadius: 999,
                        border: '1px solid var(--line)',
                      }}>
                        {Number(it.price).toFixed(2)} ج.م
                      </span>
                    </button>
                  ))}
                </div>
              </>
            )}
          </section>

          {/* RIGHT PANE: Modern Restaurant Invoice Panel */}
          <aside className="card" style={{ padding: 0, overflow: 'hidden', border: '1px solid var(--navy)' }}>
            {!invoice ? (
              <div style={{ padding: 28, textAlign: 'center' }}>
                <div style={{ fontSize: 38, marginBottom: 8 }}>🧾</div>
                <strong style={{ display: 'block', color: 'var(--navy)', marginBottom: 6, fontSize: 15 }}>
                  لا توجد فاتورة محددة حالياً
                </strong>
                <p className="muted" style={{ fontSize: 13, margin: 0 }}>
                  {isTakeawayPizza
                    ? 'اضغط على أي صنف من القائمة أو "فاتورة تيك أواي جديدة" لبدء الطلب.'
                    : 'اختر أحد الأوردرات المفتوحة الواردة من الكابتن أوردر لعرض الفاتورة وتحديد نوع العميل (مدنى / مشترك / نزيل) وإتمام المحاسبة.'}
                </p>
              </div>
            ) : (
              <InvoiceSummary
                invoice={invoice}
                lines={lines}
                canEditItems={isTakeawayPizza}
                memberCards={memberCards}
                occupiedRooms={occupiedRooms}
                onUpdateClient={updateClientOnInvoice}
                onQty={changeQty}
                onRemove={removeLine}
                onClose={closeInvoice}
                onCancel={cancelInvoice}
                onPrint={printInvoice}
              />
            )}
          </aside>
        </div>
      )}
    </div>
  );
}

function InvoiceSummary({
  invoice,
  lines,
  canEditItems,
  memberCards,
  occupiedRooms,
  onUpdateClient,
  onQty,
  onRemove,
  onClose,
  onCancel,
  onPrint,
}: {
  invoice: Invoice;
  lines: InvoiceLine[];
  canEditItems: boolean;
  memberCards: MemberCard[];
  occupiedRooms: OccupiedRoom[];
  onUpdateClient: (payload: {
    client_type: ClientType;
    barcode?: string | null;
    room_no?: number | null;
    h_no?: string | null;
  }) => void;
  onQty:      (l: InvoiceLine, qty: number) => void;
  onRemove:   (l: InvoiceLine) => void;
  onClose:    () => void;
  onCancel:   () => void;
  onPrint:    (copies?: number) => void;
}) {
  const clientType: ClientType = invoice.client_type || 'CIVILIAN';
  const [activeTab, setActiveTab]       = useState<ClientType>(clientType);
  const [selectedRoom, setSelectedRoom] = useState<string>(invoice.room_no ? String(invoice.room_no) : '');
  const [scanningCard, setScanningCard] = useState<boolean>(false);

  useEffect(() => {
    setActiveTab(invoice.client_type || 'CIVILIAN');
    setSelectedRoom(invoice.room_no ? String(invoice.room_no) : '');
  }, [invoice.id, invoice.client_type, invoice.room_no]);

  // Listen automatically to hardware QR Scanner Device stream (USB/Serial Imager sends characters + Enter)
  useEffect(() => {
    if (activeTab !== 'MEMBER' || invoice.status !== 'OPEN') return;
    let buffer = '';
    let lastTime = 0;

    function onKeyDown(e: KeyboardEvent) {
      const target = e.target as HTMLElement | null;
      if (target && (target.tagName === 'INPUT' || target.tagName === 'SELECT' || target.tagName === 'TEXTAREA')) {
        return;
      }
      const now = Date.now();
      if (now - lastTime > 500) {
        buffer = '';
      }
      lastTime = now;

      if (e.key === 'Enter' && buffer.trim().length >= 3) {
        e.preventDefault();
        const code = buffer.trim();
        buffer = '';
        onUpdateClient({ client_type: 'MEMBER', barcode: code });
      } else if (e.key.length === 1) {
        buffer += e.key;
      }
    }

    window.addEventListener('keydown', onKeyDown);
    return () => window.removeEventListener('keydown', onKeyDown);
  }, [activeTab, invoice.status, onUpdateClient]);

  function handleTabClick(tab: ClientType) {
    setActiveTab(tab);
    if (invoice.status !== 'OPEN') return;
    if (tab === 'CIVILIAN' && invoice.client_type !== 'CIVILIAN') {
      onUpdateClient({ client_type: 'CIVILIAN' });
    }
  }

  function handleDeviceCardCapture(cardCode: string) {
    setScanningCard(true);
    window.setTimeout(() => {
      setScanningCard(false);
      onUpdateClient({ client_type: 'MEMBER', barcode: cardCode });
    }, 250);
  }

  function handleSelectRoom(roomNoStr: string) {
    setSelectedRoom(roomNoStr);
    if (!roomNoStr) return;
    onUpdateClient({ client_type: 'GUEST', room_no: Number(roomNoStr) });
  }

  const isGuest = clientType === 'GUEST';
  const isMember = clientType === 'MEMBER';

  return (
    <div>
      {/* Invoice Header Banner */}
      <div style={{
        background: 'linear-gradient(135deg, var(--navy) 0%, var(--navy-2) 100%)',
        color: 'white',
        padding: '14px 18px',
        borderBottom: '3px solid var(--gold)',
      }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <div>
            <div style={{ fontSize: 11, color: '#D9C38F', fontWeight: 600 }}>
              دار القوات البحرية — المحروسة
            </div>
            <h3 style={{ margin: '2px 0 0', fontSize: 18, display: 'flex', alignItems: 'center', gap: 8 }}>
              <span>فاتورة #{invoice.ser_no ?? invoice.serial_no}</span>
              {invoice.table_no && (
                <span style={{
                  fontSize: 12,
                  background: 'rgba(255,255,255,0.16)',
                  padding: '2px 8px',
                  borderRadius: 999,
                }}>
                  ترابيزة #{invoice.table_no}
                </span>
              )}
            </h3>
          </div>
          <span style={{
            padding: '4px 12px',
            borderRadius: 999,
            fontSize: 12,
            fontWeight: 700,
            background: invoice.status === 'PAID' ? '#1E6B47'
                      : invoice.status === 'CANCELLED' ? '#A61C1C' : 'var(--gold)',
            color: 'white',
          }}>
            {ar.invoice.status[invoice.status]}
          </span>
        </div>

        <div style={{
          display: 'flex',
          gap: 12,
          marginTop: 8,
          fontSize: 12,
          color: 'rgba(255,255,255,0.82)',
          flexWrap: 'wrap',
        }}>
          <span>📅 {String(invoice.inv_date).slice(0, 10)}</span>
          {invoice.person_count ? <span>👥 {invoice.person_count} أفراد</span> : null}
          <span>⚡ الخدمة: {Number(invoice.service_percent).toFixed(0)}%</span>
        </div>
      </div>

      <div style={{ padding: 16 }}>
        {/* 3 Client Types Selector (مدنى / مشترك / نزيل) */}
        <div style={{ marginBottom: 14 }}>
          <div style={{ fontSize: 12, fontWeight: 700, color: 'var(--navy)', marginBottom: 6 }}>
            نوع العميل وطريقة المحاسبة:
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 6 }}>
            {CLIENT_TYPE_OPTIONS.map((opt) => {
              const selected = activeTab === opt.key;
              return (
                <button
                  key={opt.key}
                  type="button"
                  disabled={invoice.status !== 'OPEN'}
                  onClick={() => handleTabClick(opt.key)}
                  className="btn"
                  style={{
                    flexDirection: 'column',
                    padding: '8px 6px',
                    borderRadius: 8,
                    borderColor: selected ? 'var(--navy)' : 'var(--line)',
                    background: selected ? 'var(--navy)' : '#F9F6EE',
                    color: selected ? 'white' : 'var(--ink)',
                  }}
                >
                  <span style={{ fontSize: 13, fontWeight: 700 }}>{opt.icon} {opt.label}</span>
                  <span style={{ fontSize: 10, opacity: selected ? 0.9 : 0.7 }}>{opt.sub}</span>
                </button>
              );
            })}
          </div>

          {/* Member QR Scanner Device Panel (مشترك — NO Manual Membership Number Input!) */}
          {activeTab === 'MEMBER' && (
            <div style={{
              marginTop: 10,
              padding: 12,
              borderRadius: 10,
              background: '#F4FAF7',
              border: '1px solid #B7E1CD',
            }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 8 }}>
                <span style={{ fontSize: 12, fontWeight: 700, color: 'var(--navy)' }}>
                  📡 جهاز مسح ونقل صورة الكارنيه (QR Card Scanner Device)
                </span>
                <span style={{
                  fontSize: 10,
                  fontWeight: 700,
                  padding: '2px 8px',
                  borderRadius: 999,
                  background: isMember ? '#1E6B47' : '#D9822B',
                  color: 'white',
                }}>
                  {scanningCard
                    ? 'جارٍ نقل صورة الكارنيه...'
                    : isMember
                      ? 'تم التحقق من الكارنيه ✓'
                      : 'في انتظار تمرير الكارنيه على الجهاز'}
                </span>
              </div>

              {/* Scanned Card Visual Image Preview (transferred from scanner device to PC) */}
              {isMember && invoice.mem_name ? (
                <div style={{
                  background: 'linear-gradient(135deg, #0D2240 0%, #1B3A63 100%)',
                  color: 'white',
                  borderRadius: 10,
                  padding: 12,
                  border: '2px solid var(--gold)',
                  boxShadow: '0 4px 12px rgba(13,34,64,0.18)',
                  marginBottom: invoice.status === 'OPEN' ? 10 : 0,
                }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderBottom: '1px solid rgba(255,255,255,0.15)', paddingBottom: 6, marginBottom: 8 }}>
                    <span style={{ fontSize: 11, color: '#D9C38F', fontWeight: 700 }}>
                      ⚓ صورة كارنيه العضوية الممسوحة ضوئياً — دار القوات البحرية
                    </span>
                    <span style={{
                      fontSize: 10,
                      background: '#1E6B47',
                      color: 'white',
                      padding: '2px 8px',
                      borderRadius: 999,
                      fontWeight: 700,
                    }}>
                      ساري وموثق ✓
                    </span>
                  </div>

                  <div style={{ display: 'grid', gridTemplateColumns: '68px 1fr auto', gap: 10, alignItems: 'center' }}>
                    {/* Simulated Scanned Member Photo */}
                    <div style={{
                      width: 64,
                      height: 64,
                      borderRadius: 8,
                      background: 'rgba(255,255,255,0.12)',
                      border: '1px solid var(--gold)',
                      display: 'flex',
                      flexDirection: 'column',
                      alignItems: 'center',
                      justifyContent: 'center',
                      fontSize: 26,
                    }}>
                      👨‍✈️
                      <span style={{ fontSize: 8, color: '#D9C38F' }}>صورة العضو</span>
                    </div>

                    {/* Verified Member Info */}
                    <div>
                      <div style={{ fontSize: 14, fontWeight: 800, color: '#FFFFFF' }}>
                        {invoice.mem_name}
                      </div>
                      {invoice.mem_rank && (
                        <div style={{ fontSize: 11, color: '#D9C38F', marginTop: 2 }}>
                          الرتبة / الفئة: {invoice.mem_rank}
                        </div>
                      )}
                      <div style={{
                        marginTop: 6,
                        display: 'inline-block',
                        fontSize: 11,
                        fontWeight: 700,
                        background: 'rgba(30,107,71,0.9)',
                        padding: '2px 8px',
                        borderRadius: 6,
                      }}>
                        خصم المشترك المقرر: {Number(invoice.discount_percent)}%
                      </div>
                    </div>

                    {/* Scanned QR Matrix Graphic */}
                    <div style={{
                      background: 'white',
                      padding: 6,
                      borderRadius: 6,
                      textAlign: 'center',
                      color: 'var(--navy)',
                    }}>
                      <svg width="46" height="46" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M3 3h7v7H3V3zm2 2v3h3V5H5zm9-2h7v7h-7V3zm2 2v3h3V5h-3zM3 14h7v7H3v-7zm2 2v3h3v-3H5zm11-2h2v2h-2v-2zm-2 2h2v2h-2v-2zm4 0h3v2h-3v-2zm-2 2h2v3h-2v-3zm4 2h2v2h-2v-2z" />
                      </svg>
                      <div style={{ fontSize: 8, fontWeight: 700 }}>QR VERIFIED</div>
                    </div>
                  </div>
                </div>
              ) : (
                <div style={{
                  background: 'white',
                  border: '2px dashed #8AC9AA',
                  borderRadius: 8,
                  padding: 14,
                  textAlign: 'center',
                  marginBottom: invoice.status === 'OPEN' ? 10 : 0,
                }}>
                  <div style={{ fontSize: 28, marginBottom: 4 }}>📷</div>
                  <strong style={{ fontSize: 12, color: 'var(--navy)', display: 'block' }}>
                    قم بتمرير كارنيه المشترك أمام جهاز الـ QR Scanner
                  </strong>
                  <span className="muted" style={{ fontSize: 11 }}>
                    يقوم الجهاز تلقائياً بنقل صورة الكارنيه الممسوحة للكمبيوتر والتحقق من صلاحية العضوية بدون إدخال يدوي
                  </span>
                </div>
              )}

              {/* Hardware Scanner Simulation Feed (for testing without physical scanner attached) */}
              {invoice.status === 'OPEN' && (
                <div>
                  <div className="muted" style={{ fontSize: 11, marginBottom: 6, fontWeight: 600 }}>
                    محاكاة تمرير كارنيه على جهاز الـ Scanner (للتجربة):
                  </div>
                  <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 6 }}>
                    {memberCards.map((m) => {
                      const activeCard = invoice.mem_bar === m.m_bar;
                      return (
                        <button
                          key={m.m_bar}
                          type="button"
                          onClick={() => handleDeviceCardCapture(m.m_bar)}
                          className="btn"
                          style={{
                            fontSize: 11,
                            padding: '6px 8px',
                            justifyContent: 'flex-start',
                            textAlign: 'right',
                            background: activeCard ? '#E6F4EE' : 'white',
                            borderColor: activeCard ? 'var(--green)' : '#B7E1CD',
                          }}
                        >
                          <span>🪪 {m.mem_name}</span>
                        </button>
                      );
                    })}
                  </div>
                </div>
              )}
            </div>
          )}

          {/* Hotel Guest / Room Transfer Panel (نزيل) */}
          {activeTab === 'GUEST' && (
            <div style={{
              marginTop: 10,
              padding: 12,
              borderRadius: 8,
              background: '#FFFDF5',
              border: '1px solid var(--gold)',
            }}>
              {invoice.status === 'OPEN' && (
                <div style={{ marginBottom: isGuest ? 8 : 0 }}>
                  <div style={{ fontSize: 12, fontWeight: 700, color: 'var(--navy)', marginBottom: 6 }}>
                    🏨 اختر غرفة النزيل لتحويل الفاتورة إلى الريسبشن:
                  </div>
                  <select
                    value={selectedRoom}
                    onChange={(e) => handleSelectRoom(e.target.value)}
                    style={{ width: '100%', padding: '7px 10px', fontSize: 12 }}
                  >
                    <option value="">— اختر رقم الغرفة المشغولة —</option>
                    {occupiedRooms.map((rm) => (
                      <option key={rm.h_no} value={rm.room_no}>
                        غرفة #{rm.room_no} — {rm.guest_name} (حجز {rm.h_no} · رصيد مطاعم حالي: {rm.reception_rest_total} ج.م)
                      </option>
                    ))}
                  </select>
                </div>
              )}

              {isGuest && invoice.room_no && (
                <div style={{
                  background: 'white',
                  padding: '8px 10px',
                  borderRadius: 6,
                  border: '1px solid var(--gold)',
                  fontSize: 12,
                }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                    <strong style={{ color: 'var(--navy)' }}>
                      🏨 غرفة #{invoice.room_no} — {invoice.guest_name}
                    </strong>
                    <span style={{
                      fontSize: 11,
                      fontWeight: 700,
                      color: 'var(--amber)',
                      background: '#FFF4D9',
                      padding: '2px 8px',
                      borderRadius: 999,
                    }}>
                      حجز {invoice.h_no}
                    </span>
                  </div>
                  <div style={{ fontSize: 11, color: 'var(--green)', marginTop: 4, fontWeight: 600 }}>
                    ✓ {invoice.status === 'PAID'
                      ? 'تم ترحيل الفاتورة إلى حساب الغرفة بالريسبشن (ROOM_ACCOUNT.REST_Q)'
                      : ar.client.reception_note}
                  </div>
                </div>
              )}
            </div>
          )}

          {/* Civilian Info Pill (مدنى) */}
          {activeTab === 'CIVILIAN' && (
            <div style={{
              marginTop: 8,
              padding: '6px 10px',
              borderRadius: 6,
              background: '#F4F6F9',
              fontSize: 12,
              color: 'var(--muted)',
              display: 'flex',
              justifyContent: 'space-between',
            }}>
              <span>👤 عميل مدنى (سداد مباشر بالكاشير)</span>
              <strong style={{ color: 'var(--navy)' }}>تطبق خدمة {Number(invoice.service_percent).toFixed(0)}%</strong>
            </div>
          )}
        </div>

        {invoice.note && (
          <div style={{
            fontSize: 12,
            color: 'var(--amber)',
            background: '#FFF9EB',
            padding: '6px 10px',
            borderRadius: 6,
            marginBottom: 12,
            border: '1px solid #F5DFB0',
          }}>
            📝 ملاحظات الأوردر: {invoice.note}
          </div>
        )}

        {/* 4-Column Invoice Items Table: الصنف | الكمية | السعر | الإجمالي
            Read-Only for Normal Cashiers; Editable ONLY for Takeaway Pizza (canEditItems === true)
        */}
        <div style={{
          border: '1px solid var(--line)',
          borderRadius: 8,
          overflow: 'hidden',
          marginBottom: 14,
          background: 'white',
        }}>
          {lines.length === 0 ? (
            <div className="muted" style={{ padding: 20, textAlign: 'center', fontSize: 13 }}>
              {ar.invoice.empty_lines}
            </div>
          ) : (
            <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 13 }}>
              <thead>
                <tr style={{
                  background: '#F4F1E8',
                  color: 'var(--navy)',
                  fontSize: 12,
                  borderBottom: '2px solid var(--line)',
                }}>
                  <th style={{ textAlign: 'start', padding: '8px 10px' }}>{ar.pos.item_col}</th>
                  <th style={{ textAlign: 'center', padding: '8px 6px', width: canEditItems ? 110 : 65 }}>{ar.pos.qty}</th>
                  <th style={{ textAlign: 'center', padding: '8px 6px', width: 75 }}>{ar.pos.price}</th>
                  <th style={{ textAlign: 'end', padding: '8px 10px', width: 85 }}>{ar.pos.line_total}</th>
                  {canEditItems && invoice.status === 'OPEN' && <th style={{ width: 28 }} />}
                </tr>
              </thead>
              <tbody>
                {lines.map((l, idx) => (
                  <tr
                    key={l.id}
                    style={{
                      borderBottom: idx < lines.length - 1 ? '1px solid var(--line)' : 'none',
                      background: idx % 2 === 1 ? '#FCFBF8' : 'white',
                    }}
                  >
                    <td style={{ padding: '8px 10px' }}>
                      <div style={{ fontWeight: 600, color: 'var(--ink)' }}>{l.item_name}</div>
                      {l.note && <div className="muted" style={{ fontSize: 11 }}>• {l.note}</div>}
                    </td>
                    <td style={{ textAlign: 'center', padding: '6px 4px' }}>
                      {canEditItems && invoice.status === 'OPEN' ? (
                        <div style={{ display: 'inline-flex', alignItems: 'center', gap: 4 }}>
                          <button
                            type="button"
                            className="btn"
                            disabled={Number(l.qty) <= 1}
                            onClick={() => onQty(l, Number(l.qty) - 1)}
                            style={{ padding: '2px 7px', fontSize: 12, minWidth: 24 }}
                          >
                            −
                          </button>
                          <input
                            type="number"
                            min={1}
                            max={9999}
                            step={1}
                            value={Number(l.qty)}
                            onChange={(e) => onQty(l, Number(e.target.value))}
                            style={{ width: 46, padding: '3px 4px', textAlign: 'center', fontWeight: 700 }}
                          />
                          <button
                            type="button"
                            className="btn"
                            onClick={() => onQty(l, Number(l.qty) + 1)}
                            style={{ padding: '2px 7px', fontSize: 12, minWidth: 24 }}
                          >
                            +
                          </button>
                        </div>
                      ) : (
                        <span style={{
                          display: 'inline-block',
                          fontWeight: 700,
                          background: '#F4F1E8',
                          color: 'var(--navy)',
                          padding: '2px 10px',
                          borderRadius: 999,
                          fontSize: 12,
                        }}>
                          {Number(l.qty)}
                        </span>
                      )}
                    </td>
                    <td style={{ textAlign: 'center', padding: '8px 6px', color: 'var(--muted)', fontWeight: 500 }}>
                      {Number(l.unit_price).toFixed(2)}
                    </td>
                    <td style={{ textAlign: 'end', padding: '8px 10px', fontWeight: 700, color: 'var(--navy)' }}>
                      {Number(l.line_total).toFixed(2)}
                    </td>
                    {canEditItems && invoice.status === 'OPEN' && (
                      <td style={{ textAlign: 'center', padding: '4px' }}>
                        <button
                          type="button"
                          className="btn ghost"
                          onClick={() => onRemove(l)}
                          style={{ color: 'var(--red)', padding: '2px 6px' }}
                          title={ar.pos.remove}
                        >
                          ×
                        </button>
                      </td>
                    )}
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>

        {/* Financial Breakdown: Subtotal + 12% Service Charge + Discount = Grand Total */}
        <div style={{
          background: '#F9F6EE',
          borderRadius: 10,
          padding: '12px 14px',
          border: '1px solid var(--line)',
        }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', padding: '4px 0', fontSize: 13 }}>
            <span className="muted">{ar.pos.subtotal} ({lines.length} أصناف)</span>
            <strong>{Number(invoice.subtotal).toFixed(2)} ج.م</strong>
          </div>

          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            padding: '6px 0',
            fontSize: 13,
            color: 'var(--navy)',
          }}>
            <span style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
              <span>{ar.pos.service} المضافة</span>
              <span style={{
                fontSize: 11,
                fontWeight: 700,
                background: '#EBF3F5',
                color: 'var(--navy)',
                padding: '1px 8px',
                borderRadius: 999,
                border: '1px solid var(--navy)',
              }}>
                +{Number(invoice.service_percent).toFixed(0)}%
              </span>
            </span>
            <strong style={{ color: 'var(--navy)' }}>+ {Number(invoice.service_amount).toFixed(2)} ج.م</strong>
          </div>

          {(Number(invoice.discount_amount) > 0 || isMember) && (
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              padding: '6px 0',
              fontSize: 13,
            }}>
              <span className="muted">
                {ar.pos.discount} ({Number(invoice.discount_percent)}%)
              </span>
              <strong style={{ color: 'var(--green)' }}>
                − {Number(invoice.discount_amount).toFixed(2)} ج.م
              </strong>
            </div>
          )}

          <div style={{
            marginTop: 8,
            paddingTop: 10,
            borderTop: '2px solid var(--gold)',
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
          }}>
            <span style={{ fontSize: 15, fontWeight: 700, color: 'var(--navy)' }}>
              {ar.pos.total}
            </span>
            <span style={{
              fontSize: 20,
              fontWeight: 800,
              color: 'var(--navy)',
              background: 'white',
              padding: '4px 12px',
              borderRadius: 8,
              border: '1px solid var(--gold)',
            }}>
              {Number(invoice.total).toFixed(2)} ج.م
            </span>
          </div>
        </div>

        {/* Invoice Action Buttons */}
        <div style={{ display: 'flex', gap: 8, marginTop: 14, flexWrap: 'wrap' }}>
          {invoice.status === 'OPEN' && (
            <>
              <button
                type="button"
                className="btn gold"
                onClick={onClose}
                disabled={lines.length === 0}
                style={{ flex: 1, justifyContent: 'center', padding: '11px 14px', fontSize: 14 }}
              >
                {isGuest ? `🏨 ${ar.pos.close_room}` : `💳 ${ar.pos.close}`}
              </button>
              <button
                type="button"
                className="btn danger"
                onClick={onCancel}
                style={{ padding: '11px 14px' }}
              >
                {ar.pos.cancel}
              </button>
            </>
          )}
          <button
            type="button"
            className="btn primary"
            onClick={() => onPrint(1)}
            style={{ flex: invoice.status === 'OPEN' ? undefined : 1, justifyContent: 'center' }}
          >
            🖨️ {ar.pos.print}
          </button>
          <button
            type="button"
            className="btn"
            onClick={() => onPrint(2)}
          >
            نسختين (2x)
          </button>
        </div>
      </div>
    </div>
  );
}
