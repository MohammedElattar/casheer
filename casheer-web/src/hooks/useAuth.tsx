import { createContext, useContext, useEffect, useState, type ReactNode } from 'react';
import { api, setAccess, setRefresh, getRefresh, refreshOnce, logoutLocal } from '@/api/client';
import type { Employee, LoginResponse, Point, Shift } from '@/types';

export interface LoginInput {
  code: string;
  password: string;
  point_id: string;
  shift_kind: number;
  shift_date: string;
}

interface AuthCtx {
  user: Employee | null;
  point: Point | null;
  shift: Shift | null;
  assignedPoints: Point[];
  loading: boolean;
  login: (input: LoginInput) => Promise<void>;
  logout: () => Promise<void>;
  setSessionShift: (shift: Shift | null) => void;
  setSessionPoint: (point: Point | null) => void;
}

const Ctx = createContext<AuthCtx | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser]                     = useState<Employee | null>(null);
  const [point, setPoint]                   = useState<Point | null>(null);
  const [shift, setShift]                   = useState<Shift | null>(null);
  const [assignedPoints, setAssignedPoints] = useState<Point[]>([]);
  const [loading, setLoading]               = useState(true);

  // Bootstrap: restore session via httpOnly refresh cookie or stored token.
  useEffect(() => {
    (async () => {
      try {
        if (!getRefresh()) {
          const ok = await refreshOnce();
          if (!ok) { setLoading(false); return; }
        }
        const me = await api<{
          user: { sub: string; code: string; role: Employee['role'] };
          employee?: Employee;
          point?: Point | null;
          shift?: Shift | null;
          assigned_points?: Point[];
        }>('/auth/me');
        setUser(
          me.employee ?? {
            id: me.user.sub,
            code: me.user.code,
            name: '',
            role: me.user.role,
          },
        );
        setPoint(me.point ?? null);
        setShift(me.shift ?? null);
        setAssignedPoints(me.assigned_points ?? []);
      } catch {
        logoutLocal();
      } finally {
        setLoading(false);
      }
    })();
  }, []);

  async function login(input: LoginInput) {
    const r = await api<LoginResponse>('/auth/login', {
      method: 'POST',
      body: JSON.stringify(input),
    });
    setAccess(r.access);
    setRefresh(r.refresh);
    setUser(r.employee);
    setPoint(r.point);
    setShift(r.shift);
    setAssignedPoints(r.assigned_points ?? [r.point]);
  }

  async function logout() {
    try { await api('/auth/logout', { method: 'POST' }); } catch { /* ignore */ }
    logoutLocal();
    setUser(null);
    setPoint(null);
    setShift(null);
    setAssignedPoints([]);
  }

  return (
    <Ctx.Provider
      value={{
        user,
        point,
        shift,
        assignedPoints,
        loading,
        login,
        logout,
        setSessionShift: setShift,
        setSessionPoint: setPoint,
      }}
    >
      {children}
    </Ctx.Provider>
  );
}

export function useAuth() {
  const ctx = useContext(Ctx);
  if (!ctx) throw new Error('useAuth must be used inside <AuthProvider>');
  return ctx;
}
