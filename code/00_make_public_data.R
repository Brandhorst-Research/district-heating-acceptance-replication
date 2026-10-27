# -----------------------------------------------------------------------------
# Creates the public version of the survey data (run once, not part of the
# analysis). Exact age is replaced by 10-year age groups to reduce the risk of
# re-identification. The original file is NOT published.
#
# Input : data/raw/Raw_Data_02-01-25.sav   (original, removed before upload)
# Output: data/raw/Survey_Data_public.sav  (public file used by analysis.Rmd)
#
# Run the whole script at once ("Source").
# -----------------------------------------------------------------------------

library(haven)
library(dplyr)
library(here)

# Read original data -----------------------------------------------------------
raw <- haven::read_sav(here("data", "raw", "Raw_Data_02-01-25.sav"), user_na = FALSE)

# Recode age into 10-year groups -----------------------------------------------
# The groups keep the cut-offs used in the paper (18-34, 35-64, 65+).
age_breaks <- c(-Inf, 24, 34, 44, 54, 64, 74, Inf)
age_labels <- c("18-24" = 1, "25-34" = 2, "35-44" = 3, "45-54" = 4,
                "55-64" = 5, "65-74" = 6, "75+" = 7)

age_years <- as.numeric(haven::zap_labels(raw$Age))
age_group <- cut(age_years, breaks = age_breaks, labels = FALSE, right = TRUE)

public <- raw |>
  dplyr::mutate(
    Age_group = haven::labelled(as.numeric(age_group),
                                labels = age_labels,
                                label  = "Age group (years)")
  ) |>
  dplyr::relocate(Age_group, .after = Age) |>
  dplyr::select(-Age)

# Checks ------------------------------------------------------------------------
stopifnot(nrow(public) == nrow(raw))       # no cases lost
stopifnot(!"Age" %in% names(public))       # exact age removed
stopifnot(sum(is.na(age_years)) == sum(is.na(public$Age_group)))  # same missings

age_tab <- table(haven::as_factor(public$Age_group), useNA = "ifany")
print(cbind(n = age_tab, percent = round(100 * prop.table(age_tab), 1)))

# Save public file --------------------------------------------------------------
haven::write_sav(public, here("data", "raw", "Survey_Data_public.sav"))
cat("\nSaved:", here("data", "raw", "Survey_Data_public.sav"), "\n")
cat("Now delete Raw_Data_02-01-25.sav from data/raw before uploading to GitHub.\n")
