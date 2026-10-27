## Code

`analysis.Rmd` contains the complete data preparation and analysis for the study.
It is designed to be knitted from top to bottom in RStudio and requires no manual
intervention. Each step saves its results to `outputs/` (CSV or RDS), so every
number in the manuscript can be traced to a file.

Main model: place identity is specified as a background factor that predicts the
eleven belief scores, which in turn predict attitude, subjective norm and perceived
behavioral control (PBC); these predict intention. Estimation uses robust maximum
likelihood (MLR) with full information maximum likelihood (FIML) for missing values.
Indirect effects are tested with percentile bootstrap confidence intervals
(1,000 resamples; ML estimation, which yields the same point estimates as MLR).

The document also estimates the earlier specification (place identity predicting
the TPB constructs directly), which is reported in the manuscript for comparison,
and a robustness check with age and gender as additional predictors.

`00_make_public_data.R` documents how the public data file was created from the
non-public original (exact age replaced by 10-year age groups). It was run once
and is not needed to reproduce the analysis.
