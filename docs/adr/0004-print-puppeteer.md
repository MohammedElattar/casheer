# ADR 0004 — Receipt rendering: Puppeteer HTML→PDF with embedded Noto Sans Arabic

- Date: 2026-11-09.
- Supersedes: nothing.
- Related: DEC-005, `docs/workflows/sery-invoice-lifecycle.md` §print-flow.
- Status: ACCEPTED.

## Context

Legacy SERY print was Oracle Reports invoked twice per bill:

```plsql
t := :global.prnt || ',LPT1:';     -- point_tbl.prnt_n + hardcoded LPT1 suffix
run_product(reports, 'd:\m_cashear\invoice_new',     synchronous, runtime, filesystem, list_id, null);
run_product(reports, 'd:\m_cashear\invoice_new',     synchronous, runtime, filesystem, list_id, null);
```

- Target format: 80 mm thermal, Arabic-heavy with ligatures, dual copy.
- `run_product` and the `,LPT1:` port syntax are both Windows Forms 6i artifacts that have no modern equivalent.
- The user required "must be perfect with Arabic language".

Arabic rendering is the hard constraint. Arabic script requires contextual shaping (initial / medial / final / isolated glyphs) and ligature substitution. Most Node PDF libraries (`pdfkit`, `pdfmake`, `jsPDF`) do not implement Arabic shaping correctly; the output is visually broken.

## Decision

Render receipts as HTML with embedded Noto Sans Arabic, convert to PDF via headless Chromium (Puppeteer), then hand the PDF to the OS print queue.

Flow:

```
GET /api/v1/invoices/:id/receipt.pdf
   1. Fetch invoice + lines + employee + point from DB.
   2. Render Handlebars (or plain template-literal) HTML:
      <html dir="rtl" lang="ar">
        <head>
          <style>
            @font-face { font-family: 'Noto Sans Arabic'; src: url('/fonts/NotoSansArabic-Regular.ttf'); }
            body { font-family: 'Noto Sans Arabic', sans-serif; width: 80mm; margin: 0; padding: 4mm; }
            @page { size: 80mm auto; margin: 0; }
          </style>
        </head>
        <body>...</body>
      </html>
   3. puppeteer.launch({ headless: 'new' }).newPage().setContent(html).pdf({ width: '80mm' })
   4. Response: application/pdf; filename=receipt-<ser_no>.pdf
```

For direct-to-printer:

- `POST /api/v1/invoices/:id/print` → same render, then spool via `lp` (CUPS, Linux) or `PrintTo` (Windows) using `point.printer_name`.
- Prints 2 copies (legacy convention, preserved).

Fonts:

- Noto Sans Arabic shipped with the API image under `src/print/fonts/NotoSansArabic-Regular.ttf` + `-Bold.ttf`. Deterministic rendering across hosts.
- Latin fallback: Noto Sans (bundled similarly).

## Reasoning

- Chromium has the best Arabic shaping on any platform (HarfBuzz + ICU).
- HTML+CSS is the only receipt format we can preview in the browser during development — WYSIWYG with what prints.
- Driving Puppeteer from Node keeps the entire stack in one runtime.
- 80 mm width + `@page { size: 80mm auto }` makes Chromium produce a strip-length PDF suitable for a thermal printer.
- CUPS / Windows print spooler accept the resulting PDF without conversion.

## Consequences

- API Docker image is +~150 MB (Chromium). Build time grows; document in README.
- Puppeteer requires a few Linux libraries in the container (`libnss3`, `libatk1.0-0`, etc.). Add to `Dockerfile`.
- First-request latency is measurable (browser launch). Mitigation: launch a single long-lived Chromium at API startup and reuse pages. If that becomes a reliability issue, revisit.
- Fonts must be re-licensed if bundled under a license incompatible with redistribution — Noto SIL OFL 1.1 permits this. Ship the license file next to the font.
- Printer name drives OS print queue; mapping is "point.printer_name = queue name". `,LPT1:` is gone.

## Alternatives not pursued

- `pdfkit`: no Arabic shaping. Rejected.
- `pdfmake`: same. Rejected.
- Playwright instead of Puppeteer: equivalent rendering, more dependencies. Puppeteer wins on dependency weight only.
- Render on the client (`window.print`): browser-side Arabic shaping is correct, but printer selection and 2-copy semantics are weaker. Also forces every workstation to have a printer attached. V1 picks server-side.
- Oracle Reports Server (modern): out of scope — we are moving OFF Oracle entirely.
