import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import puppeteer from 'puppeteer';
import { getInvoice } from './invoice.service.js';
import { getShiftCloseSummary } from './shift-report.service.js';
import { query } from '../db/pool.js';

const here = dirname(fileURLToPath(import.meta.url));
const TPL_DIR = join(here, '..', 'templates');

const templateHtml = readFileSync(join(TPL_DIR, 'receipt.html'), 'utf8');
const templateCss  = readFileSync(join(TPL_DIR, 'receipt.css'),  'utf8');

function escapeHtml(s) {
  if (s == null) return '';
  return String(s).replace(/[<>&]/g, (c) => ({ '<': '&lt;', '>': '&gt;', '&': '&amp;' }[c]));
}

// Tiny Mustache-ish renderer. Supports {{var}} and {{#section}}...{{/section}}.
function render(tpl, ctx) {
  let out = tpl.replace(/\{\{#(\w+)\}\}([\s\S]*?)\{\{\/\1\}\}/g, (_, key, body) => {
    const v = ctx[key];
    if (Array.isArray(v)) return v.map((item) => render(body, { ...ctx, ...item })).join('');
    if (!v && v !== 0) return '';
    return render(body, ctx);
  });
  out = out.replace(/\{\{(\w+)\}\}/g, (_, k) => {
    const v = ctx[k];
    if (v == null) return '';
    return escapeHtml(v);
  });
  return out;
}

const CLIENT_LABELS = {
  CIVILIAN: 'مدني',
  MEMBER:   'مشترك (عضو الدار)',
  GUEST:    'نزيل فندق (تحويل للريسبشن)',
};

async function loadContext(invoice_id, { brand_name = 'دار القوات البحرية - المحروسة' } = {}) {
  const { invoice, lines } = await getInvoice(invoice_id);
  const { rows: pointRows } = await query(
    `SELECT name FROM points WHERE id = $1`, [invoice.point_id],
  );
  const { rows: empRows } = await query(
    `SELECT name FROM employees WHERE id = $1`, [invoice.employee_id],
  );
  const d = new Date(invoice.created_at);
  const pad = (n) => String(n).padStart(2, '0');
  const clientType = invoice.client_type || 'CIVILIAN';
  return {
    brand_name,
    point_name:       pointRows[0]?.name  || '',
    cashier_name:     empRows[0]?.name    || '',
    display_number:   invoice.ser_no ?? invoice.serial_no,
    serial_no:        invoice.serial_no,
    inv_date:         String(invoice.inv_date).slice(0, 10),
    inv_time:         `${pad(d.getHours())}:${pad(d.getMinutes())}`,
    table_no:         invoice.table_no,
    person_count:     invoice.person_count,
    client_type_label: CLIENT_LABELS[clientType] || 'مدني',
    mem_name:         invoice.mem_name || null,
    mem_id:           invoice.mem_id || null,
    mem_bar:          invoice.mem_bar || null,
    room_no:          invoice.room_no || null,
    h_no:             invoice.h_no || null,
    guest_name:       invoice.guest_name || null,
    service_percent:  Number(invoice.service_percent),
    discount_percent: Number(invoice.discount_percent),
    service_amount:   Number(invoice.service_amount)  > 0 ? Number(invoice.service_amount).toFixed(2)  : null,
    discount_amount:  Number(invoice.discount_amount) > 0 ? Number(invoice.discount_amount).toFixed(2) : null,
    subtotal:         Number(invoice.subtotal).toFixed(2),
    total:            Number(invoice.total).toFixed(2),
    lines: lines.map((l) => ({
      item_name:  l.item_name,
      qty:        Number(l.qty),
      unit_price: Number(l.unit_price).toFixed(2),
      line_total: Number(l.line_total).toFixed(2),
    })),
    footer_line_1: clientType === 'GUEST'
      ? `تم ترحيل الفاتورة إلى حساب غرفة (${invoice.room_no}) بالريسبشن`
      : '',
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

async function htmlToPdf(html, formatOptions = { width: '80mm' }) {
  const browser = await getBrowser();
  const page = await browser.newPage();
  try {
    await page.emulateMediaType('print');
    await page.setContent(html, { waitUntil: 'networkidle0' });
    const pdf = await page.pdf({
      printBackground: true,
      preferCSSPageSize: true,
      ...formatOptions,
    });
    return pdf;
  } finally {
    await page.close();
  }
}

export async function renderInvoicePdf(invoice_id) {
  const ctx = await loadContext(invoice_id);
  const html = render(templateHtml, ctx)
    .replace('<link rel="stylesheet" href="receipt.css" />',
             `<style>${templateCss}</style>`);
  return htmlToPdf(html, { width: '80mm' });
}

/**
 * Render Shift Closing Invoices & Financial Breakdown Report (تقرير إغلاق وردية منفذ — طباعة الفواتير)
 */
export async function renderShiftInvoicesPdf(shift_id) {
  const data = await getShiftCloseSummary(shift_id);
  const { shift, employee, point, breakdown, invoices } = data;
  const nowStr = new Date().toLocaleString('ar-EG');

  const invoiceRowsHtml = invoices.length === 0
    ? `<tr><td colspan="7" style="text-align:center;padding:14px;color:#666;">لا توجد فواتير مسددة في هذه الوردية</td></tr>`
    : invoices.map((inv) => {
        const cType = inv.client_type || 'CIVILIAN';
        const cLabel = cType === 'MEMBER'
          ? `مشترك (${escapeHtml(inv.mem_name || inv.mem_bar || '')})`
          : cType === 'GUEST'
            ? `نزيل غرفة #${escapeHtml(inv.room_no)} (${escapeHtml(inv.guest_name || '')})`
            : 'مدنى';
        return `
          <tr>
            <td>${escapeHtml(inv.ser_no ?? inv.serial_no)}</td>
            <td>${cLabel}</td>
            <td>${inv.table_no ? `ترابيزة #${escapeHtml(inv.table_no)}` : '—'}</td>
            <td>${Number(inv.subtotal).toFixed(2)}</td>
            <td>+${Number(inv.service_amount).toFixed(2)}</td>
            <td>-${Number(inv.discount_amount).toFixed(2)}</td>
            <td style="font-weight:700;">${Number(inv.total).toFixed(2)}</td>
          </tr>
        `;
      }).join('');

  const html = `<!doctype html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="utf-8" />
  <title>تقرير إغلاق وردية — ${escapeHtml(point.name)}</title>
  <style>
    @page { size: A4; margin: 12mm; }
    body { font-family: 'Segoe UI', Tahoma, Arial, sans-serif; color: #0d2240; margin: 0; font-size: 13px; }
    .hdr { border-bottom: 3px solid #c5a052; padding-bottom: 10px; margin-bottom: 14px; display: flex; justify-content: space-between; align-items: center; }
    .hdr h1 { margin: 0; font-size: 20px; color: #0d2240; }
    .hdr h2 { margin: 4px 0 0; font-size: 15px; color: #8a6d2b; }
    .meta { display: grid; grid-template-columns: repeat(4, 1fr); gap: 8px; background: #f9f6ee; border: 1px solid #e2dac9; border-radius: 8px; padding: 10px 14px; margin-bottom: 16px; }
    .meta div strong { display: block; color: #0d2240; font-size: 14px; margin-top: 2px; }
    .meta div span { color: #666; font-size: 11px; }
    .grid2 { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; margin-bottom: 14px; }
    .box { border: 1px solid #c5a052; border-radius: 8px; padding: 12px; background: #fffdf9; }
    .box h3 { margin: 0 0 10px; font-size: 14px; color: #8a1c1c; border-bottom: 1px solid #e2dac9; padding-bottom: 6px; }
    .row { display: flex; justify-content: space-between; padding: 6px 0; border-bottom: 1px dashed #e2dac9; }
    .row.total { border-bottom: none; border-top: 2px solid #0d2240; margin-top: 6px; padding-top: 8px; font-weight: 700; font-size: 14px; background: #f4f1e8; padding-inline: 8px; border-radius: 4px; }
    .grand { background: #0d2240; color: white; border-radius: 8px; padding: 12px 16px; display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; border: 2px solid #c5a052; }
    .grand .val { font-size: 20px; font-weight: 800; color: #f2d490; }
    table { width: 100%; border-collapse: collapse; margin-top: 8px; font-size: 12px; }
    th, td { border: 1px solid #d5cfc0; padding: 6px 8px; text-align: right; }
    th { background: #f4f1e8; color: #0d2240; }
    .sigs { display: flex; justify-content: space-between; margin-top: 28px; padding-top: 12px; border-top: 1px solid #ccc; font-weight: 600; }
  </style>
</head>
<body>
  <div class="hdr">
    <div>
      <h1>دار القوات البحرية — المحروسة</h1>
      <h2>نموذج إغلاق وردية منفذ (تقرير الفواتير والإجماليات)</h2>
    </div>
    <div style="text-align:left;font-size:11px;color:#555;">
      <div>تاريخ الطباعة: ${escapeHtml(nowStr)}</div>
      <div>حالة الوردية: ${shift.closed_at ? 'مغلقة' : 'مفتوحة'}</div>
    </div>
  </div>

  <div class="meta">
    <div><span>المنفذ</span><strong>${escapeHtml(point.name)} (#${escapeHtml(point.code)})</strong></div>
    <div><span>الكاشير / الموظف</span><strong>${escapeHtml(employee.name)} (${escapeHtml(employee.code)})</strong></div>
    <div><span>الوردية</span><strong>${escapeHtml(shift.shift_name)}</strong></div>
    <div><span>تاريخ الوردية</span><strong>${escapeHtml(shift.shift_date)}</strong></div>
  </div>

  <div class="grid2">
    <div class="box">
      <h3>إجمالي الفواتير النقدية (Cash / POS)</h3>
      <div class="row">
        <span>المدنى (${breakdown.civilian.count} فاتورة):</span>
        <strong>${breakdown.civilian.total} ج.م</strong>
      </div>
      <div class="row">
        <span>المشترك (${breakdown.member.count} فاتورة):</span>
        <strong>${breakdown.member.total} ج.م</strong>
      </div>
      <div class="row total">
        <span>إجمالي الفواتير النقدية (${breakdown.cash_total.count} فاتورة):</span>
        <span>${breakdown.cash_total.total} ج.م</span>
      </div>
    </div>

    <div class="box">
      <h3>إجمالي الفواتير الآجلة (غرف الفندق / الريسبشن)</h3>
      <div class="row">
        <span>النزيل — نزلاء الفندق (${breakdown.guest.count} فاتورة):</span>
        <strong>${breakdown.guest.total} ج.م</strong>
      </div>
      <div class="row">
        <span>حالة الترحيل:</span>
        <span>مرحّلة لحساب الغرف بالريسبشن</span>
      </div>
      <div class="row total">
        <span>إجمالي الفواتير الآجلة (${breakdown.deferred_total.count} فاتورة):</span>
        <span>${breakdown.deferred_total.total} ج.م</span>
      </div>
    </div>
  </div>

  <div class="grand">
    <div>
      <div style="font-size:15px;font-weight:700;">الإجمالي العام للوردية (${breakdown.grand_total.count} فاتورة مسددة)</div>
      <div style="font-size:11px;opacity:0.85;margin-top:3px;">
        المجموع الفرعي: ${breakdown.grand_total.subtotal} ج.م | خدمة (12%): +${breakdown.grand_total.service_amount} ج.م | الخصم: -${breakdown.grand_total.discount_amount} ج.م
      </div>
    </div>
    <div class="val">${breakdown.grand_total.total} ج.م</div>
  </div>

  <h3 style="margin:0 0 6px;">بيان الفواتير التفصيلي للوردية</h3>
  <table>
    <thead>
      <tr>
        <th>رقم الإيصال</th>
        <th>نوع العميل والبيان</th>
        <th>الترابيزة</th>
        <th>المجموع</th>
        <th>الخدمة (12%)</th>
        <th>الخصم</th>
        <th>الصافي</th>
      </tr>
    </thead>
    <tbody>
      ${invoiceRowsHtml}
    </tbody>
  </table>

  <div class="sigs">
    <div>توقيع الكاشير: ${escapeHtml(employee.name)} ........................</div>
    <div>توقيع مشرف الوردية / المراجع: ........................</div>
  </div>
</body>
</html>`;

  return htmlToPdf(html, { format: 'A4' });
}

/**
 * Render Shift Dispensed Items Report (بيان الأصناف المنصرفة بالوردية — طباعة الأصناف)
 */
export async function renderShiftItemsPdf(shift_id) {
  const data = await getShiftCloseSummary(shift_id);
  const { shift, employee, point, breakdown, items_dispensed, items_total_qty, items_subtotal } = data;
  const nowStr = new Date().toLocaleString('ar-EG');

  const itemRowsHtml = items_dispensed.length === 0
    ? `<tr><td colspan="6" style="text-align:center;padding:14px;color:#666;">لا توجد أصناف منصرفة في هذه الوردية</td></tr>`
    : items_dispensed.map((it) => `
        <tr>
          <td>${escapeHtml(it.item_code)}</td>
          <td style="font-weight:600;">${escapeHtml(it.item_name)}</td>
          <td>${escapeHtml(it.type_name)}</td>
          <td style="text-align:center;font-weight:700;">${escapeHtml(it.qty_sold)}</td>
          <td>${escapeHtml(it.unit_price)} ج.م</td>
          <td style="font-weight:700;">${escapeHtml(it.total_sold)} ج.م</td>
        </tr>
      `).join('');

  const html = `<!doctype html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="utf-8" />
  <title>بيان الأصناف المنصرفة بالوردية — ${escapeHtml(point.name)}</title>
  <style>
    @page { size: A4; margin: 12mm; }
    body { font-family: 'Segoe UI', Tahoma, Arial, sans-serif; color: #0d2240; margin: 0; font-size: 13px; }
    .hdr { border-bottom: 3px solid #c5a052; padding-bottom: 10px; margin-bottom: 14px; display: flex; justify-content: space-between; align-items: center; }
    .hdr h1 { margin: 0; font-size: 20px; color: #0d2240; }
    .hdr h2 { margin: 4px 0 0; font-size: 15px; color: #8a6d2b; }
    .meta { display: grid; grid-template-columns: repeat(4, 1fr); gap: 8px; background: #f9f6ee; border: 1px solid #e2dac9; border-radius: 8px; padding: 10px 14px; margin-bottom: 16px; }
    .meta div strong { display: block; color: #0d2240; font-size: 14px; margin-top: 2px; }
    .meta div span { color: #666; font-size: 11px; }
    table { width: 100%; border-collapse: collapse; margin-bottom: 16px; font-size: 12px; }
    th, td { border: 1px solid #d5cfc0; padding: 7px 10px; text-align: right; }
    th { background: #f4f1e8; color: #0d2240; }
    .summary { background: #f9f6ee; border: 1px solid #c5a052; border-radius: 8px; padding: 12px 16px; }
    .s-row { display: flex; justify-content: space-between; padding: 4px 0; }
    .s-row.grand { border-top: 2px solid #0d2240; margin-top: 6px; padding-top: 8px; font-size: 16px; font-weight: 800; }
    .sigs { display: flex; justify-content: space-between; margin-top: 28px; padding-top: 12px; border-top: 1px solid #ccc; font-weight: 600; }
  </style>
</head>
<body>
  <div class="hdr">
    <div>
      <h1>دار القوات البحرية — المحروسة</h1>
      <h2>بيان الأصناف المنصرفة بالوردية (منفذ: ${escapeHtml(point.name)})</h2>
    </div>
    <div style="text-align:left;font-size:11px;color:#555;">
      <div>تاريخ الطباعة: ${escapeHtml(nowStr)}</div>
    </div>
  </div>

  <div class="meta">
    <div><span>المنفذ</span><strong>${escapeHtml(point.name)} (#${escapeHtml(point.code)})</strong></div>
    <div><span>الكاشير / الموظف</span><strong>${escapeHtml(employee.name)} (${escapeHtml(employee.code)})</strong></div>
    <div><span>الوردية</span><strong>${escapeHtml(shift.shift_name)}</strong></div>
    <div><span>تاريخ الوردية</span><strong>${escapeHtml(shift.shift_date)}</strong></div>
  </div>

  <table>
    <thead>
      <tr>
        <th>كود الصنف</th>
        <th>اسم الصنف</th>
        <th>التصنيف</th>
        <th style="text-align:center;">إجمالي الكمية المنصرفة</th>
        <th>سعر الوحدة</th>
        <th>إجمالي القيمة</th>
      </tr>
    </thead>
    <tbody>
      ${itemRowsHtml}
    </tbody>
  </table>

  <div class="summary">
    <div class="s-row"><span>إجمالي عدد الوحدات المنصرفة:</span><strong>${escapeHtml(items_total_qty)} وحدة</strong></div>
    <div class="s-row"><span>إجمالي قيمة الأصناف (قبل الخدمة والخصم):</span><strong>${escapeHtml(items_subtotal)} ج.م</strong></div>
    <div class="s-row"><span>إجمالي الخدمة المضافة (12%):</span><strong>+${breakdown.grand_total.service_amount} ج.م</strong></div>
    <div class="s-row"><span>إجمالي خصم المشتركين:</span><strong>-${breakdown.grand_total.discount_amount} ج.م</strong></div>
    <div class="s-row grand"><span>صافي الإجمالي العام للوردية (نقدي: ${breakdown.cash_total.total} + نزيل آجل: ${breakdown.deferred_total.total}):</span><span>${breakdown.grand_total.total} ج.م</span></div>
  </div>

  <div class="sigs">
    <div>توقيع الكاشير: ${escapeHtml(employee.name)} ........................</div>
    <div>توقيع المراجع: ........................</div>
  </div>
</body>
</html>`;

  return htmlToPdf(html, { format: 'A4' });
}

export async function shutdown() {
  if (_browser) { await _browser.close(); _browser = null; }
}
