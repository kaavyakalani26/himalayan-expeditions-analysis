#### Preamble ####
# Purpose: Cleans the raw data
# Author: Kaavya Kalani
# Date:6 April 2024
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
  select(peak_id, height_metres, season.x, sex, age, success, solo, died) %>%
  rename(height = height_metres, seasons = season.x)

#### Save the cleaned data ####
write.csv(main_data, "data/analysis_data/expeditions.csv", row.names = FALSE)
