import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import puppeteer from 'puppeteer';
import { getInvoice } from './invoice.service.js';
import { query } from '../db/pool.js';

const here = dirname(fileURLToPath(import.meta.url));
const TPL_DIR = join(here, '..', 'templates');

const templateHtml = readFileSync(join(TPL_DIR, 'receipt.html'), 'utf8');
const templateCss  = readFileSync(join(TPL_DIR, 'receipt.css'),  'utf8');

// Tiny Mustache-ish renderer. Supports {{var}} and {{#section}}...{{/section}}.
// Section renders each array item as a sub-context, or renders the block
// unchanged if the value is truthy scalar. Non-truthy values hide the block.
function render(tpl, ctx) {
  // Sections first.
  let out = tpl.replace(/\{\{#(\w+)\}\}([\s\S]*?)\{\{\/\1\}\}/g, (_, key, body) => {
    const v = ctx[key];
    if (Array.isArray(v)) return v.map((item) => render(body, { ...ctx, ...item })).join('');
    if (!v && v !== 0) return '';
    return render(body, ctx);
  });
  // Variables.
  out = out.replace(/\{\{(\w+)\}\}/g, (_, k) => {
    const v = ctx[k];
    if (v == null) return '';
    return String(v).replace(/[<>&]/g, (c) => ({ '<': '&lt;', '>': '&gt;', '&': '&amp;' }[c]));
  });
  return out;
}

async function loadContext(invoice_id, { brand_name = 'المحروسة' } = {}) {
  const { invoice, lines } = await getInvoice(invoice_id);
  const { rows: pointRows } = await query(
    `SELECT name FROM points WHERE id = $1`, [invoice.point_id],
  );
  const { rows: empRows } = await query(
    `SELECT name FROM employees WHERE id = $1`, [invoice.employee_id],
  );
  const d = new Date(invoice.created_at);
  const pad = (n) => String(n).padStart(2, '0');
  return {
    brand_name,
    point_name:    pointRows[0]?.name  || '',
    cashier_name:  empRows[0]?.name    || '',
    display_number: invoice.ser_no ?? invoice.serial_no,
    serial_no:     invoice.serial_no,
    inv_date:      invoice.inv_date,
    inv_time:      `${pad(d.getHours())}:${pad(d.getMinutes())}`,
    table_no:      invoice.table_no,
    person_count:  invoice.person_count,
    service_percent: Number(invoice.service_percent),
    discount_percent: Number(invoice.discount_percent),
    service_amount:   Number(invoice.service_amount)  || null,
    discount_amount:  Number(invoice.discount_amount) || null,
    subtotal:      Number(invoice.subtotal).toFixed(2),
    total:         Number(invoice.total).toFixed(2),
    lines: lines.map((l) => ({
      item_name:  l.item_name,
      qty:        Number(l.qty),
      unit_price: Number(l.unit_price).toFixed(2),
      line_total: Number(l.line_total).toFixed(2),
    })),
    footer_line_1: '',
  };
}

let _browser = null;
async function getBrowser() {
  if (_browser) return _browser;
  _browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
    executablePath: process.env.PUPPETEER_EXECUTABLE_PATH || undefined,
  });
  return _browser;
}

export async function renderInvoicePdf(invoice_id) {
  const ctx = await loadContext(invoice_id);
  const html = render(templateHtml, ctx)
    .replace('<link rel="stylesheet" href="receipt.css" />',
             `<style>${templateCss}</style>`);
  const browser = await getBrowser();
  const page = await browser.newPage();
  try {
    await page.emulateMediaType('print');
    await page.setContent(html, { waitUntil: 'networkidle0' });
    const pdf = await page.pdf({
      width: '80mm',
      printBackground: true,
      preferCSSPageSize: true,
    });
    return pdf;
  } finally {
    await page.close();
  }
}

export async function shutdown() {
  if (_browser) { await _browser.close(); _browser = null; }
}
