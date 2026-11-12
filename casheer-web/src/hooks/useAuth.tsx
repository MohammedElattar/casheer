import { createContext, useContext, useEffect, useState, type ReactNode } from 'react';
import { api, setAccess, setRefresh, getRefresh, logoutLocal } from '@/api/client';
import type { Employee, LoginResponse } from '@/types';

interface AuthCtx {
  user: Employee | null;
  loading: boolean;
  login: (code: string, password: string) => Promise<void>;
  logout: () => Promise<void>;
}

const Ctx = createContext<AuthCtx | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<Employee | null>(null);
  const [loading, setLoading] = useState(true);

  // Bootstrap: if a refresh token exists, try to get /me.
  useEffect(() => {
    (async () => {
      if (!getRefresh()) { setLoading(false); return; }
      try {
        const me = await api<{ user: { sub: string; code: string; role: Employee['role'] } }>(
          '/auth/me',
        );
        setUser({ id: me.user.sub, code: me.user.code, name: '', role: me.user.role });
      } catch {
        logoutLocal();
      } finally {
        setLoading(false);
      }
    })();
  }, []);

  async function login(code: string, password: string) {
    const r = await api<LoginResponse>('/auth/login', {
      method: 'POST',
      body: JSON.stringify({ code, password }),
    });
    setAccess(r.access);
    setRefresh(r.refresh);
    setUser(r.employee);
  }

  async function logout() {
    try { await api('/auth/logout', { method: 'POST' }); } catch { /* ignore */ }
    logoutLocal();
    setUser(null);
  }

  return <Ctx.Provider value={{ user, loading, login, logout }}>{children}</Ctx.Provider>;
}

export function useAuth() {
  const ctx = useContext(Ctx);
  if (!ctx) throw new Error('useAuth must be used inside <AuthProvider>');
  return ctx;
}
