
options(stringsAsFactors = FALSE)

required_packages <- c(
  "tidyverse",
  "here",
  "janitor",
  "readr",
  "ggplot2",
  "broom"
)

install_if_missing <- function(packages) {
  for (pkg in packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      install.packages(pkg)
    }
  }
}

install_if_missing(required_packages)

library(tidyverse)
library(here)
library(janitor)
library(readr)
library(ggplot2)
library(broom)

dir.create(here("data", "processed"), recursive = TRUE, showWarnings = FALSE)
dir.create(here("output", "figures"), recursive = TRUE, showWarnings = FALSE)
dir.create(here("output", "tables"), recursive = TRUE, showWarnings = FALSE)
dir.create(here("output", "models"), recursive = TRUE, showWarnings = FALSE)

source(here("R", "utils.R"))
source(here("R", "clean_functions.R"))
source(here("R", "feature_functions.R"))
source(here("R", "plot_functions.R"))
source(here("R", "model_functions.R"))

message("Setup klart.")