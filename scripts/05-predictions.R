#### Preamble ####
# Purpose: Creates prediction dataset to use in the Results section of the paper
# Author: Kaavya Kalani
# Date: 18 April 2024
# Contact: kaavya.kalani@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 04-model.R

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Prediciton dataset ####
analysis_data <- read_parquet("data/analysis_data/expeditions.parquet")
expeditions_model <- readRDS("models/single_bay.rds")

# Create a data frame with all combinations of variables
sex_levels <- unique(analysis_data$sex)
seasons_levels <- unique(analysis_data$seasons)
height_levels <- unique(analysis_data$height_range)
age_levels <- unique(analysis_data$age_range)
solo_levels <- unique(analysis_data$solo)

new_data <- expand.grid(
  sex = sex_levels,
  seasons = seasons_levels,
  height_range = height_levels,
  age_range = age_levels,
  solo = solo_levels
)

# Predicting success based on all variables
predictions <- predict(expeditions_model, newdata = new_data, type = "response")

# Create a data frame to display the predictions
prediction_df <- data.frame(
  sex = new_data$sex,
  seasons = new_data$seasons,
  height_range = new_data$height_range,
  age_range = new_data$age_range,
  solo = new_data$solo,
  success_probability = predictions
)

#### Saving the predictions ####
write.csv(prediction_df, "data/predictions/predictions.csv", row.names = FALSE)
