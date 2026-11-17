import { useState } from 'react';
import type { ShiftCloseSummary } from '@/types';

interface ShiftCloseModalProps {
  summary: ShiftCloseSummary;
  closing?: boolean;
  onConfirmClose?: () => void;
  onBack: () => void;
}

export function ShiftCloseModal({
  summary,
  closing = false,
  onConfirmClose,
  onBack,
}: ShiftCloseModalProps) {
  const [previewTab, setPreviewTab] = useState<'NONE' | 'INVOICES' | 'ITEMS'>('INVOICES');
  const { shift, employee, point, breakdown, invoices, items_dispensed, items_total_qty, items_subtotal } = summary;
  const isAlreadyClosed = Boolean(shift.closed_at);

  function printInvoicesReport() {
    const win = window.open('', '_blank', 'width=900,height=750');
    if (!win) return;
    const nowStr = new Date().toLocaleString('ar-EG');
    const rowsHtml = invoices.length === 0
      ? `<tr><td colspan="7" style="text-align:center;padding:14px;color:#666;">لا توجد فواتير مسددة في هذه الوردية</td></tr>`
      : invoices.map((inv) => {
          const cType = inv.client_type || 'CIVILIAN';
          const cLabel = cType === 'MEMBER'
            ? `مشترك (${inv.mem_name || inv.mem_bar || ''})`
            : cType === 'GUEST'
              ? `نزيل غرفة #${inv.room_no} (${inv.guest_name || ''})`
              : 'مدنى';
          return `
            <tr>
              <td>#${inv.ser_no ?? inv.serial_no}</td>
              <td>${cLabel}</td>
              <td>${inv.table_no ? `ترابيزة #${inv.table_no}` : '—'}</td>
              <td>${Number(inv.subtotal).toFixed(2)}</td>
              <td>+${Number(inv.service_amount).toFixed(2)}</td>
              <td>-${Number(inv.discount_amount).toFixed(2)}</td>
              <td style="font-weight:700;">${Number(inv.total).toFixed(2)} ج.م</td>
            </tr>
          `;
        }).join('');

    win.document.write(`<!doctype html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="utf-8" />
  <title>تقرير إغلاق وردية — ${point.name}</title>
  <style>
    @page { size: A4; margin: 12mm; }
    body { font-family: 'Segoe UI', Tahoma, Arial, sans-serif; color: #0d2240; margin: 16px; font-size: 13px; }
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
      <h2>نموذج إغلاق وردية منفذ (بيان الفواتير والإجماليات)</h2>
    </div>
    <div style="text-align:left;font-size:11px;color:#555;">
      <div>تاريخ الطباعة: ${nowStr}</div>
      <div>حالة الوردية: ${shift.closed_at ? 'مغلقة' : 'مفتوحة'}</div>
    </div>
  </div>

  <div class="meta">
    <div><span>المنفذ</span><strong>${point.name} (#${point.code})</strong></div>
    <div><span>الموظف / الكاشير</span><strong>${employee.name} (${employee.code})</strong></div>
    <div><span>الوردية</span><strong>${shift.shift_name}</strong></div>
    <div><span>تاريخ الوردية</span><strong>${shift.shift_date}</strong></div>
  </div>

  <div class="grid2">
    <div class="box">
      <h3>إجمالي الفواتير النقدية:</h3>
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
      <h3>إجمالي الفواتير الآجلة (الغرف / الريسبشن):</h3>
      <div class="row">
        <span>النزيل (${breakdown.guest.count} فاتورة):</span>
        <strong>${breakdown.guest.total} ج.م</strong>
      </div>
      <div class="row">
        <span>جهة التحصيل:</span>
        <span>حساب الغرف بالريسبشن (ROOM_ACCOUNT)</span>
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

  <h3 style="margin:0 0 6px;">بيان فواتير الوردية (${invoices.length} فاتورة)</h3>
  <table>
    <thead>
      <tr>
        <th>رقم الإيصال</th>
        <th>نوع العميل والبيان</th>
        <th>الترابيزة</th>
        <th>المجموع</th>
        <th>الخدمة (12%)</th>
        <th>الخصم</th>
        <th>الإجمالي</th>
      </tr>
    </thead>
    <tbody>
      ${rowsHtml}
    </tbody>
  </table>

  <div class="sigs">
    <div>توقيع الكاشير (${employee.name}): ........................</div>
    <div>توقيع مشرف الوردية / المراجع: ........................</div>
  </div>
  <script>window.onload = () => { window.print(); };</script>
</body>
</html>`);
    win.document.close();
  }

  function printDispensedItemsReport() {
    const win = window.open('', '_blank', 'width=900,height=750');
    if (!win) return;
    const nowStr = new Date().toLocaleString('ar-EG');
    const rowsHtml = items_dispensed.length === 0
      ? `<tr><td colspan="6" style="text-align:center;padding:14px;color:#666;">لا توجد أصناف منصرفة في هذه الوردية</td></tr>`
      : items_dispensed.map((it) => `
          <tr>
            <td>#${it.item_code}</td>
            <td style="font-weight:600;">${it.item_name}</td>
            <td>${it.type_name}</td>
            <td style="text-align:center;font-weight:700;">${it.qty_sold}</td>
            <td>${it.unit_price} ج.م</td>
            <td style="font-weight:700;">${it.total_sold} ج.م</td>
          </tr>
        `).join('');

    win.document.write(`<!doctype html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="utf-8" />
  <title>بيان الأصناف المنصرفة بالوردية — ${point.name}</title>
  <style>
    @page { size: A4; margin: 12mm; }
    body { font-family: 'Segoe UI', Tahoma, Arial, sans-serif; color: #0d2240; margin: 16px; font-size: 13px; }
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
    .s-row.grand { border-top: 2px solid #0d2240; margin-top: 6px; padding-top: 8px; font-size: 15px; font-weight: 800; }
    .sigs { display: flex; justify-content: space-between; margin-top: 28px; padding-top: 12px; border-top: 1px solid #ccc; font-weight: 600; }
  </style>
</head>
<body>
  <div class="hdr">
    <div>
      <h1>دار القوات البحرية — المحروسة</h1>
      <h2>بيان الأصناف المنصرفة بالوردية (${point.name})</h2>
    </div>
    <div style="text-align:left;font-size:11px;color:#555;">
      <div>تاريخ الطباعة: ${nowStr}</div>
    </div>
  </div>

  <div class="meta">
    <div><span>المنفذ</span><strong>${point.name} (#${point.code})</strong></div>
    <div><span>الموظف / الكاشير</span><strong>${employee.name} (${employee.code})</strong></div>
    <div><span>الوردية</span><strong>${shift.shift_name}</strong></div>
    <div><span>تاريخ الوردية</span><strong>${shift.shift_date}</strong></div>
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
      ${rowsHtml}
    </tbody>
  </table>

  <div class="summary">
    <div class="s-row"><span>إجمالي عدد الوحدات المنصرفة:</span><strong>${items_total_qty} وحدة</strong></div>
    <div class="s-row"><span>إجمالي قيمة الأصناف (قبل الخدمة والخصم):</span><strong>${items_subtotal} ج.م</strong></div>
    <div class="s-row"><span>إجمالي الخدمة المضافة (12%):</span><strong>+${breakdown.grand_total.service_amount} ج.م</strong></div>
    <div class="s-row"><span>إجمالي خصم المشتركين:</span><strong>-${breakdown.grand_total.discount_amount} ج.م</strong></div>
    <div class="s-row grand">
      <span>صافي الإجمالي العام للوردية (المدنى: ${breakdown.civilian.total} + المشترك: ${breakdown.member.total} + النزيل: ${breakdown.guest.total}):</span>
      <span>${breakdown.grand_total.total} ج.م</span>
    </div>
  </div>

  <div class="sigs">
    <div>توقيع الكاشير (${employee.name}): ........................</div>
    <div>توقيع مشرف الوردية / المراجع: ........................</div>
  </div>
  <script>window.onload = () => { window.print(); };</script>
</body>
</html>`);
    win.document.close();
  }

  return (
    <div
      style={{
        position: 'fixed',
        inset: 0,
        zIndex: 9999,
        background: 'rgba(11, 32, 56, 0.72)',
        backdropFilter: 'blur(4px)',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: 16,
      }}
    >
      <div
        className="card"
        style={{
          width: 880,
          maxWidth: '96vw',
          maxHeight: '92vh',
          overflowY: 'auto',
          padding: 0,
          border: '2px solid var(--gold)',
          boxShadow: '0 20px 50px rgba(0,0,0,0.45)',
        }}
      >
        {/* Top Black/Navy Header Bar (matching POINT_CLOSE screenshot) */}
        <div
          style={{
            background: 'linear-gradient(135deg, #091c29 0%, #14516B 100%)',
            color: 'white',
            padding: '12px 20px',
            borderBottom: '3px solid var(--gold)',
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            flexWrap: 'wrap',
            gap: 12,
          }}
        >
          <div style={{ display: 'flex', alignItems: 'center', gap: 16, flexWrap: 'wrap' }}>
            <div>
              <span style={{ fontSize: 11, color: '#D9C38F', display: 'block' }}>المنفذ</span>
              <strong style={{ fontSize: 15, color: 'var(--bright)' }}>
                {point.name} (#{point.code})
              </strong>
            </div>
            <div style={{ width: 1, height: 28, background: 'rgba(255,255,255,0.2)' }} />
            <div>
              <span style={{ fontSize: 11, color: '#D9C38F', display: 'block' }}>الموظف / الكاشير</span>
              <strong style={{ fontSize: 14, color: '#7CF29C' }}>
                {employee.name} ({employee.code})
              </strong>
            </div>
            <div style={{ width: 1, height: 28, background: 'rgba(255,255,255,0.2)' }} />
            <div>
              <span style={{ fontSize: 11, color: '#D9C38F', display: 'block' }}>الوردية</span>
              <strong style={{ fontSize: 14, color: 'white' }}>{shift.shift_name}</strong>
            </div>
            <div style={{ width: 1, height: 28, background: 'rgba(255,255,255,0.2)' }} />
            <div>
              <span style={{ fontSize: 11, color: '#D9C38F', display: 'block' }}>تاريخ الفاتورة / الوردية</span>
              <strong style={{ fontSize: 14, color: 'var(--bright)', direction: 'ltr', display: 'inline-block' }}>
                {shift.shift_date}
              </strong>
            </div>
          </div>

          <span
            style={{
              padding: '4px 12px',
              borderRadius: 999,
              fontSize: 12,
              fontWeight: 700,
              background: isAlreadyClosed ? '#1E6B47' : 'var(--gold)',
              color: 'white',
            }}
          >
            {isAlreadyClosed ? '✓ تم إغلاق الوردية' : 'POINT_CLOSE · جاهز للإغلاق'}
          </span>
        </div>

        {/* Main Body modeled on POINT_CLOSE */}
        <div style={{ padding: 22, background: '#FAF7F0' }}>
          {summary.open_invoices_count > 0 && !isAlreadyClosed && (
            <div
              style={{
                marginBottom: 16,
                padding: '10px 14px',
                borderRadius: 8,
                background: '#FFF4D9',
                border: '1px solid var(--amber)',
                color: '#7A4B00',
                fontSize: 13,
                fontWeight: 600,
              }}
            >
              ⚠️ تنبيه: يوجد حالياً عدد ({summary.open_invoices_count}) فاتورة مفتوحة لم يتم تسديدها في هذه الوردية.
            </div>
          )}

          <div
            style={{
              display: 'grid',
              gridTemplateColumns: '1.25fr 1fr',
              gap: 20,
              alignItems: 'start',
            }}
          >
            {/* RIGHT COLUMN (in RTL): إجمالي الفواتير النقدية (المدنى + المشترك) & إجمالي الفواتير الآجلة (النزيل) */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
              {/* Box 1: إجمالي الفواتير النقدية */}
              <div
                style={{
                  background: 'white',
                  border: '1px solid var(--line)',
                  borderRadius: 10,
                  padding: 16,
                  boxShadow: '0 2px 6px rgba(0,0,0,0.03)',
                }}
              >
                <h3
                  style={{
                    margin: '0 0 12px',
                    fontSize: 16,
                    color: '#8B1E1E',
                    borderBottom: '2px solid #F0EAE1',
                    paddingBottom: 8,
                  }}
                >
                  إجمالي الفواتير النقدية :
                </h3>

                <SummaryFieldRow
                  label="المدنى :"
                  count={breakdown.civilian.count}
                  value={breakdown.civilian.total}
                  badgeColor="var(--navy)"
                />
                <SummaryFieldRow
                  label="المشترك :"
                  count={breakdown.member.count}
                  value={breakdown.member.total}
                  badgeColor="var(--green)"
                />

                <div
                  style={{
                    marginTop: 12,
                    paddingTop: 10,
                    borderTop: '2px dashed var(--line)',
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                  }}
                >
                  <strong style={{ color: 'var(--navy)', fontSize: 14 }}>
                    إجمالي الفواتير النقدية ({breakdown.cash_total.count} فاتورة) :
                  </strong>
                  <div
                    style={{
                      minWidth: 160,
                      textAlign: 'center',
                      padding: '7px 14px',
                      borderRadius: 8,
                      background: '#F4F1E8',
                      border: '1px solid var(--gold)',
                      fontWeight: 800,
                      fontSize: 16,
                      color: 'var(--navy)',
                    }}
                  >
                    {breakdown.cash_total.total} ج.م
                  </div>
                </div>
              </div>

              {/* Box 2: إجمالي الفواتير الآجلة (النزيل) */}
              <div
                style={{
                  background: 'white',
                  border: '1px solid var(--line)',
                  borderRadius: 10,
                  padding: 16,
                  boxShadow: '0 2px 6px rgba(0,0,0,0.03)',
                }}
              >
                <h3
                  style={{
                    margin: '0 0 12px',
                    fontSize: 16,
                    color: '#8B1E1E',
                    borderBottom: '2px solid #F0EAE1',
                    paddingBottom: 8,
                  }}
                >
                  إجمالي الفواتير الآجلة (الريسبشن) :
                </h3>

                <SummaryFieldRow
                  label="النزيل (غرف الفندق) :"
                  count={breakdown.guest.count}
                  value={breakdown.guest.total}
                  badgeColor="var(--amber)"
                />

                <div
                  style={{
                    marginTop: 12,
                    paddingTop: 10,
                    borderTop: '2px dashed var(--line)',
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                  }}
                >
                  <strong style={{ color: 'var(--navy)', fontSize: 14 }}>
                    إجمالي الفواتير الآجلة ({breakdown.deferred_total.count} فاتورة) :
                  </strong>
                  <div
                    style={{
                      minWidth: 160,
                      textAlign: 'center',
                      padding: '7px 14px',
                      borderRadius: 8,
                      background: '#FFF9EB',
                      border: '1px solid var(--gold)',
                      fontWeight: 800,
                      fontSize: 16,
                      color: 'var(--amber)',
                    }}
                  >
                    {breakdown.deferred_total.total} ج.م
                  </div>
                </div>
              </div>
            </div>

            {/* LEFT COLUMN (in RTL): Title Badge + Crest + الإجمالي العام + Action Buttons */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: 14 }}>
              {/* Title & Crest Card */}
              <div
                style={{
                  background: 'white',
                  border: '1px solid var(--line)',
                  borderRadius: 10,
                  padding: 16,
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  gap: 12,
                }}
              >
                <div>
                  <div
                    style={{
                      display: 'inline-block',
                      padding: '6px 16px',
                      background: 'var(--navy)',
                      color: 'white',
                      borderRadius: 6,
                      fontWeight: 800,
                      fontSize: 17,
                      boxShadow: '3px 3px 0 var(--gold)',
                    }}
                  >
                    نموذج إغلاق وردية منفذ
                  </div>
                  <div className="muted" style={{ fontSize: 12, marginTop: 8 }}>
                    ملخص أعمال الكاشير للفواتير النقدية (المدنى والمشترك) والفواتير الآجلة (النزيل)
                  </div>
                </div>

                <div
                  style={{
                    width: 68,
                    height: 76,
                    borderRadius: 10,
                    background: 'linear-gradient(180deg, #164B78 0%, #0D2240 100%)',
                    border: '2px solid var(--gold)',
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                    justifyContent: 'center',
                    color: 'var(--bright)',
                    flexShrink: 0,
                  }}
                >
                  <span style={{ fontSize: 28 }}>⚓</span>
                  <span style={{ fontSize: 10, fontWeight: 800 }}>المحروسة</span>
                </div>
              </div>

              {/* Grand Total Box (الإجمالي العام) */}
              <div
                style={{
                  background: 'linear-gradient(135deg, #1E2952 0%, #0D2240 100%)',
                  color: 'white',
                  borderRadius: 10,
                  padding: 16,
                  border: '2px solid var(--gold)',
                }}
              >
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <div>
                    <div style={{ fontSize: 15, fontWeight: 800, color: 'var(--bright)' }}>
                      الإجمالي العام :
                    </div>
                    <div style={{ fontSize: 11, opacity: 0.85, marginTop: 2 }}>
                      إجمالي عدد الفواتير المسددة: {breakdown.grand_total.count} فاتورة
                    </div>
                  </div>
                  <div
                    style={{
                      background: 'rgba(255,255,255,0.12)',
                      border: '1px solid var(--gold)',
                      borderRadius: 8,
                      padding: '8px 18px',
                      fontSize: 22,
                      fontWeight: 800,
                      color: 'var(--bright)',
                    }}
                  >
                    {breakdown.grand_total.total} ج.م
                  </div>
                </div>

                <div
                  style={{
                    marginTop: 10,
                    paddingTop: 8,
                    borderTop: '1px solid rgba(255,255,255,0.16)',
                    display: 'flex',
                    justifyContent: 'space-between',
                    fontSize: 11,
                    color: 'rgba(255,255,255,0.85)',
                  }}
                >
                  <span>المجموع: {breakdown.grand_total.subtotal}</span>
                  <span>الخدمة (12%): +{breakdown.grand_total.service_amount}</span>
                  <span>الخصم: -{breakdown.grand_total.discount_amount}</span>
                </div>
              </div>

              {/* Preview Toggles (عرض الفواتير / عرض الأصناف المنصرفة على الشاشة) */}
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 8 }}>
                <button
                  type="button"
                  className="btn"
                  onClick={() => setPreviewTab(previewTab === 'INVOICES' ? 'NONE' : 'INVOICES')}
                  style={{
                    justifyContent: 'center',
                    fontSize: 12,
                    background: previewTab === 'INVOICES' ? '#EBF3F5' : 'white',
                    borderColor: previewTab === 'INVOICES' ? 'var(--navy)' : 'var(--line)',
                  }}
                >
                  📋 {previewTab === 'INVOICES' ? 'إخفاء بيان الفواتير' : `عرض الفواتير (${invoices.length})`}
                </button>
                <button
                  type="button"
                  className="btn"
                  onClick={() => setPreviewTab(previewTab === 'ITEMS' ? 'NONE' : 'ITEMS')}
                  style={{
                    justifyContent: 'center',
                    fontSize: 12,
                    background: previewTab === 'ITEMS' ? '#EBF3F5' : 'white',
                    borderColor: previewTab === 'ITEMS' ? 'var(--navy)' : 'var(--line)',
                  }}
                >
                  🍽️ {previewTab === 'ITEMS' ? 'إخفاء بيان الأصناف' : `عرض الأصناف المنصرفة (${items_dispensed.length})`}
                </button>
              </div>

              {/* 4 Main Action Buttons matching POINT_CLOSE screenshot:
                  عودة | غلق الوردية | طباعة الفواتير | طباعة الأصناف
              */}
              <div
                style={{
                  display: 'grid',
                  gridTemplateColumns: '1fr 1fr',
                  gap: 10,
                  marginTop: 4,
                }}
              >
                {!isAlreadyClosed && onConfirmClose && (
                  <button
                    type="button"
                    className="btn gold"
                    disabled={closing}
                    onClick={onConfirmClose}
                    style={{
                      justifyContent: 'center',
                      padding: '12px 14px',
                      fontSize: 14,
                      fontWeight: 800,
                    }}
                  >
                    🔒 {closing ? 'جارٍ غلق الوردية...' : 'غلق الوردية'}
                  </button>
                )}

                <button
                  type="button"
                  className="btn primary"
                  onClick={printInvoicesReport}
                  style={{
                    justifyContent: 'center',
                    padding: '12px 14px',
                    fontSize: 14,
                  }}
                >
                  🖨️ طباعة الفواتير
                </button>

                <button
                  type="button"
                  className="btn primary"
                  onClick={printDispensedItemsReport}
                  style={{
                    justifyContent: 'center',
                    padding: '12px 14px',
                    fontSize: 14,
                    background: '#1E6B47',
                    borderColor: '#1E6B47',
                  }}
                >
                  📦 طباعة الأصناف المنصرفة
                </button>

                <button
                  type="button"
                  className="btn"
                  onClick={onBack}
                  style={{
                    justifyContent: 'center',
                    padding: '12px 14px',
                    fontSize: 14,
                    background: 'white',
                  }}
                >
                  ↩️ عودة
                </button>
              </div>
            </div>
          </div>

          {/* Expandable On-Screen Table Preview for Invoices or Dispensed Items */}
          {previewTab === 'INVOICES' && (
            <div
              style={{
                marginTop: 18,
                background: 'white',
                borderRadius: 10,
                padding: 14,
                border: '1px solid var(--line)',
              }}
            >
              <h4 style={{ margin: '0 0 10px', color: 'var(--navy)' }}>
                تفاصيل فواتير الوردية ({invoices.length} فاتورة)
              </h4>
              {invoices.length === 0 ? (
                <p className="muted" style={{ margin: 0, fontSize: 13 }}>لا توجد فواتير مسددة في هذه الوردية</p>
              ) : (
                <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 12 }}>
                  <thead>
                    <tr style={{ background: '#F4F1E8', borderBottom: '2px solid var(--line)' }}>
                      <th style={{ textAlign: 'start', padding: 6 }}>رقم الإيصال</th>
                      <th style={{ textAlign: 'start', padding: 6 }}>نوع العميل</th>
                      <th style={{ textAlign: 'start', padding: 6 }}>البيان (المشترك / الغرفة)</th>
                      <th style={{ textAlign: 'end', padding: 6 }}>المجموع</th>
                      <th style={{ textAlign: 'end', padding: 6 }}>الخدمة 12%</th>
                      <th style={{ textAlign: 'end', padding: 6 }}>الخصم</th>
                      <th style={{ textAlign: 'end', padding: 6 }}>الإجمالي</th>
                    </tr>
                  </thead>
                  <tbody>
                    {invoices.map((inv) => {
                      const cType = inv.client_type || 'CIVILIAN';
                      return (
                        <tr key={inv.id} style={{ borderBottom: '1px solid var(--line)' }}>
                          <td style={{ padding: 6, fontWeight: 700 }}>#{inv.ser_no ?? inv.serial_no}</td>
                          <td style={{ padding: 6 }}>
                            {cType === 'MEMBER' ? '🪪 مشترك' : cType === 'GUEST' ? '🏨 نزيل' : '👤 مدنى'}
                          </td>
                          <td style={{ padding: 6 }} className="muted">
                            {cType === 'MEMBER'
                              ? `${inv.mem_name || ''} (${inv.mem_bar || ''})`
                              : cType === 'GUEST'
                                ? `غرفة #${inv.room_no} — ${inv.guest_name || ''}`
                                : inv.table_no
                                  ? `ترابيزة #${inv.table_no}`
                                  : '—'}
                          </td>
                          <td style={{ textAlign: 'end', padding: 6 }}>{Number(inv.subtotal).toFixed(2)}</td>
                          <td style={{ textAlign: 'end', padding: 6 }}>+{Number(inv.service_amount).toFixed(2)}</td>
                          <td style={{ textAlign: 'end', padding: 6 }}>-{Number(inv.discount_amount).toFixed(2)}</td>
                          <td style={{ textAlign: 'end', padding: 6, fontWeight: 700 }}>{Number(inv.total).toFixed(2)} ج.م</td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              )}
            </div>
          )}

          {previewTab === 'ITEMS' && (
            <div
              style={{
                marginTop: 18,
                background: 'white',
                borderRadius: 10,
                padding: 14,
                border: '1px solid var(--line)',
              }}
            >
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 10 }}>
                <h4 style={{ margin: 0, color: 'var(--navy)' }}>
                  بيان الأصناف المنصرفة بالوردية ({items_dispensed.length} صنف · إجمالي {items_total_qty} وحدة)
                </h4>
                <strong style={{ color: 'var(--navy)', fontSize: 13 }}>
                  إجمالي قيمة الأصناف: {items_subtotal} ج.م
                </strong>
              </div>
              {items_dispensed.length === 0 ? (
                <p className="muted" style={{ margin: 0, fontSize: 13 }}>لا توجد أصناف منصرفة في هذه الوردية</p>
              ) : (
                <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: 12 }}>
                  <thead>
                    <tr style={{ background: '#F4F1E8', borderBottom: '2px solid var(--line)' }}>
                      <th style={{ textAlign: 'start', padding: 6 }}>كود الصنف</th>
                      <th style={{ textAlign: 'start', padding: 6 }}>اسم الصنف</th>
                      <th style={{ textAlign: 'start', padding: 6 }}>التصنيف</th>
                      <th style={{ textAlign: 'center', padding: 6 }}>الكمية المنصرفة</th>
                      <th style={{ textAlign: 'end', padding: 6 }}>سعر الوحدة</th>
                      <th style={{ textAlign: 'end', padding: 6 }}>الإجمالي</th>
                    </tr>
                  </thead>
                  <tbody>
                    {items_dispensed.map((it) => (
                      <tr key={`${it.item_code}-${it.unit_price}`} style={{ borderBottom: '1px solid var(--line)' }}>
                        <td style={{ padding: 6 }}>#{it.item_code}</td>
                        <td style={{ padding: 6, fontWeight: 700 }}>{it.item_name}</td>
                        <td style={{ padding: 6 }} className="muted">{it.type_name}</td>
                        <td style={{ textAlign: 'center', padding: 6, fontWeight: 700 }}>{it.qty_sold}</td>
                        <td style={{ textAlign: 'end', padding: 6 }}>{it.unit_price} ج.م</td>
                        <td style={{ textAlign: 'end', padding: 6, fontWeight: 700 }}>{it.total_sold} ج.م</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

function SummaryFieldRow({
  label,
  count,
  value,
  badgeColor,
}: {
  label: string;
  count: number;
  value: string;
  badgeColor: string;
}) {
  return (
    <div
      style={{
        display: 'grid',
        gridTemplateColumns: '1fr auto 160px',
        gap: 10,
        alignItems: 'center',
        marginBottom: 10,
      }}
    >
      <span style={{ fontWeight: 700, fontSize: 14, color: 'var(--ink)' }}>{label}</span>
      <span
        style={{
          fontSize: 11,
          fontWeight: 700,
          padding: '2px 10px',
          borderRadius: 999,
          background: '#F4F1E8',
          color: badgeColor,
        }}
      >
        {count} فاتورة
      </span>
      <input
        readOnly
        value={`${value} ج.م`}
        style={{
          textAlign: 'center',
          fontWeight: 700,
          fontSize: 15,
          background: 'white',
          color: 'var(--navy)',
          border: '1px solid #B8B2A6',
          padding: '6px 10px',
        }}
      />
    </div>
  );
}
