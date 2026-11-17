import pg from 'pg';

const { Pool, types } = pg;

// Keep PostgreSQL DATE columns (OID 1082, e.g. shift_date, inv_date) as exact
// 'YYYY-MM-DD' strings rather than JS Date objects that shift by UTC offset on JSON serialization.
types.setTypeParser(1082, (val) => val);

export const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  max: 10,
  idleTimeoutMillis: 30_000,
});

pool.on('error', (err) => {
  console.error('[pg] idle client error', err);
});

export async function query(text, params) {
  return pool.query(text, params);
}

export async function withTx(fn) {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const result = await fn(client);
    await client.query('COMMIT');
    return result;
  } catch (err) {
    await client.query('ROLLBACK');
    throw err;
  } finally {
    client.release();
  }
}
