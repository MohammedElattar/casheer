import { useEffect, useState } from 'react';
import { api, HttpError } from '@/api/client';
import { ar } from '@/i18n/ar';
import type { Point, Item, Shift, Invoice, InvoiceLine } from '@/types';

type Totals = Pick<Invoice, 'subtotal' | 'service_amount' | 'discount_amount' | 'total'
                           | 'service_percent' | 'discount_percent'>;

export function POSPage() {
  const [points, setPoints]   = useState<Point[]>([]);
  const [point, setPoint]     = useState<Point | null>(null);
  const [shift, setShift]     = useState<Shift | null>(null);
  const [items, setItems]     = useState<Item[]>([]);
  const [invoice, setInvoice] = useState<Invoice | null>(null);
  const [lines, setLines]     = useState<InvoiceLine[]>([]);
  const [error, setError]     = useState<string | null>(null);

  // Load points on mount.
  useEffect(() => {
    api<{ points: Point[] }>('/points')
      .then((r) => setPoints(r.points))
      .catch((e) => setError(String(e)));
  }, []);

  // Load items when point selected.
  useEffect(() => {
    if (!point) return;
    api<{ items: Item[] }>(`/items?point_id=${point.id}`)
      .then((r) => setItems(r.items))
      .catch((e) => setError(String(e)));
  }, [point]);

  async function openShift() {
    if (!point) return;
    setError(null);
    try {
      const r = await api<{ shift: Shift }>('/shifts', {
        method: 'POST',
        body: JSON.stringify({
          point_id: point.id,
          shift_date: new Date().toISOString().slice(0, 10),
          shift_kind: 1,
        }),
      });
      setShift(r.shift);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function newInvoice() {
    if (!point || !shift) return;
    setError(null);
    try {
      const r = await api<{ invoice: Invoice }>('/invoices', {
        method: 'POST',
        body: JSON.stringify({
          point_id: point.id,
          inv_date: shift.shift_date,
          shift_id:  shift.id,
          inv_type:  1,
          madf_type: 1,
        }),
      });
      setInvoice(r.invoice);
      setLines([]);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function addItem(item: Item) {
    if (!invoice) return;
    try {
      const r = await api<{ line: InvoiceLine; invoice: Invoice }>(
        `/invoices/${invoice.id}/lines`,
        { method: 'POST', body: JSON.stringify({ item_id: item.id, qty: 1 }) },
      );
      setLines([...lines, r.line]);
      setInvoice(r.invoice);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function changeQty(line: InvoiceLine, newQty: number) {
    if (!invoice) return;
    try {
      const r = await api<{ line: InvoiceLine; invoice: Invoice }>(
        `/invoices/${invoice.id}/lines/${line.id}`,
        { method: 'PATCH', body: JSON.stringify({ qty: newQty }) },
      );
      setLines(lines.map((l) => (l.id === line.id ? r.line : l)));
      setInvoice(r.invoice);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function removeLine(line: InvoiceLine) {
    if (!invoice) return;
    try {
      const r = await api<{ invoice: Invoice }>(
        `/invoices/${invoice.id}/lines/${line.id}`,
        { method: 'DELETE' },
      );
      setLines(lines.filter((l) => l.id !== line.id));
      setInvoice(r.invoice);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function closeInvoice() {
    if (!invoice) return;
    try {
      const r = await api<{ invoice: Invoice }>(`/invoices/${invoice.id}/close`,
        { method: 'POST' });
      setInvoice(r.invoice);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  async function cancelInvoice() {
    if (!invoice) return;
    if (!confirm(ar.pos.confirm_cancel)) return;
    try {
      const r = await api<{ invoice: Invoice }>(`/invoices/${invoice.id}/cancel`,
        { method: 'POST', body: JSON.stringify({}) });
      setInvoice(r.invoice);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  function printInvoice() {
    if (!invoice) return;
    window.open(`/api/v1/invoices/${invoice.id}/pdf`, '_blank', 'noopener');
  }

  return (
    <div>
      {error && <div className="msg error">{error}</div>}

      {/* Point + shift picker */}
      {!shift && (
        <div className="card" style={{ marginBottom: 16 }}>
          <h2 style={{ marginTop: 0 }}>{ar.pos.open_shift}</h2>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr auto', gap: 12, alignItems: 'end' }}>
            <label>
              <span className="muted" style={{ fontSize: 12 }}>{ar.pos.point}</span>
              <select
                value={point?.id ?? ''}
                onChange={(e) => setPoint(points.find((p) => p.id === e.target.value) ?? null)}
              >
                <option value="">—</option>
                {points.map((p) => <option key={p.id} value={p.id}>{p.name}</option>)}
              </select>
            </label>
            <button className="btn primary" disabled={!point} onClick={openShift}>
              {ar.pos.open_shift}
            </button>
          </div>
        </div>
      )}

      {shift && (
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 380px', gap: 16, alignItems: 'start' }}>
          <section className="card">
            <h2 style={{ marginTop: 0 }}>{point?.name}</h2>
            {!invoice && (
              <button className="btn primary" onClick={newInvoice}>{ar.pos.new_invoice}</button>
            )}
            {invoice && (
              <>
                <p className="muted">
                  #{invoice.ser_no ?? invoice.serial_no} · {ar.invoice.status[invoice.status]}
                </p>

                <div style={{
                  display: 'grid',
                  gridTemplateColumns: 'repeat(auto-fill, minmax(140px, 1fr))',
                  gap: 8,
                }}>
                  {items.map((it) => (
                    <button
                      key={it.id}
                      onClick={() => addItem(it)}
                      disabled={invoice.status !== 'OPEN'}
                      className="btn"
                      style={{ padding: '14px 10px', textAlign: 'center', flexDirection: 'column' }}
                    >
                      <strong>{it.name}</strong>
                      <span className="muted" style={{ fontSize: 11, marginTop: 4 }}>
                        {it.price}
                      </span>
                    </button>
                  ))}
                </div>
              </>
            )}
          </section>

          <aside className="card">
            {!invoice && <p className="muted">{ar.invoice.empty_lines}</p>}
            {invoice && <InvoiceSummary
              invoice={invoice}
              lines={lines}
              onQty={changeQty}
              onRemove={removeLine}
              onClose={closeInvoice}
              onCancel={cancelInvoice}
              onPrint={printInvoice}
            />}
          </aside>
        </div>
      )}
    </div>
  );
}

function InvoiceSummary({
  invoice, lines, onQty, onRemove, onClose, onCancel, onPrint,
}: {
  invoice: Invoice;
  lines: InvoiceLine[];
  onQty:    (l: InvoiceLine, qty: number) => void;
  onRemove: (l: InvoiceLine) => void;
  onClose:  () => void;
  onCancel: () => void;
  onPrint:  () => void;
}) {
  const t: Totals = invoice;
  return (
    <>
      <h3 style={{ marginTop: 0 }}>
        #{invoice.ser_no ?? invoice.serial_no}
        <span className="muted" style={{ fontSize: 12, marginInlineStart: 8 }}>
          {ar.invoice.status[invoice.status]}
        </span>
      </h3>

      {lines.length === 0 ? (
        <p className="muted">{ar.invoice.empty_lines}</p>
      ) : (
        <table style={{ width: '100%', borderCollapse: 'collapse', marginBottom: 10 }}>
          <thead>
            <tr style={{ fontSize: 11, color: 'var(--muted)' }}>
              <th style={{ textAlign: 'start', padding: '4px 0' }}>{ar.pos.add_item.replace(' إضافة','')}</th>
              <th style={{ textAlign: 'center' }}>{ar.pos.qty}</th>
              <th style={{ textAlign: 'end' }}>{ar.pos.line_total}</th>
              <th />
            </tr>
          </thead>
          <tbody>
            {lines.map((l) => (
              <tr key={l.id} style={{ borderTop: '1px solid var(--line)' }}>
                <td style={{ padding: '6px 0' }}>{l.item_name}</td>
                <td style={{ textAlign: 'center' }}>
                  <input
                    type="number"
                    min={1}
                    max={9999}
                    step={1}
                    value={Number(l.qty)}
                    disabled={invoice.status !== 'OPEN'}
                    onChange={(e) => onQty(l, Number(e.target.value))}
                    style={{ width: 64, padding: 4, textAlign: 'center' }}
                  />
                </td>
                <td style={{ textAlign: 'end' }}>{l.line_total}</td>
                <td style={{ textAlign: 'end' }}>
                  {invoice.status === 'OPEN' && (
                    <button className="btn ghost" onClick={() => onRemove(l)} style={{ color: 'var(--red)' }}>
                      ×
                    </button>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}

      <div style={{ borderTop: '2px solid var(--line)', paddingTop: 8 }}>
        <Row label={ar.pos.subtotal}  value={t.subtotal} />
        {Number(t.service_amount)  > 0 && <Row label={`${ar.pos.service} (${t.service_percent}%)`}  value={t.service_amount} />}
        {Number(t.discount_amount) > 0 && <Row label={`${ar.pos.discount} (${t.discount_percent}%)`} value={`- ${t.discount_amount}`} />}
        <Row label={ar.pos.total} value={t.total} strong />
      </div>

      <div style={{ display: 'flex', gap: 8, marginTop: 16, flexWrap: 'wrap' }}>
        {invoice.status === 'OPEN' && (
          <>
            <button className="btn gold"   onClick={onClose}  disabled={lines.length === 0}>
              {ar.pos.close}
            </button>
            <button className="btn danger" onClick={onCancel}>{ar.pos.cancel}</button>
          </>
        )}
        <button className="btn primary" onClick={onPrint}>{ar.pos.print}</button>
      </div>
    </>
  );
}

function Row({ label, value, strong = false }: { label: string; value: string; strong?: boolean }) {
  return (
    <div style={{
      display: 'flex', justifyContent: 'space-between',
      padding: '4px 0',
      fontWeight: strong ? 700 : 400,
      fontSize:   strong ? 16  : 13,
    }}>
      <span>{label}</span>
      <span>{value}</span>
    </div>
  );
}
