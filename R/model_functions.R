fit_model_1 <- function(data) {
  lm(charges ~ age + bmi + children, data = data)
}

fit_model_2 <- function(data) {
  lm(charges ~ age + bmi + children + smoker + chronic_condition + exercise_level + prior_claims, data = data)
}