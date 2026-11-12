import { readdirSync, readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { pool } from './pool.js';

const here = dirname(fileURLToPath(import.meta.url));
const MIG_DIR = join(here, '..', '..', 'sql', 'migrations');

async function ensureTable() {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS _migrations (
      name       TEXT PRIMARY KEY,
      applied_at TIMESTAMPTZ NOT NULL DEFAULT now()
    )
  `);
}

async function applied() {
  const { rows } = await pool.query('SELECT name FROM _migrations ORDER BY name');
  return new Set(rows.map((r) => r.name));
}

async function main() {
  await ensureTable();
  const done = await applied();
  const files = readdirSync(MIG_DIR).filter((f) => f.endsWith('.sql')).sort();
  for (const f of files) {
    if (done.has(f)) {
      console.log(`[migrate] skip ${f}`);
      continue;
    }
    const sql = readFileSync(join(MIG_DIR, f), 'utf8');
    console.log(`[migrate] apply ${f}`);
    const client = await pool.connect();
    try {
      await client.query('BEGIN');
      await client.query(sql);
      await client.query('INSERT INTO _migrations (name) VALUES ($1)', [f]);
      await client.query('COMMIT');
    } catch (err) {
      await client.query('ROLLBACK');
      console.error(`[migrate] FAIL ${f}:`, err.message);
      process.exit(1);
    } finally {
      client.release();
    }
  }
  await pool.end();
  console.log('[migrate] done');
}

main();
