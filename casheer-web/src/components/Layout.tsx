import type { ReactNode } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import { ar } from '@/i18n/ar';

const NAV = [
  { to: '/',         label: ar.nav.pos },
  { to: '/invoices', label: ar.nav.invoices },
  { to: '/items',    label: ar.nav.items },
  { to: '/reports',  label: ar.nav.reports },
];

export function Layout({ children }: { children: ReactNode }) {
  const { user, logout } = useAuth();
  const loc = useLocation();
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
          {NAV.map(({ to, label }) => {
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
          <div className="muted" style={{ color: '#ffffff99' }}>
            {user?.code} · {user?.role}
          </div>
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
