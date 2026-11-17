import { useEffect, useState, type FormEvent } from 'react';
import { api, HttpError } from '@/api/client';
import { ar } from '@/i18n/ar';
import type { Employee, Point } from '@/types';

interface AdminEmployee extends Employee {
  active: boolean;
  point_ids: string[];
  point_codes: number[];
}

export function SettingsPage() {
  const [employees, setEmployees] = useState<AdminEmployee[]>([]);
  const [points, setPoints]       = useState<Point[]>([]);
  const [error, setError]         = useState<string | null>(null);
  const [notice, setNotice]       = useState<string | null>(null);

  // Employee form state
  const [editingEmpId, setEditingEmpId] = useState<string | null>(null);
  const [empCode, setEmpCode]           = useState('');
  const [empName, setEmpName]           = useState('');
  const [empPassword, setEmpPassword]   = useState('');
  const [empRole, setEmpRole]           = useState<Employee['role']>('CASHIER');
  const [empActive, setEmpActive]       = useState(true);
  const [empPointIds, setEmpPointIds]   = useState<string[]>([]);

  // Point form state
  const [ptCode, setPtCode]             = useState('');
  const [ptName, setPtName]             = useState('');
  const [ptService, setPtService]       = useState('10');
  const [ptMinCharge, setPtMinCharge]   = useState('0');

  async function loadAll() {
    setError(null);
    try {
      const [eRes, pRes] = await Promise.all([
        api<{ employees: AdminEmployee[] }>('/employees'),
        api<{ points: Point[] }>('/points/all'),
      ]);
      setEmployees(eRes.employees);
      setPoints(pRes.points);
    } catch (e) {
      setError(e instanceof HttpError ? e.apiError.message : String(e));
    }
  }

  useEffect(() => {
    loadAll();
  }, []);

  function startEditEmployee(emp: AdminEmployee) {
    setEditingEmpId(emp.id);
    setEmpCode(emp.code);
    setEmpName(emp.name);
    setEmpPassword('');
    setEmpRole(emp.role);
    setEmpActive(emp.active);
    setEmpPointIds(emp.point_ids ?? []);
    setNotice(null);
  }

  function resetEmpForm() {
    setEditingEmpId(null);
    setEmpCode('');
    setEmpName('');
    setEmpPassword('');
    setEmpRole('CASHIER');
    setEmpActive(true);
    setEmpPointIds([]);
  }

  function togglePointSelection(ptId: string) {
    setEmpPointIds((prev) =>
      prev.includes(ptId) ? prev.filter((id) => id !== ptId) : [...prev, ptId],
    );
  }

  async function submitEmployee(e: FormEvent) {
    e.preventDefault();
    setError(null);
    setNotice(null);
    try {
      if (editingEmpId) {
        await api(`/employees/${editingEmpId}`, {
          method: 'PATCH',
          body: JSON.stringify({
            name: empName,
            role: empRole,
            active: empActive,
            point_ids: empPointIds,
            ...(empPassword ? { password: empPassword } : {}),
          }),
        });
      } else {
        await api('/employees', {
          method: 'POST',
          body: JSON.stringify({
            code: empCode,
            name: empName,
            password: empPassword,
            role: empRole,
            active: empActive,
            point_ids: empPointIds,
          }),
        });
      }
      resetEmpForm();
      await loadAll();
      setNotice('تم حفظ بيانات الموظف ومنافذ العمل المخصصة له');
    } catch (ex) {
      setError(ex instanceof HttpError ? ex.apiError.message : String(ex));
    }
  }

  async function submitPoint(e: FormEvent) {
    e.preventDefault();
    setError(null);
    setNotice(null);
    try {
      await api('/points', {
        method: 'POST',
        body: JSON.stringify({
          code: Number(ptCode),
          name: ptName,
          service_percent: Number(ptService),
          min_charge: Number(ptMinCharge),
          printer_name: 'THERMAL-1',
        }),
      });
      setPtCode('');
      setPtName('');
      await loadAll();
      setNotice('تم إضافة المنفذ بنجاح');
    } catch (ex) {
      setError(ex instanceof HttpError ? ex.apiError.message : String(ex));
    }
  }

  return (
    <div>
      <h1 style={{ marginTop: 0 }}>{ar.nav.settings}</h1>
      {error && <div className="msg error">{error}</div>}
      {notice && <div className="msg ok">{notice}</div>}

      {/* Section 1: Employees & Port Assignments */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 380px', gap: 16, alignItems: 'start', marginBottom: 24 }}>
        <div className="card">
          <h3 style={{ marginTop: 0 }}>الموظفون ومنافذ العمل المخصصة</h3>
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead>
              <tr style={{ fontSize: 12, color: 'var(--muted)', borderBottom: '2px solid var(--line)' }}>
                <th style={{ textAlign: 'start', padding: '6px 4px' }}>{ar.auth.code}</th>
                <th style={{ textAlign: 'start' }}>الاسم</th>
                <th style={{ textAlign: 'center' }}>الصلاحية</th>
                <th style={{ textAlign: 'start' }}>{ar.auth.assigned_ports}</th>
                <th />
              </tr>
            </thead>
            <tbody>
              {employees.map((emp) => (
                <tr key={emp.id} style={{ borderBottom: '1px solid var(--line)' }}>
                  <td style={{ padding: '8px 4px', fontWeight: 700 }}>{emp.code}</td>
                  <td>{emp.name}</td>
                  <td style={{ textAlign: 'center', fontSize: 12 }}>{emp.role}</td>
                  <td>
                    {(emp.point_codes ?? []).length === 0 ? (
                      <span style={{ color: 'var(--red)', fontSize: 12, fontWeight: 600 }}>بدون منافذ</span>
                    ) : (
                      (emp.point_codes ?? []).map((c) => {
                        const pt = points.find((p) => p.code === c);
                        return (
                          <span
                            key={c}
                            style={{
                              display: 'inline-block',
                              background: '#F7F1E4',
                              border: '1px solid var(--gold)',
                              borderRadius: 6,
                              padding: '2px 8px',
                              fontSize: 11,
                              marginInlineEnd: 4,
                              marginBottom: 2,
                            }}
                          >
                            #{c} {pt?.name ?? ''}
                          </span>
                        );
                      })
                    )}
                  </td>
                  <td style={{ textAlign: 'end' }}>
                    <button className="btn ghost" onClick={() => startEditEmployee(emp)}>
                      تعديل المنافذ
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <form onSubmit={submitEmployee} className="card">
          <h3 style={{ marginTop: 0 }}>{editingEmpId ? `تعديل الموظف (${empCode})` : 'إضافة موظف جديد'}</h3>
          {!editingEmpId && (
            <label style={{ display: 'block', marginBottom: 10 }}>
              <span className="muted" style={{ fontSize: 12 }}>{ar.auth.code}</span>
              <input value={empCode} onChange={(e) => setEmpCode(e.target.value)} required />
            </label>
          )}
          <label style={{ display: 'block', marginBottom: 10 }}>
            <span className="muted" style={{ fontSize: 12 }}>اسم الموظف</span>
            <input value={empName} onChange={(e) => setEmpName(e.target.value)} required />
          </label>
          <label style={{ display: 'block', marginBottom: 10 }}>
            <span className="muted" style={{ fontSize: 12 }}>
              {ar.auth.password} {editingEmpId ? '(اتركه فارغاً للإبقاء على الحالية)' : ''}
            </span>
            <input
              type="password"
              value={empPassword}
              onChange={(e) => setEmpPassword(e.target.value)}
              required={!editingEmpId}
            />
          </label>
          <label style={{ display: 'block', marginBottom: 12 }}>
            <span className="muted" style={{ fontSize: 12 }}>الصلاحية</span>
            <select value={empRole} onChange={(e) => setEmpRole(e.target.value as Employee['role'])}>
              <option value="CASHIER">CASHIER</option>
              <option value="SUPERVISOR">SUPERVISOR</option>
              <option value="ADMIN">ADMIN</option>
            </select>
          </label>

          <div style={{ marginBottom: 14 }}>
            <div className="muted" style={{ fontSize: 12, marginBottom: 6 }}>{ar.auth.assigned_ports}</div>
            <div style={{ display: 'grid', gap: 6, maxHeight: 190, overflowY: 'auto', padding: 8, border: '1px solid var(--line)', borderRadius: 8 }}>
              {points.map((pt) => (
                <label key={pt.id} style={{ display: 'flex', alignItems: 'center', gap: 8, fontSize: 13, cursor: 'pointer' }}>
                  <input
                    type="checkbox"
                    checked={empPointIds.includes(pt.id)}
                    onChange={() => togglePointSelection(pt.id)}
                    style={{ width: 'auto' }}
                  />
                  <span>منفذ #{pt.code} — {pt.name}</span>
                </label>
              ))}
            </div>
          </div>

          <div style={{ display: 'flex', gap: 8 }}>
            <button type="submit" className="btn primary">{ar.common.save}</button>
            {editingEmpId && (
              <button type="button" className="btn ghost" onClick={resetEmpForm}>
                {ar.common.cancel}
              </button>
            )}
          </div>
        </form>
      </div>

      {/* Section 2: Points Management */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 380px', gap: 16, alignItems: 'start' }}>
        <div className="card">
          <h3 style={{ marginTop: 0 }}>منافذ العمل (Points of Sale)</h3>
          <table style={{ width: '100%', borderCollapse: 'collapse' }}>
            <thead>
              <tr style={{ fontSize: 12, color: 'var(--muted)', borderBottom: '2px solid var(--line)' }}>
                <th style={{ textAlign: 'start', padding: '6px 4px' }}>الكود</th>
                <th style={{ textAlign: 'start' }}>اسم المنفذ</th>
                <th style={{ textAlign: 'center' }}>{ar.pos.service} %</th>
                <th style={{ textAlign: 'center' }}>الحد الأدنى</th>
              </tr>
            </thead>
            <tbody>
              {points.map((pt) => (
                <tr key={pt.id} style={{ borderBottom: '1px solid var(--line)' }}>
                  <td style={{ padding: '8px 4px', fontWeight: 700 }}>#{pt.code}</td>
                  <td>{pt.name}</td>
                  <td style={{ textAlign: 'center' }}>{pt.service_percent}%</td>
                  <td style={{ textAlign: 'center' }}>{pt.min_charge}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <form onSubmit={submitPoint} className="card">
          <h3 style={{ marginTop: 0 }}>إضافة منفذ جديد</h3>
          <label style={{ display: 'block', marginBottom: 10 }}>
            <span className="muted" style={{ fontSize: 12 }}>كود المنفذ</span>
            <input type="number" min={1} value={ptCode} onChange={(e) => setPtCode(e.target.value)} required />
          </label>
          <label style={{ display: 'block', marginBottom: 10 }}>
            <span className="muted" style={{ fontSize: 12 }}>اسم المنفذ</span>
            <input value={ptName} onChange={(e) => setPtName(e.target.value)} required />
          </label>
          <label style={{ display: 'block', marginBottom: 10 }}>
            <span className="muted" style={{ fontSize: 12 }}>نسبة الخدمة %</span>
            <input type="number" min={0} max={100} step="0.01" value={ptService} onChange={(e) => setPtService(e.target.value)} required />
          </label>
          <label style={{ display: 'block', marginBottom: 14 }}>
            <span className="muted" style={{ fontSize: 12 }}>الحد الأدنى للطلب</span>
            <input type="number" min={0} step="0.01" value={ptMinCharge} onChange={(e) => setPtMinCharge(e.target.value)} required />
          </label>
          <button type="submit" className="btn primary">{ar.common.save}</button>
        </form>
      </div>
    </div>
  );
}
