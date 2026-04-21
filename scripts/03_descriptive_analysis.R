source(here::here("scripts", "00_setup.R"))

insurance_clean <- readr::read_csv(
  here::here("data", "processed", "insurance_clean.csv"),
  show_col_types = FALSE
)

# Gör om vissa variabler till factor igen efter read_csv
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

cat("===== BESKRIVANDE STATISTIK =====\n")
print(summary(insurance_clean))

# Tabell 1: medelvärde och median för charges
charges_summary <- insurance_clean %>%
  summarise(
    mean_charges = mean(charges),
    median_charges = median(charges),
    min_charges = min(charges),
    max_charges = max(charges),
    sd_charges = sd(charges)
  )

print(charges_summary)

readr::write_csv(
  charges_summary,
  here::here("output", "tables", "charges_summary.csv")
)

# Tabell 2: genomsnittlig kostnad per rökstatus
charges_by_smoker <- insurance_clean %>%
  group_by(smoker) %>%
  summarise(
    count = n(),
    mean_charges = mean(charges),
    median_charges = median(charges)
  )

print(charges_by_smoker)

readr::write_csv(
  charges_by_smoker,
  here::here("output", "tables", "charges_by_smoker.csv")
)

# Tabell 3: genomsnittlig kostnad per plan_typ
charges_by_plan <- insurance_clean %>%
  group_by(plan_type) %>%
  summarise(
    count = n(),
    mean_charges = mean(charges),
    median_charges = median(charges)
  )

print(charges_by_plan)

readr::write_csv(
  charges_by_plan,
  here::here("output", "tables", "charges_by_plan.csv")
)

# Figur 1
fig1 <- plot_charges_histogram(insurance_clean)
print(fig1)

ggsave(
  filename = here::here("output", "figures", "fig1_charges_histogram.png"),
  plot = fig1,
  width = 8,
  height = 5
)

# Figur 2
fig2 <- plot_charges_by_smoking(insurance_clean)
print(fig2)

ggsave(
  filename = here::here("output", "figures", "fig2_charges_by_smoker.png"),
  plot = fig2,
  width = 8,
  height = 5
)

# Figur 3
fig3 <- plot_bmi_vs_charges(insurance_clean)
print(fig3)

ggsave(
  filename = here::here("output", "figures", "fig3_bmi_vs_charges.png"),
  plot = fig3,
  width = 8,
  height = 5
)

# Figur 4
fig4 <- plot_charges_by_age_group(insurance_clean)
print(fig4)

ggsave(
  filename = here::here("output", "figures", "fig4_charges_by_age_group.png"),
  plot = fig4,
  width = 8,
  height = 5
)

cat("\nBeskrivande analys klar. Tabeller och figurer sparade i output.\n")