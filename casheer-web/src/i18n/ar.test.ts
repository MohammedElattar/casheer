import { describe, it, expect } from 'vitest';
import { ar } from './ar';

describe('i18n/ar', () => {
  it('has all primary namespaces', () => {
    expect(ar.app.name).toBe('المحروسة');
    expect(ar.auth.login).toBeTruthy();
    expect(ar.pos.total).toBeTruthy();
    expect(ar.invoice.status.PAID).toBe('مسددة');
  });

  it('every string is RTL-readable (Arabic or space-only)', () => {
    function walk(v: unknown): string[] {
      if (typeof v === 'string') return [v];
      if (v && typeof v === 'object') return Object.values(v as Record<string, unknown>).flatMap(walk);
      return [];
    }
    const strings = walk(ar).filter((s) => s && typeof s === 'string');
    for (const s of strings) {
      // Each non-empty string should contain at least one Arabic codepoint OR be purely Latin (keys with numbers etc.).
      const hasArabic = /[؀-ۿ]/.test(s);
      const latinOnly = /^[\w\s()%./\-:]+$/.test(s);
      expect(hasArabic || latinOnly, `not RTL-ready: "${s}"`).toBe(true);
    }
  });
});
