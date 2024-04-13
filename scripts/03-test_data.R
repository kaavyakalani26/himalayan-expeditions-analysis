#### Preamble ####
# Purpose: Tests the analysis data
# Author: Kaavya Kalani
# Date: 6 April 2024
# Contact: kaavya.kalani@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 01-data_cleaning.R

#### Workspace setup ####
library(tidyverse)

print("Testing analysis data")

analysis_data <- read.csv("data/analysis_data/expeditions.csv")

# Test 1: Check for missing data
if (any(is.na(analysis_data))) {
  print("There are missing data.")
} else {
  print("There are no missing data.")
}

# Test 2: Check the number of columns
if (ncol(analysis_data) == 9) {
  print("Number of columns is 9.")
} else {
  print("Number of columns is not 9.")
}

# Test 3: Check the values in the height column are all positive
if (all(analysis_data$height > 0)) {
  print("Values in the 'height' column are positive.")
} else {
  print("There are invalid values in the 'height' column.")
}

# Test 4: Check the values in the seasons column are all valid
seasons <- c("Autumn", "Spring", "Winter", "Summer")
if (all(analysis_data$seasons %in% seasons)) {
  print("Values in the 'seasons' column are valid")
} else {
  print("There are invalid values in the 'seasons' column.")
}

# Test 5: Check the values in the sex column are all valid
if (all(analysis_data$sex %in% c('M', 'F'))) {
  print("Values in the 'sex' column are valid")
} else {
  print("There are invalid values in the 'sex' column.")
}

# Test 6: Check the values in the age column are all valid
if (all(analysis_data$age > 0)) {
  print("Values in the 'age' column are valid")
} else {
  print("There are invalid values in the 'age' column.")
}

# Test 7: Check the values in the success column are all valid
if (all(analysis_data$success %in% c(TRUE, FALSE))) {
  print("Values in the 'success' column are valid")
} else {
  print("There are invalid values in the 'success' column.")
}

# Test 8: Check the values in the solo column are all valid
if (all(analysis_data$solo %in% c(TRUE, FALSE))) {
  print("Values in the 'solo' column are valid")
} else {
  print("There are invalid values in the 'solo' column.")
}

# Test 9: Check the values in the died column are all valid
if (all(analysis_data$died %in% c(TRUE, FALSE))) {
  print("Values in the 'died' column are valid")
} else {
  print("There are invalid values in the 'died' column.")
}

# Test 10: Check the values in the members column are all valid
if (all(analysis_data$members > 0)) {
  print("Values in the 'members' column are valid")
} else {
  print("There are invalid values in the 'members' column.")
}

