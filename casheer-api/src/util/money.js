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
