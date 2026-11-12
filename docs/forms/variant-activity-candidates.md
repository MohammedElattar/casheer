# Form variant activity candidates

For each lexical-stem group of `.fmb` variants, this document ranks the variants by trigger count then by file size and names the top-ranked file **CANDIDATE_ACTIVE**.

Evidence classification: **INFERRED**. Verdict needs business-owner / deployment-package confirmation (BLK-008).

## `sery` (9 variants)

| Rank | Path | Triggers | Size | Verdict |
|---|---|---|---|---|
| 1 | `M_CASHEAR/sery_last.fmb` | 171 | 1277952 | CANDIDATE_ACTIVE |
| 2 | `M_CASHEAR/sery_last20.fmb` | 171 | 1277952 | candidate_historical |
| 3 | `M_CASHEAR/sery.fmb` | 169 | 778240 | candidate_historical |
| 4 | `M_CASHEAR/امتداد عضوية  حتى شهر3/sery.fmb` | 152 | 643072 | candidate_historical |
| 5 | `M_CASHEAR/sery_old.fmb` | 150 | 1085440 | candidate_historical |
| 1 | `M_CASHEAR/sery_last.fmx` | 0 | 525128 | CANDIDATE_ACTIVE |
| 2 | `M_CASHEAR/امتداد عضوية  حتى شهر3/sery.fmx` | 0 | 393048 | candidate_historical |
| 3 | `M_CASHEAR/sery_old.fmx` | 0 | 392944 | candidate_historical |
| 4 | `M_CASHEAR/sery.fmx` | 0 | 392752 | candidate_historical |

## `take_away` (7 variants)

| Rank | Path | Triggers | Size | Verdict |
|---|---|---|---|---|
| 1 | `M_CASHEAR/take_away.fmb` | 171 | 1183744 | CANDIDATE_ACTIVE |
| 2 | `M_CASHEAR/امتداد عضوية  حتى شهر3/take_away.fmb` | 163 | 1110016 | candidate_historical |
| 3 | `M_CASHEAR/take_away - Copy.fmb` | 163 | 1097728 | candidate_historical |
| 4 | `M_CASHEAR/SQL/take_away.fmb` | 163 | 737280 | candidate_historical |
| 1 | `M_CASHEAR/SQL/take_away.fmx` | 0 | 455248 | CANDIDATE_ACTIVE |
| 2 | `M_CASHEAR/امتداد عضوية  حتى شهر3/take_away.fmx` | 0 | 454848 | candidate_historical |
| 3 | `M_CASHEAR/take_away.fmx` | 0 | 383884 | candidate_historical |

## Open question (BLK-008)

Trigger count is a proxy — it rises as a form is developed, so the richest variant is usually the newest. But a developer may have abandoned the newest draft; only deployment evidence can prove which `.fmx` is actually invoked by the launcher menu and shipped to users. A business-owner confirmation is still required before any variant is moved out of the active set.
