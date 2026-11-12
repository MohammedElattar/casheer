# casheer-api

Casheer POS backend. Express + Postgres (`pg` raw SQL) + JWT. See `../casheer/docs/workflows/sery-invoice-lifecycle.md` for recovered business rules.

## Quickstart

```bash
cp .env.example .env         # edit DATABASE_URL + JWT secrets
npm install
docker compose up -d db      # from repo root, or your own Postgres
npm run migrate
npm run seed
npm run dev
```

## Layout

```
src/
├── app.js                 Express app factory
├── server.js              HTTP listener
├── db/
│   ├── pool.js            pg.Pool singleton
│   ├── migrate.js         SQL migration runner
│   └── seed.js            Dev seed data
├── middleware/
│   ├── auth.js            JWT verify
│   └── error.js           Centralized error envelope
├── routes/
│   ├── auth.js            /auth/login, /auth/refresh
│   ├── invoices.js        /invoices CRUD + close + print
│   ├── items.js           /items menu
│   └── points.js          /points config
├── services/
│   ├── auth.service.js    bcrypt + JWT sign
│   ├── invoice.service.js Core business logic (dual counter, floor-round, p_ok)
│   └── print.service.js   Puppeteer HTML -> PDF
├── templates/             receipt.html + receipt.css (Arabic RTL thermal)
└── util/
    └── money.js           FLOOR(x*100)/100 rounding helpers

sql/
├── migrations/*.sql       Applied in lexical order by migrate.js
└── seed/*.sql
```

## Invariants from the legacy system

1. **Dual counter**: `invoices.serial_no` sequential per `(point_id, inv_date)`. `invoices.ser_no` sequential per `(point_id, inv_date, status='PAID')`. See `services/invoice.service.js`.
2. **Floor rounding**: all money is `FLOOR(x * 100) / 100`. Banker's rounding breaks reporting parity with legacy figures.
3. **`point_tbl.d1..d7` weekday gate**: `points.weekday_mask` is a 7-bit int; bit index = `EXTRACT(dow FROM date)`. Sales refused when the bit is 0.
4. **State machine**: `invoices.status IN ('OPEN','PAID','CANCELLED')`. Replaces legacy `p_ok` + `del_flg` overload.
5. **Soft-cancel**: cancel keeps `invoices` row (audit), deletes `invoice_lines`, flips status + `cancelled_by/at`.
6. **Print**: double-print on paid receipts is a client-side concern (POST twice or use `copies=2`), not baked in.

## Notes

- Puppeteer downloads ~150 MB Chromium on install. Override with `PUPPETEER_EXECUTABLE_PATH` if pinning a system binary.
- Raw SQL only. No ORM. Use `$1, $2, ...` always; never string-concat.
