import { ApiError } from '../middleware/error.js';

// Floor-round to 2 decimals. House convention (matches legacy FLOOR(x*100)/100).
// Banker's rounding would produce different totals vs legacy records.
export function floor2(x) {
  if (x == null || isNaN(x)) return 0;
  return Math.floor(Number(x) * 100) / 100;
}

export function computeTotals({ subtotal, servicePercent, discountPercent }) {
  const sub  = floor2(subtotal);
  const serv = floor2(sub * (Number(servicePercent)  || 0) / 100);
  const disc = floor2(sub * (Number(discountPercent) || 0) / 100);
  const total = floor2(sub + serv - disc);
  return { subtotal: sub, service_amount: serv, discount_amount: disc, total };
}

// Weekday gate: points.weekday_mask bit per ISO day (Mon=1..Sun=7).
// JS Date#getDay() → 0=Sun..6=Sat. Map to ISO (Mon=1..Sun=7).
export function isoWeekdayBit(date) {
  const js = date.getDay();          // 0..6
  const iso = js === 0 ? 7 : js;     // 1..7
  return 1 << (iso - 1);
}

export function isPointOpenOn(mask, date) {
  return (mask & isoWeekdayBit(date)) !== 0;
}

export function formatLocalDate(d = new Date()) {
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}-${m}-${day}`;
}

export function getTodayAndYesterday(now = new Date()) {
  const today = formatLocalDate(now);
  const yest  = formatLocalDate(new Date(now.getFullYear(), now.getMonth(), now.getDate() - 1));
  return { today, yesterday: yest };
}

/**
 * Business rule for shift working dates:
 * - Normal shifts (shift_kind 1 or 2): date is strictly today's current date.
 * - Night shifts (shift_kind === 3): employee may select either today or yesterday
 *   (to continue a night shift that started before midnight on the previous calendar day).
 * - Arbitrary past or future dates are rejected.
 */
export function resolveAndValidateShiftDate(shiftKind, requestedDate, now = new Date()) {
  const { today, yesterday } = getTodayAndYesterday(now);
  const kind = Number(shiftKind || 1);
  const dateStr = requestedDate ? String(requestedDate).slice(0, 10) : today;

  if (kind === 3) {
    if (dateStr !== today && dateStr !== yesterday) {
      throw new ApiError(
        400,
        'INVALID_SHIFT_DATE',
        'في الوردية الليلية يُسمح باختيار تاريخ اليوم أو تاريخ الأمس فقط',
      );
    }
    return dateStr;
  }

  // Normal shift (morning / evening): must be today's current date.
  if (dateStr !== today) {
    throw new ApiError(
      400,
      'INVALID_SHIFT_DATE',
      'في الورديات العادية يتم اعتماد تاريخ اليوم تلقائياً ولا يُسمح بتغييره',
    );
  }
  return today;
}
