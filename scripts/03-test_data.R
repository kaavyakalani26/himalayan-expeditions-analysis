#### Preamble ####
# Purpose: Tests the analysis data
# Author: Kaavya Kalani
# Date: 18 April 2024
# Contact: kaavya.kalani@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Tests ####
print("Testing analysis data")

analysis_data <- read_parquet("data/analysis_data/expeditions.parquet")

# Initialize a boolean variable to track test results
all_tests_passed <- TRUE

# Test 1: Check for missing data
if (any(is.na(analysis_data))) {
  print("There are missing data.")
  all_tests_passed <- FALSE
} else {
  print("There are no missing data.")
}

# Test 2: Check the number of columns
if (ncol(analysis_data) != 7) {
  print("Number of columns is not 7.")
  all_tests_passed <- FALSE
} else {
  print("Number of columns is 7.")
}

# Test 3: Check the values in the height column are all valid
heights <- c(
  "5400 - 5749", "5750 - 6099", "6100 - 6449", "6450 - 6799", "6800 - 7149", "7150 - 7499",
  "7500 - 7849", "7850 - 8199", "8200 - 8549", "8550 - 8900"
)
if (!all(analysis_data$height_range %in% heights)) {
  print("There are invalid values in the 'height' column.")
  all_tests_passed <- FALSE
} else {
  print("Values in the 'height' column are valid")
}

# Test 4: Check the values in the seasons column are all valid
seasons <- c("Autumn", "Spring", "Winter", "Summer")
if (!all(analysis_data$seasons %in% seasons)) {
  print("There are invalid values in the 'seasons' column.")
  all_tests_passed <- FALSE
} else {
  print("Values in the 'seasons' column are valid")
}

# Test 5: Check the values in the sex column are all valid
if (!all(analysis_data$sex %in% c("M", "F"))) {
  print("There are invalid values in the 'sex' column.")
  all_tests_passed <- FALSE
} else {
  print("Values in the 'sex' column are valid")
}

# Test 6: Check the values in the age column are all valid
ages <- c("Under 18", "19-30", "31-40", "41-50", "51-60", "61-70", "71-80", "81-90")
if (!all(analysis_data$age_range %in% ages)) {
  print("There are invalid values in the 'age' column.")
  all_tests_passed <- FALSE
} else {
  print("Values in the 'age' column are valid")
}

# Test 7: Check the values in the success column are all valid
if (!all(analysis_data$success %in% c(TRUE, FALSE))) {
  print("There are invalid values in the 'success' column.")
  all_tests_passed <- FALSE
} else {
  print("Values in the 'success' column are valid")
}

# Test 8: Check the values in the solo column are all valid
if (!all(analysis_data$solo %in% c(TRUE, FALSE))) {
  print("There are invalid values in the 'solo' column.")
  all_tests_passed <- FALSE
} else {
  print("Values in the 'solo' column are valid")
}

# Test 9: Check the values in the died column are all valid
if (!all(analysis_data$died %in% c(TRUE, FALSE))) {
  print("There are invalid values in the 'died' column.")
  all_tests_passed <- FALSE
} else {
  print("Values in the 'died' column are valid")
}

# Print summary based on test results
if (all_tests_passed) {
  print("All tests passed.")
} else {
  print("One or more tests failed.")
}
