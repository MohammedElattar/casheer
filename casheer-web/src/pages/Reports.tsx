import { useEffect, useState } from 'react';
import { api } from '@/api/client';
import { ar } from '@/i18n/ar';
import type { Point } from '@/types';

type Bucket = { count: number; subtotal_sum: string; service_sum: string; discount_sum: string; total_sum: string };
type DaySummary = { buckets: { OPEN: Bucket; PAID: Bucket; CANCELLED: Bucket } };
type ItemSold = { item_id: string; item_code: number; item_name: string; type_name: string;
                  qty_sold: string; total_sold: string };

export function ReportsPage() {
  const [points, setPoints]   = useState<Point[]>([]);
  const [pointId, setPointId] = useState('');
  const [date, setDate]       = useState(new Date().toISOString().slice(0, 10));
  const [summary, setSummary] = useState<DaySummary | null>(null);
  const [items, setItems]     = useState<ItemSold[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError]     = useState<string | null>(null);

  useEffect(() => {
    api<{ points: Point[] }>('/points').then((r) => {
      setPoints(r.points);
      if (r.points[0]) setPointId(r.points[0].id);
    }).catch((e) => setError(String(e)));
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

  useEffect(() => { load(); /* eslint-disable-next-line */ }, [pointId, date]);

  return (
    <div>
      <h1 style={{ marginTop: 0 }}>{ar.nav.reports}</h1>
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

      {summary && (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 12, marginBottom: 16 }}>
          <KPI title={ar.invoice.status.PAID}      color="var(--green)" b={summary.buckets.PAID} />
          <KPI title={ar.invoice.status.OPEN}      color="var(--amber)" b={summary.buckets.OPEN} />
          <KPI title={ar.invoice.status.CANCELLED} color="var(--red)"   b={summary.buckets.CANCELLED} />
        </div>
      )}

      <div className="card">
        <h3 style={{ marginTop: 0 }}>الأصناف المباعة</h3>
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
                  <td style={{ textAlign: 'end', fontWeight: 600 }}>{Number(it.total_sold).toFixed(2)}</td>
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
        {Number(b.total_sum).toFixed(2)}
      </div>
    </div>
  );
}
