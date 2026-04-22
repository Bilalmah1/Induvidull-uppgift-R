# Insurance Cost Analysis

## Syfte
Detta projekt analyserar vilka faktorer som hänger ihop med försäkringskostnader (`charges`) och undersöker om regressionsmodeller kan användas som stöd för framtida prissättning.

## Dataset
Projektet använder datasetet `insurance_costs.csv`, som finns i `data/raw/`.

## Projektstruktur

- `data/raw/` innehåller rådata
- `data/processed/` innehåller städad data
- `scripts/` innehåller analysstegen
- `R/` innehåller funktioner
- `output/` innehåller figurer, tabeller och modeller
- `report/` innehåller rapporten

## Paket

Projektet använder bland annat följande paket:

- tidyverse
- here
- janitor
- readr
- ggplot2
- broom
- quarto

## Rapport

Rapporten finns i `report/report.qmd` och kan renderas med Quarto.

## Hur projektet öppnas

Öppna projektet via `.Rproj`-filen i RStudio.

## Körordning

Analysen kan köras på två sätt:

### Alternativ 1: steg för steg
1. `scripts/00_setup.R`
2. `scripts/01_data_understanding.R`
3. `scripts/02_data_cleaning.R`
4. `scripts/03_descriptive_analysis.R`
5. `scripts/04_regression_analysis.R`
6. `scripts/05_export_results.R`

### Alternativ 2: kör hela analysen direkt
Kör filen `run_all.R`, som använder `source()` för att köra alla steg i rätt ordning, renderar rapporten och öppnar den färdiga HTML-rapporten.
