#### Preamble ####
# Purpose: Simulated the analysis dataset
# Author: Kaavya Kalani
# Date: 18 March 2024
# Contact: kaavya.kalani@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)

#### Simulation ####
# Set seed for reproducibility
set.seed(823)

# Number of rows in the dataset
n <- 1000

# Generate age values
age <- round(runif(n, min = 15, max = 90))

# Generate sex values
sex <- sample(c("m", "f"), n, replace = TRUE)

# Generate season values
season <- sample(c("summer", "winter", "spring", "autumn"), n, replace = TRUE)

# Generate peak height values
peak_height <- round(runif(n, min = 5000, max = 8849))

# Generate success values
success <- sample(0:1, n, replace = TRUE)

# Generate died values based on success
died <- ifelse(success == 1, rbinom(n, 1, 0.1), rbinom(n, 1, 0.5))

# Create dataframe
data <- data.frame(age, sex, season, peak_height, success, died)

# View the first few rows of the dataset
head(data)
