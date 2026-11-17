import { useEffect, useState } from 'react';
import { api } from '@/api/client';
import { useAuth } from '@/hooks/useAuth';
import { ar } from '@/i18n/ar';
import { getShiftDates } from '@/pages/Login';
import type { Invoice, InvoiceStatus, Point } from '@/types';

export function InvoicesPage() {
  const { point: sessionPoint, shift: sessionShift } = useAuth();
  const [points, setPoints]     = useState<Point[]>([]);
  const [filter, setFilter]     = useState<{ point_id?: string; status?: InvoiceStatus; inv_date?: string }>(() => ({
    point_id: sessionPoint?.id,
    inv_date: sessionShift?.shift_date ? sessionShift.shift_date.slice(0, 10) : getShiftDates().today,
  }));
  const [invoices, setInvoices] = useState<Invoice[]>([]);
  const [error, setError]       = useState<string | null>(null);
  const [loading, setLoading]   = useState(false);

  useEffect(() => {
    api<{ points: Point[] }>('/points').then((r) => setPoints(r.points)).catch((e) => setError(String(e)));
  }, []);

  async function load() {
    setLoading(true);
    setError(null);
    try {
      const qs = new URLSearchParams();
      for (const [k, v] of Object.entries(filter)) if (v) qs.set(k, v);
      const r = await api<{ invoices: Invoice[] }>(`/invoices?${qs.toString()}`);
      setInvoices(r.invoices);
    } catch (e) { setError(String(e)); }
    finally { setLoading(false); }
  }

  useEffect(() => { load(); /* eslint-disable-next-line */ }, []);

  function printPdf(id: string) {
    window.open(`/api/v1/invoices/${id}/pdf`, '_blank', 'noopener');
  }

  return (
    <div>
      <h1 style={{ marginTop: 0 }}>{ar.nav.invoices}</h1>

      {error && <div className="msg error">{error}</div>}

      <div className="card" style={{ marginBottom: 16, display: 'grid', gap: 12,
                                      gridTemplateColumns: '1fr 1fr 1fr auto' }}>
        <label>
          <span className="muted" style={{ fontSize: 12 }}>{ar.pos.point}</span>
          <select value={filter.point_id ?? ''} onChange={(e) => setFilter({ ...filter, point_id: e.target.value || undefined })}>
            <option value="">—</option>
            {points.map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}
          </select>
        </label>
        <label>
          <span className="muted" style={{ fontSize: 12 }}>{ar.pos.shift_date}</span>
          <input type="date" value={filter.inv_date ?? ''}
                 onChange={(e) => setFilter({ ...filter, inv_date: e.target.value || undefined })} />
        </label>
        <label>
          <span className="muted" style={{ fontSize: 12 }}>الحالة</span>
          <select value={filter.status ?? ''}
                  onChange={(e) => setFilter({ ...filter, status: (e.target.value || undefined) as InvoiceStatus | undefined })}>
            <option value="">—</option>
            <option value="OPEN">{ar.invoice.status.OPEN}</option>
            <option value="PAID">{ar.invoice.status.PAID}</option>
            <option value="CANCELLED">{ar.invoice.status.CANCELLED}</option>
          </select>
        </label>
        <button className="btn primary" onClick={load} disabled={loading}>
          {loading ? ar.common.loading : 'بحث'}
        </button>
      </div>

      <div className="card">
        {invoices.length === 0 ? (
          <p className="muted">لا توجد فواتير</p>
        ) : (
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead>
              <tr style={{ fontSize: 12, color: 'var(--muted)', borderBottom: '2px solid var(--line)' }}>
                <th style={{ textAlign: 'start',  padding: '8px 4px' }}>#</th>
                <th style={{ textAlign: 'center', padding: '8px 4px' }}>إيصال</th>
                <th style={{ textAlign: 'start',  padding: '8px 4px' }}>التاريخ</th>
                <th style={{ textAlign: 'start',  padding: '8px 4px' }}>نوع العميل والتفاصيل</th>
                <th style={{ textAlign: 'center', padding: '8px 4px' }}>الخدمة</th>
                <th style={{ textAlign: 'center', padding: '8px 4px' }}>الحالة</th>
                <th style={{ textAlign: 'end',    padding: '8px 4px' }}>{ar.pos.total}</th>
                <th />
              </tr>
            </thead>
            <tbody>
              {invoices.map((inv) => {
                const cType = inv.client_type || 'CIVILIAN';
                return (
                  <tr key={inv.id} style={{ borderBottom: '1px solid var(--line)' }}>
                    <td style={{ padding: '8px 4px' }}>{inv.serial_no}</td>
                    <td style={{ textAlign: 'center' }}>{inv.ser_no ?? '—'}</td>
                    <td>{String(inv.inv_date).slice(0, 10)}</td>
                    <td>
                      <span style={{
                        fontWeight: 700,
                        fontSize: 12,
                        color: cType === 'MEMBER' ? 'var(--green)' : cType === 'GUEST' ? 'var(--amber)' : 'var(--navy)',
                      }}>
                        {cType === 'MEMBER' ? '🪪 مشترك' : cType === 'GUEST' ? '🏨 نزيل' : '👤 مدنى'}
                      </span>
                      {inv.mem_name && <span className="muted" style={{ fontSize: 12 }}> — {inv.mem_name} ({inv.mem_bar})</span>}
                      {inv.room_no && <span className="muted" style={{ fontSize: 12 }}> — غرفة #{inv.room_no} ({inv.guest_name})</span>}
                    </td>
                    <td style={{ textAlign: 'center', fontSize: 12 }}>
                      +{Number(inv.service_amount).toFixed(2)} ({Number(inv.service_percent).toFixed(0)}%)
                    </td>
                    <td style={{ textAlign: 'center' }}>
                      <span style={{
                        padding: '2px 8px', borderRadius: 999, fontSize: 11,
                        background: inv.status === 'PAID' ? '#E6F4EE'
                                  : inv.status === 'CANCELLED' ? '#FDEAEA' : '#FFF4D9',
                        color:      inv.status === 'PAID' ? 'var(--green)'
                                  : inv.status === 'CANCELLED' ? 'var(--red)' : 'var(--amber)',
                      }}>
                        {ar.invoice.status[inv.status]}
                      </span>
                    </td>
                    <td style={{ textAlign: 'end', fontWeight: 700 }}>{Number(inv.total).toFixed(2)} ج.م</td>
                    <td style={{ textAlign: 'end' }}>
                      <button className="btn ghost" onClick={() => printPdf(inv.id)}>{ar.pos.print}</button>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}
