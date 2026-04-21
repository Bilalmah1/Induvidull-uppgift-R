source(here::here("scripts", "00_setup.R"))

insurance_raw <- readr::read_csv(here::here("data", "raw", "insurance_costs.csv"))

required_columns <- c(
  "customer_id",
  "age",
  "sex",
  "region",
  "bmi",
  "children",
  "smoker",
  "chronic_condition",
  "exercise_level",
  "plan_type",
  "prior_accidents",
  "prior_claims",
  "annual_checkups",
  "charges"
)

check_required_columns(insurance_raw, required_columns)

insurance_clean <- insurance_raw %>%
  clean_insurance_data() %>%
  mutate(
    bmi = ifelse(is.na(bmi), median(bmi, na.rm = TRUE), bmi),
    annual_checkups = ifelse(
      is.na(annual_checkups),
      median(annual_checkups, na.rm = TRUE),
      annual_checkups
    ),
    exercise_level = ifelse(
      is.na(exercise_level),
      "unknown",
      exercise_level
    )
  ) %>%
  mutate(
    sex = factor(sex),
    region = factor(region),
    smoker = factor(smoker),
    chronic_condition = factor(chronic_condition),
    exercise_level = factor(exercise_level),
    plan_type = factor(plan_type)
  ) %>%
  create_bmi_category() %>%
  create_age_group()

cat("===== STRUKTUR EFTER STÄDNING =====\n")
str(insurance_clean)

cat("\n===== NIVÅER I KATEGORISKA VARIABLER =====\n")
cat("sex:\n")
print(levels(insurance_clean$sex))

cat("\nregion:\n")
print(levels(insurance_clean$region))

cat("\nsmoker:\n")
print(levels(insurance_clean$smoker))

cat("\nchronic_condition:\n")
print(levels(insurance_clean$chronic_condition))

cat("\nexercise_level:\n")
print(levels(insurance_clean$exercise_level))

cat("\nplan_type:\n")
print(levels(insurance_clean$plan_type))

cat("\n===== MISSING VALUES EFTER STÄDNING =====\n")
missing_summary_clean <- missing_value_summary(insurance_clean)
print(missing_summary_clean)

readr::write_csv(
  insurance_clean,
  here::here("data", "processed", "insurance_clean.csv")
)

readr::write_csv(
  missing_summary_clean,
  here::here("output", "tables", "missing_value_summary_clean.csv")
)

cat("\nStädad data sparad i data/processed/insurance_clean.csv\n")