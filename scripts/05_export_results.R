source(here::here("scripts", "00_setup.R"))

charges_summary <- readr::read_csv(
  here::here("output", "tables", "charges_summary.csv"),
  show_col_types = FALSE
)

charges_by_smoker <- readr::read_csv(
  here::here("output", "tables", "charges_by_smoker.csv"),
  show_col_types = FALSE
)

charges_by_plan <- readr::read_csv(
  here::here("output", "tables", "charges_by_plan.csv"),
  show_col_types = FALSE
)

model_comparison <- readr::read_csv(
  here::here("output", "tables", "model_comparison.csv"),
  show_col_types = FALSE
)

model_1_coefficients <- readr::read_csv(
  here::here("output", "tables", "model_1_coefficients.csv"),
  show_col_types = FALSE
)

model_2_coefficients <- readr::read_csv(
  here::here("output", "tables", "model_2_coefficients.csv"),
  show_col_types = FALSE
)

cat("===== SLUTLIG RESULTATSAMMANFATTNING =====\n")

cat("\nÖvergripande kostnadssammanfattning:\n")
print(charges_summary)

cat("\nKostnader efter rökstatus:\n")
print(charges_by_smoker)

cat("\nKostnader efter plan_typ:\n")
print(charges_by_plan)

cat("\nJämförelse mellan regressionsmodeller:\n")
print(model_comparison)

cat("\nDe första raderna i modell 1-koefficienter:\n")
print(head(model_1_coefficients))

cat("\nDe första raderna i modell 2-koefficienter:\n")
print(head(model_2_coefficients))

cat("\nAlla resultat finns sparade i output-mappen.\n")