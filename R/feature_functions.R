create_bmi_category <- function(data) {
  data %>%
    mutate(
      bmi_category = case_when(
        bmi < 18.5 ~ "Underweight",
        bmi >= 18.5 & bmi < 25 ~ "Normal weight",
        bmi >= 25 & bmi < 30 ~ "Overweight",
        bmi >= 30 ~ "Obese",
        TRUE ~ NA_character_
      )
    )
}

create_age_group <- function(data) {
  data %>%
    mutate(
      age_group = case_when(
        age < 30 ~ "18-29",
        age >= 30 & age < 45 ~ "30-44",
        age >= 45 & age < 60 ~ "45-59",
        age >= 60 ~ "60+",
        TRUE ~ NA_character_
      )
    )
}