# Insurance Cost Analysis

## Syfte
Detta projekt analyserar vilka faktorer som hänger ihop med försäkringskostnader (`charges`) och bygger regressionsmodeller i R för att undersöka vilka variabler som verkar viktigast.

## Dataset
Projektet använder datasetet `insurance_costs.csv` som ligger i `data/raw/`.

## Projektstruktur
- `data/raw/` innehåller rådata
- `data/processed/` innehåller städad data
- `scripts/` innehåller körbara analyssteg
- `R/` innehåller funktioner
- `output/` innehåller figurer, tabeller och modeller
- `report/` innehåller slutrapport

## Körordning
Kör skripten i följande ordning:
1. `scripts/00_setup.R`
2. `scripts/01_data_understanding.R`
3. `scripts/02_data_cleaning.R`
4. `scripts/03_descriptive_analysis.R`
5. `scripts/04_regression_analysis.R`
6. `scripts/05_export_results.R`

## Paket
Projektet använder bland annat:
- tidyverse
- here
- janitor
- readr
- ggplot2
- broom

## Hur projektet öppnas
Öppna projektet via `insurance-cost-analysis.Rproj` i RStudio.

## Hur analysen körs
Kör skripten i ordning enligt listan ovan.