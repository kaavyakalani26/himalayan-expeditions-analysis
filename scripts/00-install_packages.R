#### Preamble ####
# Purpose: Install all necessary packages for this paper's replication
# Author: Kaavya Kalani
# Date: 18 April 2024
# Contact: kaavya.kalani@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

# List of packages to install
packages <- c(
  "tidyverse",
  "rstanarm",
  "broom.mixed",
  "dplyr",
  "knitr",
  "ggplot2",
  "here",
  "kableExtra",
  "arrow"
)

# Install packages if they are not already installed
for (package in packages) {
  if (!requireNamespace(package, quietly = TRUE)) {
    install.packages(package, dependencies = TRUE)
  }
}
