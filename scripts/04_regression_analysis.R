
source(here::here("scripts", "00_setup.R"))

insurance_clean <- readr::read_csv(
  here::here("data", "processed", "insurance_clean.csv"),
  show_col_types = FALSE
)

insurance_clean <- insurance_clean %>%
  mutate(
    sex = factor(sex),
    region = factor(region),
    smoker = factor(smoker),
    chronic_condition = factor(chronic_condition),
    exercise_level = factor(exercise_level),
    plan_type = factor(plan_type),
    bmi_category = factor(bmi_category),
    age_group = factor(age_group)
  )

# Modell 1: enkel modell
model_1 <- lm(charges ~ age + bmi + children, data = insurance_clean)

# Modell 2: utökad modell
model_2 <- lm(
  charges ~ age + bmi + children + smoker + chronic_condition +
    exercise_level + prior_claims + prior_accidents + plan_type,
  data = insurance_clean
)

cat("===== MODELL 1 =====\n")
print(summary(model_1))

cat("\n===== MODELL 2 =====\n")
print(summary(model_2))

cat("\n===== MODELLJÄMFÖRELSE =====\n")
model_comparison <- tibble(
  model = c("Model 1", "Model 2"),
  r_squared = c(summary(model_1)$r.squared, summary(model_2)$r.squared),
  adjusted_r_squared = c(summary(model_1)$adj.r.squared, summary(model_2)$adj.r.squared),
  aic = c(AIC(model_1), AIC(model_2))
)

print(model_comparison)

readr::write_csv(
  model_comparison,
  here::here("output", "tables", "model_comparison.csv")
)

model_1_coefficients <- broom::tidy(model_1)
model_2_coefficients <- broom::tidy(model_2)

readr::write_csv(
  model_1_coefficients,
  here::here("output", "tables", "model_1_coefficients.csv")
)

readr::write_csv(
  model_2_coefficients,
  here::here("output", "tables", "model_2_coefficients.csv")
)

saveRDS(model_1, here::here("output", "models", "model_1.rds"))
saveRDS(model_2, here::here("output", "models", "model_2.rds"))

cat("\nRegressionsanalys klar. Resultat sparade i output.\n")