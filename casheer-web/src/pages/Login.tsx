import { useEffect, useMemo, useState, type FormEvent } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import { api, HttpError } from '@/api/client';
import { ar } from '@/i18n/ar';
import { ShiftCloseModal } from '@/components/ShiftCloseModal';
import type { Employee, EmployeePortsLookupResponse, Point, ShiftCloseSummary } from '@/types';

function formatLocalDate(d: Date): string {
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}-${m}-${day}`;
}

export function getShiftDates(): { today: string; yesterday: string } {
  const now = new Date();
  const yest = new Date(now.getFullYear(), now.getMonth(), now.getDate() - 1);
  return {
    today: formatLocalDate(now),
    yesterday: formatLocalDate(yest),
  };
}

export function LoginPage() {
  const nav = useNavigate();
  const { login } = useAuth();

  const { today, yesterday } = useMemo(() => getShiftDates(), []);

  const [code, setCode]                     = useState('');
  const [password, setPassword]             = useState('');
  const [shiftKind, setShiftKind]           = useState<number>(1);
  const [shiftDate, setShiftDate]           = useState<string>(today);

  const [empInfo, setEmpInfo]               = useState<Employee | null>(null);
  const [assignedPorts, setAssignedPorts]   = useState<Point[]>([]);
  const [selectedPortId, setSelectedPortId] = useState<string>('');
  const [lookupState, setLookupState]       = useState<'idle' | 'loading' | 'loaded' | 'not_found'>('idle');

  const [error, setError]                   = useState<string | null>(null);
  const [notice, setNotice]                 = useState<string | null>(null);
  const [busy, setBusy]                     = useState(false);
  const [shiftCloseSummary, setShiftCloseSummary] = useState<ShiftCloseSummary | null>(null);

  const isNightShift = shiftKind === 3;

  // Enforce date rule whenever shiftKind changes:
  // Normal shifts (1, 2) are locked to today's current date.
  // Night shift (3) allows selecting today or yesterday.
  useEffect(() => {
    if (!isNightShift) {
      setShiftDate(today);
    } else if (shiftDate !== today && shiftDate !== yesterday) {
      setShiftDate(today);
    }
  }, [isNightShift, today, yesterday, shiftDate]);

  // Dynamically retrieve the employee's assigned ports from the database.
  useEffect(() => {
    const trimmed = code.trim();
    setError(null);
    setNotice(null);

    if (!trimmed) {
      setEmpInfo(null);
      setAssignedPorts([]);
      setSelectedPortId('');
      setLookupState('idle');
      return;
    }

    const timer = window.setTimeout(async () => {
      await fetchEmployeePorts(trimmed);
    }, 250);

    return () => window.clearTimeout(timer);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [code]);

  async function fetchEmployeePorts(empCode: string) {
    const trimmed = empCode.trim();
    if (!trimmed) return;
    setLookupState('loading');
    try {
      const res = await api<EmployeePortsLookupResponse>(
        `/auth/employee-ports/${encodeURIComponent(trimmed)}`,
        {},
        false,
      );
      setEmpInfo(res.employee);
      setAssignedPorts(res.points);
      setLookupState('loaded');

      const validForShift = res.points.filter(
        (p) => !p.shift_kinds || p.shift_kinds.includes(shiftKind),
      );
      const list = validForShift.length > 0 ? validForShift : res.points;

      if (list.length > 0) {
        setSelectedPortId((prev) =>
          list.some((p) => p.id === prev) ? prev : list[0].id,
        );
      } else {
        setSelectedPortId('');
      }
    } catch (err) {
      setEmpInfo(null);
      setAssignedPorts([]);
      setSelectedPortId('');
      if (err instanceof HttpError && err.status === 404) {
        setLookupState('not_found');
      } else {
        setLookupState('idle');
      }
    }
  }

  const availablePorts = assignedPorts.filter(
    (p) => !p.shift_kinds || p.shift_kinds.includes(shiftKind),
  );

  useEffect(() => {
    if (availablePorts.length === 0) {
      setSelectedPortId('');
      return;
    }
    if (!availablePorts.some((p) => p.id === selectedPortId)) {
      setSelectedPortId(availablePorts[0].id);
    }
  }, [shiftKind, availablePorts, selectedPortId]);

  async function onSubmit(e: FormEvent) {
    e.preventDefault();
    setError(null);
    setNotice(null);

    const trimmedCode = code.trim();
    if (!trimmedCode || !password) {
      setError(ar.auth.required);
      return;
    }
    if (lookupState === 'loaded' && availablePorts.length === 0) {
      setError(ar.auth.no_ports_assigned);
      return;
    }
    if (!selectedPortId) {
      setError(ar.auth.select_port_prompt);
      return;
    }

    const effectiveDate = isNightShift ? shiftDate : today;

    setBusy(true);
    try {
      await login({
        code: trimmedCode,
        password,
        point_id: selectedPortId,
        shift_kind: shiftKind,
        shift_date: effectiveDate,
      });
      nav('/');
    } catch (err) {
      if (err instanceof HttpError) {
        if (err.apiError.code === 'BAD_CREDENTIALS') {
          setError(ar.auth.bad_creds);
        } else if (err.apiError.code === 'NO_ASSIGNED_PORTS') {
          setError(ar.auth.no_ports_assigned);
        } else if (
          err.apiError.code === 'PORT_NOT_ASSIGNED' ||
          err.apiError.code === 'SHIFT_NOT_ASSIGNED'
        ) {
          setError(ar.auth.port_not_assigned);
        } else if (err.apiError.code === 'INVALID_SHIFT_DATE') {
          setError(ar.auth.invalid_shift_date);
        } else {
          setError(err.apiError.message || ar.common.error);
        }
      } else {
        setError(ar.common.error);
      }
    } finally {
      setBusy(false);
    }
  }

  async function onCloseShift() {
    setError(null);
    setNotice(null);
    const trimmedCode = code.trim();
    if (!trimmedCode || !password) {
      setError(ar.auth.required);
      return;
    }
    if (!selectedPortId) {
      setError(ar.auth.select_port_prompt);
      return;
    }

    const effectiveDate = isNightShift ? shiftDate : today;

    setBusy(true);
    try {
      const res = await api<{ summary: ShiftCloseSummary }>('/auth/close-shift', {
        method: 'POST',
        body: JSON.stringify({
          code: trimmedCode,
          password,
          point_id: selectedPortId,
          shift_kind: shiftKind,
          shift_date: effectiveDate,
        }),
      });
      setNotice(ar.auth.shift_closed_ok);
      if (res.summary) {
        setShiftCloseSummary(res.summary);
      }
    } catch (err) {
      if (err instanceof HttpError) {
        if (err.apiError.code === 'BAD_CREDENTIALS') {
          setError(ar.auth.bad_creds);
        } else if (err.apiError.code === 'PORT_NOT_ASSIGNED') {
          setError(ar.auth.port_not_assigned);
        } else if (err.apiError.code === 'SHIFT_NOT_FOUND') {
          setError(ar.auth.shift_not_found);
        } else if (err.apiError.code === 'INVALID_SHIFT_DATE') {
          setError(ar.auth.invalid_shift_date);
        } else {
          setError(err.apiError.message);
        }
      } else {
        setError(ar.common.error);
      }
    } finally {
      setBusy(false);
    }
  }

  function onReset() {
    setCode('');
    setPassword('');
    setEmpInfo(null);
    setAssignedPorts([]);
    setSelectedPortId('');
    setLookupState('idle');
    setShiftKind(1);
    setShiftDate(today);
    setError(null);
    setNotice(null);
  }

  const canSubmit =
    !busy &&
    code.trim().length > 0 &&
    password.length > 0 &&
    Boolean(selectedPortId) &&
    availablePorts.length > 0;

  return (
    <div style={{
      minHeight: '100vh',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      padding: '24px 16px',
      background: 'linear-gradient(180deg, #14516B 0%, #0b3344 100%)',
    }}>
      {shiftCloseSummary && (
        <ShiftCloseModal
          summary={shiftCloseSummary}
          onBack={() => setShiftCloseSummary(null)}
        />
      )}
      {/* Top Modern Header Banner: Title + Today's Date Pill */}
      <div style={{
        width: 480,
        maxWidth: '94vw',
        marginBottom: 14,
        padding: '14px 20px',
        borderRadius: 12,
        background: 'rgba(255, 252, 245, 0.1)',
        border: '1px solid rgba(242, 212, 144, 0.35)',
        backdropFilter: 'blur(8px)',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        gap: 12,
        color: 'white',
      }}>
        <div>
          <div style={{ fontSize: 19, fontWeight: 700, color: 'var(--bright)' }}>
            {ar.app.full_title}
          </div>
          <div style={{ fontSize: 12, color: 'rgba(255,255,255,0.75)', marginTop: 2 }}>
            {ar.app.tagline} · {ar.auth.login}
          </div>
        </div>
        <div style={{
          background: 'rgba(197, 160, 82, 0.22)',
          border: '1px solid var(--gold)',
          color: 'var(--bright)',
          padding: '6px 12px',
          borderRadius: 8,
          textAlign: 'center',
          minWidth: 110,
        }}>
          <div style={{ fontSize: 10, opacity: 0.85 }}>{ar.auth.today_label}</div>
          <div style={{ fontSize: 13, fontWeight: 700, direction: 'ltr' }}>{today}</div>
        </div>
      </div>

      {/* Main Modern Login Card */}
      <form onSubmit={onSubmit} className="card" style={{ width: 480, maxWidth: '94vw', padding: 24 }}>
        {error && <div className="msg error">{error}</div>}
        {notice && <div className="msg ok">{notice}</div>}

        {/* Employee Number + Employee Name Display Card */}
        <div style={{ marginBottom: 14 }}>
          <span className="muted" style={{ fontSize: 12, display: 'block', marginBottom: 6 }}>
            {ar.auth.code}
          </span>
          <div style={{ display: 'grid', gridTemplateColumns: '140px 1fr', gap: 10, alignItems: 'stretch' }}>
            <input
              value={code}
              onChange={(e) => setCode(e.target.value)}
              required
              autoFocus
              autoComplete="username"
              placeholder="مثال: 1001"
              style={{ fontWeight: 700, textAlign: 'center', fontSize: 15 }}
            />

            {/* Nice Modern Employee Name Display Box */}
            <div style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'space-between',
              padding: '8px 14px',
              borderRadius: 8,
              background: empInfo
                ? '#F9F5EB'
                : lookupState === 'not_found'
                  ? '#fdeaea'
                  : '#f8fafb',
              border: empInfo
                ? '1px solid var(--gold)'
                : lookupState === 'not_found'
                  ? '1px solid var(--red)'
                  : '1px solid var(--line)',
              transition: 'all 0.15s ease',
            }}>
              {lookupState === 'loading' && (
                <span className="muted" style={{ fontSize: 13 }}>{ar.common.loading}</span>
              )}
              {lookupState === 'idle' && (
                <span className="muted" style={{ fontSize: 12 }}>اسم الموظف يظهر تلقائياً</span>
              )}
              {lookupState === 'not_found' && (
                <span style={{ fontSize: 13, fontWeight: 600, color: 'var(--red)' }}>
                  {ar.auth.emp_not_found}
                </span>
              )}
              {lookupState === 'loaded' && empInfo && (
                <>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                    <span style={{
                      width: 8,
                      height: 8,
                      borderRadius: 999,
                      background: 'var(--green)',
                      display: 'inline-block',
                    }} />
                    <strong style={{ color: 'var(--navy)', fontSize: 14 }}>
                      {empInfo.name}
                    </strong>
                  </div>
                  <span style={{
                    fontSize: 11,
                    fontWeight: 600,
                    padding: '2px 8px',
                    borderRadius: 999,
                    background: 'var(--navy)',
                    color: 'white',
                  }}>
                    {empInfo.role}
                  </span>
                </>
              )}
            </div>
          </div>
        </div>

        {/* Password */}
        <label style={{ display: 'block', marginBottom: 14 }}>
          <span className="muted" style={{ fontSize: 12, display: 'block', marginBottom: 6 }}>
            {ar.auth.password}
          </span>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            autoComplete="current-password"
          />
        </label>

        {/* Shift & Working Date side-by-side */}
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12, marginBottom: 14 }}>
          <label style={{ display: 'block' }}>
            <span className="muted" style={{ fontSize: 12, display: 'block', marginBottom: 6 }}>
              {ar.auth.shift}
            </span>
            <select
              value={shiftKind}
              onChange={(e) => setShiftKind(Number(e.target.value))}
            >
              <option value={1}>{ar.auth.shifts[1]}</option>
              <option value={2}>{ar.auth.shifts[2]}</option>
              <option value={3}>{ar.auth.shifts[3]}</option>
            </select>
          </label>

          <label style={{ display: 'block' }}>
            <span className="muted" style={{ fontSize: 12, display: 'block', marginBottom: 6 }}>
              {ar.auth.date}
            </span>
            {isNightShift ? (
              <select
                value={shiftDate}
                onChange={(e) => setShiftDate(e.target.value)}
                style={{ borderColor: 'var(--gold)', background: '#F9F5EB', fontWeight: 600 }}
              >
                <option value={today}>{today} — {ar.auth.today_label}</option>
                <option value={yesterday}>{yesterday} — {ar.auth.yesterday_night_label}</option>
              </select>
            ) : (
              <input
                type="text"
                value={today}
                readOnly
                disabled
                style={{
                  background: '#f5f7f8',
                  color: 'var(--ink)',
                  fontWeight: 600,
                  direction: 'ltr',
                  textAlign: 'center',
                  cursor: 'not-allowed',
                }}
              />
            )}
          </label>
        </div>

        {isNightShift && (
          <div style={{
            fontSize: 12,
            color: 'var(--amber)',
            background: '#FFF9EB',
            border: '1px solid #F2D490',
            borderRadius: 8,
            padding: '6px 10px',
            marginBottom: 14,
          }}>
            {ar.auth.night_shift_date_hint}
          </div>
        )}

        {/* Assigned Ports (منافذ العمل المخصصة للموظف) */}
        <div style={{ marginBottom: 18 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 6 }}>
            <span className="muted" style={{ fontSize: 12 }}>
              {ar.auth.assigned_ports}
            </span>
            {lookupState === 'loaded' && availablePorts.length > 0 && (
              <span style={{
                fontSize: 11,
                fontWeight: 600,
                color: 'var(--navy)',
                background: '#EBF3F5',
                padding: '2px 8px',
                borderRadius: 999,
              }}>
                {availablePorts.length} منافذ متاحة
              </span>
            )}
          </div>

          {lookupState === 'idle' && (
            <div className="muted" style={{
              fontSize: 12,
              padding: '10px 12px',
              background: '#f8fafb',
              border: '1px dashed var(--line)',
              borderRadius: 8,
              textAlign: 'center',
            }}>
              {ar.auth.enter_emp_prompt}
            </div>
          )}

          {lookupState === 'loading' && (
            <div className="muted" style={{ fontSize: 12, padding: '10px 0', textAlign: 'center' }}>
              {ar.common.loading}
            </div>
          )}

          {lookupState === 'not_found' && (
            <div className="msg error" style={{ marginBottom: 0, fontSize: 13 }}>
              {ar.auth.emp_not_found}
            </div>
          )}

          {lookupState === 'loaded' && availablePorts.length === 0 && (
            <div className="msg error" style={{ marginBottom: 0, fontSize: 13 }}>
              {ar.auth.no_ports_assigned}
            </div>
          )}

          {lookupState === 'loaded' && availablePorts.length > 0 && (
            <div style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fill, minmax(135px, 1fr))',
              gap: 8,
            }}>
              {availablePorts.map((pt) => {
                const isSelected = pt.id === selectedPortId;
                return (
                  <button
                    key={pt.id}
                    type="button"
                    onClick={() => setSelectedPortId(pt.id)}
                    className="btn"
                    style={{
                      flexDirection: 'column',
                      alignItems: 'flex-start',
                      padding: '10px 12px',
                      borderColor: isSelected ? 'var(--navy)' : 'var(--line)',
                      background: isSelected ? '#F9F5EB' : 'white',
                      boxShadow: isSelected ? '0 0 0 2px #14516B22' : 'none',
                    }}
                  >
                    <span style={{
                      fontSize: 11,
                      color: isSelected ? 'var(--gold)' : 'var(--muted)',
                      fontWeight: 700,
                    }}>
                      منفذ #{pt.code}
                    </span>
                    <span style={{
                      fontSize: 13,
                      color: 'var(--navy)',
                      fontWeight: 700,
                      marginTop: 2,
                      textAlign: 'right',
                    }}>
                      {pt.name}
                    </span>
                  </button>
                );
              })}
            </div>
          )}
        </div>

        {/* Action Buttons Row: دخول | غلق الوردية | خروج */}
        <div style={{ display: 'grid', gridTemplateColumns: '1.3fr 1fr auto', gap: 10 }}>
          <button
            type="submit"
            className="btn gold"
            disabled={!canSubmit}
            style={{ justifyContent: 'center' }}
          >
            {busy ? ar.common.loading : ar.auth.submit}
          </button>

          <button
            type="button"
            className="btn primary"
            disabled={!canSubmit}
            onClick={onCloseShift}
            style={{ justifyContent: 'center' }}
          >
            {ar.auth.close_shift}
          </button>

          <button
            type="button"
            className="btn"
            onClick={onReset}
            style={{ justifyContent: 'center' }}
          >
            {ar.auth.exit}
          </button>
        </div>
      </form>
    </div>
  );
}
