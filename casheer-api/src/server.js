import { createApp } from './app.js';
import { pool } from './db/pool.js';
import { shutdown as closePuppeteer } from './services/print.service.js';

const port = Number(process.env.PORT || 3000);
const app = createApp();

const server = app.listen(port, () => {
  console.log(`[casheer-api] listening on :${port}`);
});

async function stop() {
  console.log('[casheer-api] shutting down');
  server.close();
  await closePuppeteer().catch(() => {});
  await pool.end().catch(() => {});
  process.exit(0);
}

process.on('SIGINT',  stop);
process.on('SIGTERM', stop);
