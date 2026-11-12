# .agent/PROJECT_CONTEXT.md — stable project knowledge

## Business purpose

`VERIFIED` (by presence of module names and dumps): the application is a cashier / point-of-sale system.
`INFERRED`: restaurant domain, with takeaway, serial-numbered invoices, items, item types, departments, employees, shifts, and daily/monthly/yearly statistics. Arabic UI based on filenames and the `المحروسة/` directory ("Al-Mahrosa", likely the business name).

Exact scope must be verified by parsing `.fmb` sources once extraction tooling is available.

## Functional modules (hypothesis, UNVERIFIED)

Named from `.fmb` filenames in `M_CASHEAR/` — each entry awaits verification from extracted form metadata:

- Cashier main (`cash_main.fmb`)
- Serial invoice (`sery.fmb`, and variants `sery_old.fmb`, `sery_last.fmb`, `sery_last10-10.fmb` — historical versions)
- Takeaway (`take_away.fmb`, `takeaway_pizza.fmb`, and `take_away_original - Copy.fmb` variant)
- Loyalty / points (`points.fmb`, `point_close.fmb`)
- Items and categories (`item_tbl.fmb`, `item_type.fmb` → also `ITEM_TYP.fmb` — case variance, verify duplication)
- Employees and departments (`employee.fmb`, `dept.fmb`, `JOBS.fmb`, `SUB_DEPT.fmb`)
- Login / session (`log_in_in.fmb`)
- Statistics (`statistics_form.fmb`, `stat_day.fmb`, `stat_month.fmb`, `stat_year.fmb`, `categ_month.fmb`, `categ_year_stat.fmb`, `day_categ_view.fmb`)
- Reporting entry (`rep_form.fmb`)
- Delivery (`delv.fmb`)
- Customer orders (`c_orders.fmb`)
- Riko (`RikoNew.fmb` — purpose unknown)

## Legacy technology stack

`VERIFIED`:
- Oracle Forms (binary `.fmb` / `.fmx`) — version presumed 6i per user statement. Actual Forms version will be read from binary header during extraction probe.
- Oracle Reports (`.rdf` / `.rep`).
- Oracle PL/SQL libraries (`.pll`).
- Oracle Graphics (`.ogd` — graph definitions).
- Oracle Database (`.dmp` dump present).
- `SQLNET.ORA` present but stock-example content (no live config).

`INFERRED`:
- Oracle 6i Developer Suite / Forms Builder was the original dev environment.
- `mhr.dmp` is likely a classic `exp` dump — actual format and source version will be probed via file header on host.

## Database technology

- Primary: Oracle Database (version not yet verified from dump header).
- Mirror artifact: `المحروسة/MAHROSA_FULL_DRAWSQL_MYSQL.sql` — MySQL-dialect translation of some schema, produced by DrawSQL tooling per filename. Reference only; not the source of truth.
- Schema diagram: `المحروسة/mahrosa-all (1).svg`. Not a replacement for a parsed data dictionary.
- Extracted DDL text: `M_CASHEAR/SQL/views.txt`, `trigger.txt`, `sql1.txt`, `yom_view.txt`, `inv_update.sql`, `Cashers.txt`, `Reception.txt`, `1.txt`, `serry.txt`. Not yet parsed.

## Important source locations

- Forms + icons + libs: `M_CASHEAR/`
- SQL + Oracle dump: `M_CASHEAR/SQL/`
- Arabic / MySQL mirror: `المحروسة/`
- Icons and UI assets: `M_CASHEAR/*.ico`, `M_CASHEAR/PHOTOS/`, `M_CASHEAR/back/`, `M_CASHEAR/CHARTS/`
- Graph definitions: `M_CASHEAR/ogd/`
- New-doc folder: `M_CASHEAR/doc_new/`
- Membership extension subdir: `M_CASHEAR/امتداد عضوية  حتى شهر3/` (Arabic — "Membership extension until month 3")

## Known dependencies

- Forms expect Oracle Forms 6i runtime (`f60run` / `ifrun60`), unavailable on current host.
- Reports expect Oracle Reports 6i runtime (`rwrun60`).
- PL/SQL libs attached to forms via `pll` references — binding not yet mapped.
- `SQLNET.ORA` suggests TNS-based DB connection; actual `tnsnames.ora` not in repo.

## Target modernization objectives

Per master prompt §14:
- Browser-based app, no Oracle Forms/Reports/runtime.
- Preserve business logic, Arabic + RTL, concurrent cashier support, printing where required.
- Stack not yet selected; decision deferred to post-reverse-engineering architecture phase.
- Database platform choice deferred; may run on Oracle during transition.

## Known environmental constraints

- Host: WSL2 Linux (kernel 6.18.54.1-microsoft-standard-WSL2). Zsh. No Oracle tooling, no Java.
- VM: Oracle Database 12c, reachable via SSH alias `dobat12c_win_server`. Guest OS and installed Oracle Developer tools unknown until Phase 0 probe.
- Oracle Forms 6i binary compatibility with 12c-era tooling is uncertain; `frmf2xml` shipped with Forms 12c may not parse 6i fmbs. Toolchain gap analysis is a priority.
