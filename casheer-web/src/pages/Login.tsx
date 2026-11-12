import { useState, type FormEvent } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import { HttpError } from '@/api/client';
import { ar } from '@/i18n/ar';

export function LoginPage() {
  const nav = useNavigate();
  const { login } = useAuth();
  const [code, setCode] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);

  async function onSubmit(e: FormEvent) {
    e.preventDefault();
    setError(null);
    setBusy(true);
    try {
      await login(code.trim(), password);
      nav('/');
    } catch (err) {
      if (err instanceof HttpError && err.apiError.code === 'BAD_CREDENTIALS') {
        setError(ar.auth.bad_creds);
      } else {
        setError(ar.common.error);
      }
    } finally {
      setBusy(false);
    }
  }

  return (
    <div style={{
      minHeight: '100vh', display: 'grid', placeItems: 'center',
      background: 'linear-gradient(180deg, #14516B 0%, #0b3344 100%)',
    }}>
      <form onSubmit={onSubmit} className="card" style={{ width: 380, maxWidth: '90vw' }}>
        <h1 style={{ marginTop: 0, color: 'var(--navy)' }}>{ar.app.name}</h1>
        <p className="muted" style={{ marginTop: 0 }}>{ar.auth.login}</p>

        {error && <div className="msg error">{error}</div>}

        <label style={{ display: 'block', marginBottom: 12 }}>
          <span className="muted" style={{ fontSize: 12 }}>{ar.auth.code}</span>
          <input
            value={code}
            onChange={(e) => setCode(e.target.value)}
            required
            autoFocus
            autoComplete="username"
          />
        </label>

        <label style={{ display: 'block', marginBottom: 16 }}>
          <span className="muted" style={{ fontSize: 12 }}>{ar.auth.password}</span>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            autoComplete="current-password"
          />
        </label>

        <button type="submit" className="btn gold" disabled={busy} style={{ width: '100%' }}>
          {busy ? ar.common.loading : ar.auth.submit}
        </button>
      </form>
    </div>
  );
}
