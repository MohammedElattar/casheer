import test from 'node:test';
import assert from 'node:assert/strict';
import { floor2, computeTotals, isoWeekdayBit, isPointOpenOn } from '../src/util/money.js';

test('floor2 clamps to 2 decimals (floor, not round)', () => {
  assert.equal(floor2(1.239),   1.23);
  assert.equal(floor2(1.999),   1.99);
  assert.equal(floor2(10.005),  10.00);
  assert.equal(floor2(0),       0);
  assert.equal(floor2(null),    0);
  assert.equal(floor2(undefined), 0);
});

test('computeTotals mirrors legacy FLOOR(x*100)/100 chain', () => {
  const t = computeTotals({ subtotal: 123.456, servicePercent: 10, discountPercent: 5 });
  // sub = 123.45; serv = floor(12.345)=12.34; disc = floor(6.1725)=6.17; total=floor(129.62)=129.62
  assert.equal(t.subtotal,        123.45);
  assert.equal(t.service_amount,   12.34);
  assert.equal(t.discount_amount,   6.17);
  assert.equal(t.total,           129.62);
});

test('weekday mask: Monday opens', () => {
  const mon = new Date('2026-01-05');     // ISO weekday 1
  assert.equal(isoWeekdayBit(mon), 0b0000001);
  assert.ok(isPointOpenOn(0b0000001, mon));
  assert.ok(!isPointOpenOn(0b1111110, mon));
});

test('weekday mask: Sunday opens', () => {
  const sun = new Date('2026-01-04');     // ISO weekday 7
  assert.equal(isoWeekdayBit(sun), 0b1000000);
});
