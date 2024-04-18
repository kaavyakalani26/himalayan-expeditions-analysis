#### Preamble ####
# Purpose: Cleans the raw data
# Author: Kaavya Kalani
# Date: 18 April 2024
# Contact: kaavya.kalani@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Load and clean data ####
# Read the raw data files
peaks <- read.csv("data/raw_data/peaks.csv")
expeditions <- read.csv("data/raw_data/expeditions.csv")
members <- read.csv("data/raw_data/members.csv")

# Merge expedition and member data based on expedition_id
merged_data1 <- merge(expeditions, members, by = "expedition_id")

# Select relevant columns and rename peak_id
merged_data1 <- merged_data1 %>%
  select(peak_id.x, season.x, sex, age, success, solo, died) %>%
  rename(peak_id = peak_id.x)

# Select relevant columns from the peaks data
peaks <- peaks %>%
  select(peak_id, height_metres)

# Merge the previously merged data with peaks data based on peak_id
merged_data2 <- merge(merged_data1, peaks, by = "peak_id")

main_data <- merged_data2 %>%
  filter(!is.na(sex), !is.na(age)) %>% # Filter out rows with missing values for sex or age
  rename(height = height_metres, seasons = season.x) %>%
  mutate(
    # Create height range categories
    height_range = case_when(
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
    ),
    # Create age range categories
    age_range = case_when(
      age <= 18 ~ "Under 18",
      age > 18 & age <= 30 ~ "19-30",
      age > 30 & age <= 40 ~ "31-40",
      age > 40 & age <= 50 ~ "41-50",
      age > 50 & age <= 60 ~ "51-60",
      age > 60 & age <= 70 ~ "61-70",
      age > 70 & age <= 80 ~ "71-80",
      age > 80 & age <= 90 ~ "81-90",
      TRUE ~ as.character(age)
    )
  ) %>%
  # Select final columns
  select(height_range, seasons, sex, age_range, success, solo, died)

#### Save the cleaned data ####
write_parquet(main_data, "data/analysis_data/expeditions.parquet")
