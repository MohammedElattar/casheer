import { useEffect, useState } from 'react';
import { api } from '@/api/client';
import { useAuth } from '@/hooks/useAuth';
import { ar } from '@/i18n/ar';
import { getShiftDates } from '@/pages/Login';
import { ShiftCloseModal } from '@/components/ShiftCloseModal';
import type { Point, ShiftCloseSummary } from '@/types';

type Bucket = { count: number; subtotal_sum: string; service_sum: string; discount_sum: string; total_sum: string };
type ClientSub = { count: number; total_sum: string };
type DaySummary = {
  buckets: { OPEN: Bucket; PAID: Bucket; CANCELLED: Bucket };
  client_breakdown?: {
    civilian: ClientSub;
    member: ClientSub;
    cash_total: ClientSub;
    guest: ClientSub;
    deferred_total: ClientSub;
    grand_total: ClientSub;
  };
};
type ItemSold = { item_id: string; item_code: number; item_name: string; type_name: string;
                  qty_sold: string; total_sold: string };

export function ReportsPage() {
  const { point: sessionPoint, shift: sessionShift } = useAuth();
  const [points, setPoints]   = useState<Point[]>([]);
  const [pointId, setPointId] = useState(sessionPoint?.id ?? '');
  const [date, setDate]       = useState(
    sessionShift?.shift_date ? sessionShift.shift_date.slice(0, 10) : getShiftDates().today
  );
  const [summary, setSummary] = useState<DaySummary | null>(null);
  const [items, setItems]     = useState<ItemSold[]>([]);
  const [shiftModal, setShiftModal] = useState<ShiftCloseSummary | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError]     = useState<string | null>(null);

  useEffect(() => {
    api<{ points: Point[] }>('/points').then((r) => {
      setPoints(r.points);
      if (!pointId && r.points[0]) setPointId(sessionPoint?.id ?? r.points[0].id);
    }).catch((e) => setError(String(e)));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function load() {
    if (!pointId || !date) return;
    setLoading(true);
    setError(null);
    try {
      const qs = `point_id=${pointId}&inv_date=${date}`;
      const [s, it] = await Promise.all([
        api<DaySummary>(`/reports/day-summary?${qs}`),
        api<{ items: ItemSold[] }>(`/reports/items-sold?${qs}`),
      ]);
      setSummary(s);
      setItems(it.items);
    } catch (e) { setError(String(e)); }
    finally { setLoading(false); }
  }

  async function openActiveShiftReport() {
    if (!sessionShift) return;
    try {
      const r = await api<ShiftCloseSummary>(`/shifts/${sessionShift.id}/close-preview`);
      setShiftModal(r);
    } catch (e) {
      setError(String(e));
    }
  }

  useEffect(() => { load(); /* eslint-disable-next-line */ }, [pointId, date]);

  return (
    <div>
      {shiftModal && (
        <ShiftCloseModal
          summary={shiftModal}
          onBack={() => setShiftModal(null)}
        />
      )}

      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
        <h1 style={{ margin: 0 }}>{ar.nav.reports}</h1>
        {sessionShift && (
          <button className="btn gold" onClick={openActiveShiftReport}>
            📋 فتح نموذج إغلاق وتقارير الوردية الحالية
          </button>
        )}
      </div>

      {error && <div className="msg error">{error}</div>}

      <div className="card" style={{ display: 'grid', gridTemplateColumns: '1fr 1fr auto', gap: 12, marginBottom: 16 }}>
        <label>
          <span className="muted" style={{ fontSize: 12 }}>{ar.pos.point}</span>
          <select value={pointId} onChange={(e) => setPointId(e.target.value)}>
            {points.map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}
          </select>
        </label>
        <label>
          <span className="muted" style={{ fontSize: 12 }}>التاريخ</span>
          <input type="date" value={date} onChange={(e) => setDate(e.target.value)} />
        </label>
        <button className="btn primary" onClick={load} disabled={loading}>تحديث</button>
      </div>

      {summary?.client_breakdown && (
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 14, marginBottom: 16 }}>
          <div className="card" style={{ borderTop: '4px solid var(--navy)' }}>
            <h3 style={{ marginTop: 0, color: 'var(--navy)', fontSize: 15 }}>إجمالي الفواتير النقدية</h3>
            <div style={{ display: 'flex', justifyContent: 'space-between', padding: '4px 0', fontSize: 13 }}>
              <span>👤 المدنى ({summary.client_breakdown.civilian.count} فاتورة):</span>
              <strong>{summary.client_breakdown.civilian.total_sum} ج.م</strong>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', padding: '4px 0', fontSize: 13 }}>
              <span>🪪 المشترك ({summary.client_breakdown.member.count} فاتورة):</span>
              <strong>{summary.client_breakdown.member.total_sum} ج.م</strong>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', paddingTop: 8, marginTop: 6, borderTop: '1px dashed var(--line)', fontWeight: 800, color: 'var(--navy)' }}>
              <span>إجمالي النقدي:</span>
              <span>{summary.client_breakdown.cash_total.total_sum} ج.م</span>
            </div>
          </div>

          <div className="card" style={{ borderTop: '4px solid var(--amber)' }}>
            <h3 style={{ marginTop: 0, color: 'var(--amber)', fontSize: 15 }}>إجمالي الفواتير الآجلة (النزيل)</h3>
            <div style={{ display: 'flex', justifyContent: 'space-between', padding: '4px 0', fontSize: 13 }}>
              <span>🏨 النزيل ({summary.client_breakdown.guest.count} فاتورة):</span>
              <strong>{summary.client_breakdown.guest.total_sum} ج.م</strong>
            </div>
            <div className="muted" style={{ fontSize: 11, padding: '4px 0' }}>
              مرحّلة لحساب الغرف بالريسبشن
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', paddingTop: 8, marginTop: 6, borderTop: '1px dashed var(--line)', fontWeight: 800, color: 'var(--amber)' }}>
              <span>إجمالي الآجل:</span>
              <span>{summary.client_breakdown.deferred_total.total_sum} ج.م</span>
            </div>
          </div>

          <div className="card" style={{ borderTop: '4px solid var(--gold)', background: '#FFFCF5' }}>
            <h3 style={{ marginTop: 0, color: 'var(--navy)', fontSize: 15 }}>الإجمالي العام</h3>
            <div style={{ fontSize: 26, fontWeight: 800, color: 'var(--green)', margin: '8px 0' }}>
              {summary.client_breakdown.grand_total.total_sum} ج.م
            </div>
            <div className="muted" style={{ fontSize: 12 }}>
              إجمالي {summary.client_breakdown.grand_total.count} فاتورة مسددة
            </div>
          </div>
        </div>
      )}

      {summary && (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 12, marginBottom: 16 }}>
          <KPI title={ar.invoice.status.PAID}      color="var(--green)" b={summary.buckets.PAID} />
          <KPI title={ar.invoice.status.OPEN}      color="var(--amber)" b={summary.buckets.OPEN} />
          <KPI title={ar.invoice.status.CANCELLED} color="var(--red)"   b={summary.buckets.CANCELLED} />
        </div>
      )}

      <div className="card">
        <h3 style={{ marginTop: 0 }}>الأصناف المنصرفة</h3>
        {items.length === 0 ? (
          <p className="muted">لا توجد بيانات</p>
        ) : (
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead>
              <tr style={{ fontSize: 12, color: 'var(--muted)', borderBottom: '2px solid var(--line)' }}>
                <th style={{ textAlign: 'start', padding: '6px 4px' }}>الكود</th>
                <th style={{ textAlign: 'start' }}>الصنف</th>
                <th style={{ textAlign: 'start' }}>التصنيف</th>
                <th style={{ textAlign: 'end'  }}>{ar.pos.qty}</th>
                <th style={{ textAlign: 'end'  }}>{ar.pos.total}</th>
              </tr>
            </thead>
            <tbody>
              {items.map((it) => (
                <tr key={it.item_id} style={{ borderBottom: '1px solid var(--line)' }}>
                  <td style={{ padding: '6px 4px' }}>{it.item_code}</td>
                  <td>{it.item_name}</td>
                  <td className="muted">{it.type_name}</td>
                  <td style={{ textAlign: 'end' }}>{Number(it.qty_sold)}</td>
                  <td style={{ textAlign: 'end', fontWeight: 600 }}>{Number(it.total_sold).toFixed(2)} ج.م</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}

function KPI({ title, b, color }: { title: string; b: Bucket; color: string }) {
  return (
    <div className="card">
      <div className="muted" style={{ fontSize: 12 }}>{title}</div>
      <div style={{ fontSize: 28, fontWeight: 700, color, marginTop: 6 }}>
        {b.count}
      </div>
      <div className="muted" style={{ marginTop: 4, fontSize: 13 }}>
        {Number(b.total_sum).toFixed(2)} ج.م
      </div>
    </div>
  );
}
