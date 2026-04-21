
plot_charges_histogram <- function(data) {
  ggplot(data, aes(x = charges)) +
    geom_histogram(bins = 30) +
    labs(
      title = "Fördelning av försäkringskostnader",
      x = "Charges",
      y = "Antal"
    ) +
    theme_minimal()
}

plot_charges_by_smoking <- function(data) {
  ggplot(data, aes(x = smoker, y = charges)) +
    geom_boxplot() +
    labs(
      title = "Försäkringskostnad efter rökning",
      x = "Rökning",
      y = "Charges"
    ) +
    theme_minimal()
}

plot_bmi_vs_charges <- function(data) {
  ggplot(data, aes(x = bmi, y = charges)) +
    geom_point(alpha = 0.6) +
    geom_smooth(method = "lm", se = TRUE) +
    labs(
      title = "BMI och försäkringskostnad",
      x = "BMI",
      y = "Charges"
    ) +
    theme_minimal()
}

plot_charges_by_age_group <- function(data) {
  ggplot(data, aes(x = age_group, y = charges)) +
    geom_boxplot() +
    labs(
      title = "Försäkringskostnad per åldersgrupp",
      x = "Åldersgrupp",
      y = "Charges"
    ) +
    theme_minimal()
}