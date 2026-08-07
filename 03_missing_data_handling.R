# ============================================================
# Exploratory Data Analysis (EDA)
# Phase 1 - Task 3: Handling Missing Data
# Student: Ayush Kumar Yadav
# Reg No: 23BDS0333
# ============================================================

# Clear Workspace
rm(list = ls())

# ============================================================
# Load Required Libraries
# ============================================================

library(readr)
library(dplyr)
library(tidyr)

# ============================================================
# Set Working Directory
# ============================================================

setwd("C:/Users/anind/OneDrive/Documents/EDA_PROJECT_23BDS0333")

# ============================================================
# Load Dataset
# ============================================================

battery <- read_csv("lithium_ion_23BDS0333.csv")

cat("Dataset Loaded Successfully!\n\n")

# ============================================================
# CHECK FOR MISSING VALUES
# ============================================================

cat("Missing Values in Each Column:\n")
print(colSums(is.na(battery)))

# ============================================================
# TOTAL MISSING VALUES
# ============================================================

total_missing <- sum(is.na(battery))

cat("\nTotal Missing Values :", total_missing, "\n")

# ============================================================
# PERCENTAGE OF MISSING VALUES
# ============================================================

missing_percentage <- colSums(is.na(battery)) /
  nrow(battery) * 100

cat("\nPercentage of Missing Values:\n")
print(round(missing_percentage,2))

# ============================================================
# DISPLAY COLUMNS WITH MISSING VALUES
# ============================================================

missing_columns <- names(battery)[colSums(is.na(battery)) > 0]

cat("\nColumns with Missing Values:\n")

if(length(missing_columns) == 0){
  cat("No Missing Values Found.\n")
}else{
  print(missing_columns)
}

# ============================================================
# HANDLE NUMERIC MISSING VALUES
# Replace with Median
# ============================================================

battery <- battery %>%
  mutate(across(where(is.numeric),
                ~replace_na(., median(., na.rm = TRUE))))

# ============================================================
# HANDLE CHARACTER MISSING VALUES
# Replace with "Unknown"
# ============================================================

battery <- battery %>%
  mutate(across(where(is.character),
                ~replace_na(., "Unknown")))

# ============================================================
# VERIFY MISSING VALUES AFTER HANDLING
# ============================================================

cat("\nMissing Values After Handling:\n")
print(colSums(is.na(battery)))

cat("\nTotal Missing Values After Handling:\n")
print(sum(is.na(battery)))

# ============================================================
# VERIFY DATASET
# ============================================================

if(sum(is.na(battery)) == 0){
  cat("\nDataset contains NO Missing Values.\n")
}else{
  cat("\nDataset still contains Missing Values.\n")
}

# ============================================================
# SAVE UPDATED DATASET
# ============================================================

write_csv(
  battery,
  "lithium_ion_missing_handled.csv"
)

cat("\nDataset Saved Successfully!\n")
cat("File Name : lithium_ion_missing_handled.csv\n")

# ============================================================
# END OF TASK 3
# ============================================================