#### Preamble ####
# Purpose: Bayesian logistic regression model
# Author: Kaavya Kalani
# Date: 6 April 2024
# Contact: kaavya.kalani@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read the data ####
analysis_data <- read.csv("data/analysis_data/expeditions.csv")

single_bay <- 
  stan_glm(
    success ~ sex + seasons,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    cores = 4,
    adapt_delta = 0.99,
    seed = 853
  )

#### Save model ####
saveRDS(
  single_bay,
  file = "models/single_bay.rds"
)
