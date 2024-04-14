#### Preamble ####
# Purpose: Cleans the raw data
# Author: Kaavya Kalani
# Date: 6 April 2024
# Contact: kaavya.kalani@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)

#### Load and clean data ####
peaks <- read.csv("data/raw_data/peaks.csv")
expeditions <- read.csv("data/raw_data/expeditions.csv")
members <- read.csv("data/raw_data/members.csv")

merged_data1 <- merge(expeditions, members, by = "expedition_id")
merged_data1 <- merged_data1 %>%
  select(peak_id.x, season.x, sex, age, success, solo, died) %>%
  rename(peak_id = peak_id.x)

peaks <- peaks %>%
  select(peak_id, height_metres)

merged_data2 <- merge(merged_data1, peaks, by = "peak_id")
main_data <- merged_data2 %>%
  filter(!is.na(sex), !is.na(age)) %>%
  rename(height = height_metres, seasons = season.x) %>%
  mutate(height_range = case_when(
    height >= 5400 & height < 5750 ~ "5400 - 5749",
    height >= 5750 & height < 6100 ~ "5750 - 6099",
    height >= 6100 & height < 6450 ~ "6100 - 6449",
    height >= 6450 & height < 6800 ~ "6450 - 6799",
    height >= 6800 & height < 7150 ~ "6800 - 7149",
    height >= 7150 & height < 7500 ~ "7150 - 7499",
    height >= 7500 & height < 7850 ~ "7500 - 7849",
    height >= 7850 & height < 8200 ~ "7850 - 8199",
    height >= 8200 & height < 8550 ~ "8200 - 8549",
    height >= 8550 & height <= 8900 ~ "8550 - 8900",
    TRUE ~ as.character(height)
    )) %>%
    select(peak_id, height_range, seasons, sex, age, success, solo, died)

#### Save the cleaned data ####
write.csv(main_data, "data/analysis_data/expeditions.csv", row.names = FALSE)
