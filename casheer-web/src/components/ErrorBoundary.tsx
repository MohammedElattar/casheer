import React from 'react';
import { ar } from '@/i18n/ar';

interface State {
  error: Error | null;
}

export class ErrorBoundary extends React.Component<{ children: React.ReactNode }, State> {
  state: State = { error: null };

  static getDerivedStateFromError(error: Error): State {
    return { error };
  }

  render() {
    if (this.state.error) {
      return (
        <div style={{ padding: 32, maxWidth: 640, margin: '48px auto' }} className="card">
          <h2 style={{ marginTop: 0, color: 'var(--red)' }}>{ar.common.error}</h2>
          <p className="muted">{this.state.error.message}</p>
          <button
            className="btn primary"
            onClick={() => {
              this.setState({ error: null });
              window.location.reload();
            }}
          >
            {ar.common.retry}
          </button>
        </div>
      );
    }
    return this.props.children;
  }
}
