import type { ReactNode } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import { ar } from '@/i18n/ar';

export function Layout({ children }: { children: ReactNode }) {
  const { user, point, shift, logout } = useAuth();
  const loc = useLocation();

  // Only ADMIN or Takeaway Pizza port (code === 5) sees the Items catalog in navigation
  const canAccessItems = user?.role === 'ADMIN' || point?.code === 5 || user?.code === '1005';

  const navItems = [
    { to: '/',         label: ar.nav.pos },
    { to: '/invoices', label: ar.nav.invoices },
    ...(canAccessItems ? [{ to: '/items', label: ar.nav.items }] : []),
    { to: '/reports',  label: ar.nav.reports },
    ...(user?.role === 'ADMIN' ? [{ to: '/settings', label: ar.nav.settings }] : []),
  ];

  return (
    <div className="app">
      <aside style={{
        background: 'var(--navy)', color: 'white',
        display: 'flex', flexDirection: 'column', minHeight: '100vh',
      }}>
        <div style={{ padding: '26px 22px', borderBottom: '1px solid #ffffff14' }}>
          <strong style={{ color: 'var(--bright)', fontSize: 20 }}>{ar.app.name}</strong>
          <div style={{ fontSize: 10, letterSpacing: 2, marginTop: 4, opacity: 0.6 }}>
            {ar.app.tagline}
          </div>
        </div>
        <nav style={{ padding: 12, flex: 1 }}>
          {navItems.map(({ to, label }) => {
            const active = loc.pathname === to;
            return (
              <Link
                key={to}
                to={to}
                style={{
                  display: 'block',
                  padding: '10px 14px',
                  margin: '2px 0',
                  borderRadius: 8,
                  color: active ? 'var(--navy)' : 'white',
                  background: active ? 'var(--bright)' : 'transparent',
                  textDecoration: 'none',
                  fontWeight: 600,
                }}
              >
                {label}
              </Link>
            );
          })}
        </nav>
        <div style={{ padding: 16, borderTop: '1px solid #ffffff14', fontSize: 12 }}>
          <div style={{ fontWeight: 700, color: '#ffffff' }}>
            {user?.name || user?.code} ({user?.code})
          </div>
          {point && (
            <div style={{ color: 'var(--bright)', marginTop: 4, fontWeight: 600 }}>
              {ar.auth.port}: {point.name} (#{point.code})
            </div>
          )}
          {shift && (
            <div style={{ color: '#ffffffb3', marginTop: 2 }}>
              {ar.auth.shift}: {ar.auth.shifts[shift.shift_kind] ?? shift.shift_kind} · {shift.shift_date.slice(0, 10)}
            </div>
          )}
          <button
            onClick={logout}
            className="btn ghost"
            style={{ color: 'var(--bright)', marginTop: 8, padding: '6px 0' }}
          >
            {ar.auth.logout}
          </button>
        </div>
      </aside>
      <main style={{ padding: 24, overflow: 'auto' }}>{children}</main>
    </div>
  );
}
