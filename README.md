# district-heating-acceptance-replication

Replication materials for:

Brandhorst, L. D. *Psychological Determinants of Renewable District Heating Acceptance: A Theory of Planned Behavior Study*.

## Contents

- `code/` – R Markdown file with the complete analysis (`analysis.Rmd`) and the script that created the public data file (`00_make_public_data.R`)
- `data/raw/` – anonymized survey data (SPSS format; age in 10-year groups)
- `outputs/` – knitted report (`00_main_report.docx`) and all result files (CSV, RDS) written by the analysis

## Reproduction

1. Download or clone the full repository and open the R project file (`.Rproj`) in RStudio. File paths are resolved with the `here` package relative to the project root.
2. Open `code/analysis.Rmd`.
3. Knit to Word. Missing packages are installed automatically via `pacman` on the first run.

Knitting reproduces all tables, model results and robustness checks reported in the manuscript and writes them to `outputs/`. Intermediate data files are written to `data/`.

Runtime: the bootstrap procedures (1,000 resamples each for the main model, the earlier specification and the robustness check) take several minutes; the full document runs in about 15–20 minutes on a standard machine.

Software used for the reported results: R 4.5.1, lavaan 0.6-20, semTools 0.5-7, MissMech 1.0.4, psych 2.5.6, car 3.1-3. Package versions of the full session are listed at the end of the knitted report.

## Analysis overview

| Part of `analysis.Rmd` | Manuscript (section, table, figure) |
|---|---|
| Data preparation, missing-data analysis (MCAR test) | Data analysis; Sample characteristics |
| Scale construction (weighted beliefs, PBC item decision) | Questionnaire development; Measurement model |
| Descriptive statistics, reliability, correlations | Measurement model; Descriptive statistics and correlations; Tables 1 and 3 |
| Confirmatory factor analysis, CR, AVE, VIF | Measurement model; Tables 1 and 2 |
| Structural model: place identity → beliefs → TPB constructs → intention | Structural model (incl. Place identity effects); Figure 2 |
| Earlier specification: place identity → TPB constructs (for comparison) | Place identity effects |
| Robustness check with age and gender as controls | Robustness check: demographic controls |

## Notes on the data

- The questionnaire contained further items that are not analyzed in the paper (e.g., preferred heat sources, media use, trust in the utility). They remain in the raw data.
- The item on acceptable price premiums (`WVT`) does not measure willingness to pay in an incentive-compatible way and is therefore not analyzed.

- For data protection, exact age is published only in 10-year groups. All analyses in the manuscript were run on this public file, so the results can be reproduced exactly.

## License

The code (`code/`) is released under the MIT License (see `LICENSE`). The data (`data/`) and the result files (`outputs/`) are released under the Creative Commons Attribution 4.0 International License (CC BY 4.0; see `data/LICENSE.md`).

## Contact

Leif Donar Brandhorst
Department of Social Sciences, Hochschule Bielefeld – University of Applied Sciences and Arts (HSBI), Interaktion 1, 33619 Bielefeld, Germany
E-mail: leifdonarbrandhorst@gmail.com
