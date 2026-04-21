check_required_columns <- function(data, required_cols) {
  missing_cols <- setdiff(required_cols, names(data))
  
  if (length(missing_cols) > 0) {
    stop(
      paste(
        "Följande kolumner saknas i datasetet:",
        paste(missing_cols, collapse = ", ")
      )
    )
  }
}

missing_value_summary <- function(data) {
  tibble(
    column = names(data),
    missing_count = sapply(data, function(x) sum(is.na(x))),
    missing_percent = round(sapply(data, function(x) mean(is.na(x)) * 100), 2)
  ) %>%
    arrange(desc(missing_count))
}