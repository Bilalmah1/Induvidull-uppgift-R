clean_insurance_data <- function(data) {
  data %>%
    janitor::clean_names() %>%
    mutate(
      across(where(is.character), ~ trimws(.x)),
      across(where(is.character), ~ tolower(.x))
    ) %>%
    mutate(
      smoker = case_when(
        smoker %in% c("yes", "y") ~ "yes",
        smoker %in% c("no", "n") ~ "no",
        TRUE ~ smoker
      ),
      chronic_condition = case_when(
        chronic_condition %in% c("yes", "y") ~ "yes",
        chronic_condition %in% c("no", "n") ~ "no",
        TRUE ~ chronic_condition
      ),
      exercise_level = case_when(
        exercise_level %in% c("high", "medium", "low") ~ exercise_level,
        is.na(exercise_level) ~ NA_character_,
        TRUE ~ exercise_level
      ),
      region = case_when(
        region %in% c("north", "south", "east", "west") ~ region,
        TRUE ~ region
      ),
      plan_type = case_when(
        plan_type %in% c("basic", "standard", "premium") ~ plan_type,
        TRUE ~ plan_type
      )
    )
}