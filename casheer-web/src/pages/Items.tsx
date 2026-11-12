import { useEffect, useState, type FormEvent } from 'react';
import { api, HttpError } from '@/api/client';
import { ar } from '@/i18n/ar';
import { useAuth } from '@/hooks/useAuth';
import type { Item, ItemType } from '@/types';

type Draft = {
  id?: string;
  code: string;
  name: string;
  type_id: string;
  default_price: string;
  active: boolean;
};

const EMPTY: Draft = { code: '', name: '', type_id: '', default_price: '', active: true };

export function ItemsPage() {
  const { user } = useAuth();
  const canEdit = user?.role === 'ADMIN' || user?.role === 'SUPERVISOR';
  const canDelete = user?.role === 'ADMIN';

  const [items, setItems]       = useState<Item[]>([]);
  const [types, setTypes]       = useState<ItemType[]>([]);
  const [draft, setDraft]       = useState<Draft>(EMPTY);
  const [editing, setEditing]   = useState<string | null>(null);
  const [error, setError]       = useState<string | null>(null);
  const [filter, setFilter]     = useState('');

  async function load() {
    try {
      const [i, t] = await Promise.all([
        api<{ items: Item[] }>('/items'),
        api<{ types: ItemType[] }>('/items/types'),
      ]);
      setItems(i.items);
      setTypes(t.types);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  useEffect(() => { load(); }, []);

  function startEdit(item: Item) {
    setEditing(item.id);
    setDraft({
      id: item.id,
      code: String(item.code),
      name: item.name,
      type_id: item.type_id,
      default_price: item.price,
      active: item.active,
    });
  }

  function cancelEdit() {
    setEditing(null);
    setDraft(EMPTY);
  }

  async function submit(e: FormEvent) {
    e.preventDefault();
    setError(null);
    const body = {
      code: Number(draft.code),
      name: draft.name,
      type_id: draft.type_id,
      default_price: Number(draft.default_price),
      active: draft.active,
    };
    try {
      if (editing) {
        await api(`/items/${editing}`, { method: 'PATCH', body: JSON.stringify(body) });
      } else {
        await api('/items', { method: 'POST', body: JSON.stringify(body) });
      }
      cancelEdit();
      await load();
    } catch (ex) {
      setError(ex instanceof HttpError ? ex.apiError.message : String(ex));
    }
  }

  async function del(id: string) {
    if (!confirm('تعطيل هذا الصنف؟')) return;
    try {
      await api(`/items/${id}`, { method: 'DELETE' });
      await load();
    } catch (ex) {
      setError(ex instanceof HttpError ? ex.apiError.message : String(ex));
    }
  }

  const filtered = items.filter((it) =>
    !filter || it.name.includes(filter) || String(it.code).includes(filter),
  );

  return (
    <div>
      <h1 style={{ marginTop: 0 }}>{ar.nav.items}</h1>
      {error && <div className="msg error">{error}</div>}

      <div style={{ display: 'grid', gridTemplateColumns: canEdit ? '1fr 360px' : '1fr', gap: 16, alignItems: 'start' }}>
        <div className="card">
          <input
            placeholder="بحث..."
            value={filter}
            onChange={(e) => setFilter(e.target.value)}
            style={{ marginBottom: 12 }}
          />
          {filtered.length === 0 ? (
            <p className="muted">لا توجد أصناف</p>
          ) : (
            <table style={{ width: '100%', borderCollapse: 'collapse' }}>
              <thead>
                <tr style={{ fontSize: 12, color: 'var(--muted)', borderBottom: '2px solid var(--line)' }}>
                  <th style={{ textAlign: 'start', padding: '6px 4px' }}>الكود</th>
                  <th style={{ textAlign: 'start' }}>الاسم</th>
                  <th style={{ textAlign: 'start' }}>التصنيف</th>
                  <th style={{ textAlign: 'end'  }}>{ar.pos.price}</th>
                  <th />
                </tr>
              </thead>
              <tbody>
                {filtered.map((it) => (
                  <tr key={it.id} style={{ borderBottom: '1px solid var(--line)' }}>
                    <td style={{ padding: '6px 4px' }}>{it.code}</td>
                    <td>{it.name}</td>
                    <td className="muted">{it.type_name}</td>
                    <td style={{ textAlign: 'end' }}>{it.price}</td>
                    <td style={{ textAlign: 'end' }}>
                      {canEdit && (
                        <button className="btn ghost" onClick={() => startEdit(it)}>تعديل</button>
                      )}
                      {canDelete && (
                        <button className="btn ghost" style={{ color: 'var(--red)' }}
                                onClick={() => del(it.id)}>تعطيل</button>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>

        {canEdit && (
          <form onSubmit={submit} className="card">
            <h3 style={{ marginTop: 0 }}>{editing ? 'تعديل صنف' : 'صنف جديد'}</h3>
            <label style={{ display: 'block', marginBottom: 10 }}>
              <span className="muted" style={{ fontSize: 12 }}>الكود</span>
              <input value={draft.code} onChange={(e) => setDraft({ ...draft, code: e.target.value })}
                     type="number" min={1} required />
            </label>
            <label style={{ display: 'block', marginBottom: 10 }}>
              <span className="muted" style={{ fontSize: 12 }}>الاسم</span>
              <input value={draft.name} onChange={(e) => setDraft({ ...draft, name: e.target.value })}
                     required maxLength={200} />
            </label>
            <label style={{ display: 'block', marginBottom: 10 }}>
              <span className="muted" style={{ fontSize: 12 }}>التصنيف</span>
              <select value={draft.type_id}
                      onChange={(e) => setDraft({ ...draft, type_id: e.target.value })} required>
                <option value="">—</option>
                {types.map((t) => <option key={t.id} value={t.id}>{t.name}</option>)}
              </select>
            </label>
            <label style={{ display: 'block', marginBottom: 10 }}>
              <span className="muted" style={{ fontSize: 12 }}>{ar.pos.price}</span>
              <input value={draft.default_price}
                     onChange={(e) => setDraft({ ...draft, default_price: e.target.value })}
                     type="number" min={0} step="0.01" required />
            </label>
            <label style={{ display: 'flex', gap: 8, alignItems: 'center', marginBottom: 14 }}>
              <input type="checkbox" checked={draft.active}
                     onChange={(e) => setDraft({ ...draft, active: e.target.checked })}
                     style={{ width: 'auto' }} />
              <span>نشط</span>
            </label>
            <div style={{ display: 'flex', gap: 8 }}>
              <button type="submit" className="btn primary">{ar.common.save}</button>
              {editing && <button type="button" className="btn ghost" onClick={cancelEdit}>
                {ar.common.cancel}
              </button>}
            </div>
          </form>
        )}
      </div>
    </div>
  );
}
