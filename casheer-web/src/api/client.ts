// Fetch wrapper with JWT access token in memory + httpOnly refresh cookie (P0-1)
// with fallback support for refresh token in localStorage.

export interface ApiError {
  code: string;
  message: string;
  details?: unknown;
}

let accessToken: string | null = null;

const REFRESH_KEY = 'casheer:refresh';

export function getAccess()   { return accessToken; }
export function setAccess(t: string | null) { accessToken = t; }
export function getRefresh()  { return localStorage.getItem(REFRESH_KEY); }
export function setRefresh(t: string | null | undefined) {
  if (t) localStorage.setItem(REFRESH_KEY, t);
  else   localStorage.removeItem(REFRESH_KEY);
}

export function logoutLocal() {
  setAccess(null);
  setRefresh(null);
}

export async function refreshOnce(): Promise<boolean> {
  const rt = getRefresh();
  try {
    const r = await fetch('/api/v1/auth/refresh', {
      method: 'POST',
      credentials: 'include',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(rt ? { refresh: rt } : {}),
    });
    if (!r.ok) { logoutLocal(); return false; }
    const j = await r.json();
    setAccess(j.access);
    if (j.refresh) setRefresh(j.refresh);
    return true;
  } catch {
    logoutLocal();
    return false;
  }
}

export class HttpError extends Error {
  constructor(public status: number, public apiError: ApiError) {
    super(apiError.message);
  }
}

export async function api<T>(
  path: string,
  init: RequestInit = {},
  _retry = true,
): Promise<T> {
  const headers = new Headers(init.headers);
  if (!headers.has('Content-Type') && init.body && typeof init.body === 'string') {
    headers.set('Content-Type', 'application/json');
  }
  if (accessToken) headers.set('Authorization', `Bearer ${accessToken}`);

  const r = await fetch(`/api/v1${path}`, {
    ...init,
    headers,
    credentials: 'include',
  });
  if (r.status === 401 && _retry && (await refreshOnce())) {
    return api<T>(path, init, false);
  }
  const text = await r.text();
  const parsed = text ? JSON.parse(text) : null;
  if (!r.ok) {
    const err: ApiError = parsed?.error ?? { code: 'UNKNOWN', message: r.statusText };
    throw new HttpError(r.status, err);
  }
  return parsed as T;
}
