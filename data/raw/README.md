## Raw Data Description

This folder contains the earliest shareable version of the survey data.

### File

- `Survey_Data_public.sav` – anonymized survey dataset (SPSS format, N = 542)

### Data Processing Prior to Publication

Before inclusion in this repository, the following steps were applied:
- Removal of IP addresses and other direct identifiers
- Addition of variable labels
- Exact age replaced by 10-year age groups (`Age_group`: 18–24, 25–34, 35–44,
  45–54, 55–64, 65–74, 75+) to reduce the risk of re-identification
  (script: `code/00_make_public_data.R`)
- No recoding, filtering, or aggregation of observations

All subsequent processing steps are documented and reproducible with
`code/analysis.Rmd`. Intermediate data files created during the analysis are
written to `data/`.
