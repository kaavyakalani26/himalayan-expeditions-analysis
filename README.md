# Himalayan Expeditions Analysis

## Overview

The study analyses the relationship between different demographic, environmental and geographic factors and the successfulness of an attempt to summit a peak. Data from Himalayan expeditions in Nepal from 1905 through Spring 2019 is used and a Bayesian Logistic Regression model is leveraged to analyse the trends and factors influencing a successful summit. This study contributes to better understand the factors contributing to a successful summit and and helps for future expedition planning, risk management, and safety protocols.

To use this folder, click the green "Code" button", then "Download ZIP". Move the downloaded folder to where you want to work on your own computer, and then modify it to suit.

## File Structure
The repo is structured as:

-   `data/raw_data` contains the raw datasets downloaded from https://github.com/tacookson/data/tree/master/himalayan-expeditions. The cleaned datasets `expeditions.csv`, `members.csv` and `peaks.csv` are used as raw data.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `data/predictions` contains the predicted success probabilities.
-   `models` contains fitted the model.
-   `other/datasheet` contains the datasheet for the cleaned analysis dataset which I created for my study.
-   `other/sketches` contains the sketches for dataset and graphs.
-   `other/llm` contains the LLM conversation.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to load all necessary packages for replication, simulate, clean, test, model data and make predictions.

## Statement on LLM usage
ChatGPT v3.5 was used to create functions for repeated code. The entire chat history is available in `other/llm/usage.txt`
