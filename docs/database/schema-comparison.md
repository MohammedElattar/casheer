# Schema comparison — sources

Three independent data points about the Casheer schema have been reconciled:

| Source | Kind | Tables | Views | Notes |
|---|---|---|---|---|
| `المحروسة/mahrosa-all (1).svg` | DrawSQL render | 192 | 0 | 93 FK edges |
| `المحروسة/MAHROSA_FULL_DRAWSQL_MYSQL.sql` | MySQL DDL mirror | 192 | 0 | 1:1 with SVG |
| `M_CASHEAR/SQL/*.txt`, `inv_update.sql`, `doc_new/new_stat_view.txt`, `vist.txt` | Oracle DDL slice | 42 | 52 | ad-hoc, hand-curated |
| `M_CASHEAR/SQL/mhr.dmp` (header) | Oracle 9.2 exp | 7+ (strings leak) | — | full list requires `imp show=y` on `oracle19c` (NXT-008) |

## Reconciliation

- SVG and MySQL file match exactly (192/192). Both are DrawSQL exports of the same source.
- SQL text files cover ~32 % of tables and add 52 views not in the diagram.
- Dump header strings confirm 7 of the SVG tables verbatim. No contradiction.
- VERIFIED total: **192 base tables + 52 views + 93 FK relationships**. Triggers, sequences, procedures, packages: UNKNOWN; requires NXT-008.
