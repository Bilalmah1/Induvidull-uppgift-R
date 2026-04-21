source(here::here("scripts", "00_setup.R"))

insurance_raw <- readr::read_csv(here::here("data", "raw", "insurance_costs.csv"))

cat("===== DIMENSIONER =====\n")
print(dim(insurance_raw))

cat("\n===== KOLUMNNAMN =====\n")
print(names(insurance_raw))

cat("\n===== STRUKTUR =====\n")
str(insurance_raw)

cat("\n===== FÖRSTA RADER =====\n")
print(head(insurance_raw))

cat("\n===== SAMMANFATTNING =====\n")
print(summary(insurance_raw))

cat("\n===== MISSING VALUES =====\n")
missing_summary <- missing_value_summary(insurance_raw)
print(missing_summary)

write_csv(missing_summary, here::here("output", "tables", "missing_value_summary.csv"))