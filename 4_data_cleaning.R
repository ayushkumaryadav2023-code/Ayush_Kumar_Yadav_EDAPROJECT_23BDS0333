# ============================================================
# Exploratory Data Analysis (EDA)
# Phase 1 - Task 4: Data Cleaning
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
library(stringr)

# ============================================================
# Set Working Directory
# ============================================================

setwd("C:/Users/anind/OneDrive/Documents/EDA_PROJECT_23BDS0333")

# ============================================================
# Load Dataset
# ============================================================

battery <- read_csv("lithium_ion_missing_handled.csv")

cat("Dataset Loaded Successfully!\n\n")

# ============================================================
# Dataset Dimensions Before Cleaning
# ============================================================

cat("Dimensions Before Cleaning:\n")
print(dim(battery))

# ============================================================
# Check Duplicate Rows
# ============================================================

duplicate_rows <- sum(duplicated(battery))

cat("\nNumber of Duplicate Rows:\n")
print(duplicate_rows)

# ============================================================
# Remove Duplicate Rows
# ============================================================

battery <- battery %>%
  distinct()

cat("\nDuplicate Rows Removed Successfully.\n")

# ============================================================
# Dataset Dimensions After Removing Duplicates
# ============================================================

cat("\nDimensions After Removing Duplicates:\n")
print(dim(battery))

# ============================================================
# Remove Leading and Trailing Spaces
# ============================================================

battery <- battery %>%
  mutate(across(where(is.character), str_trim))

cat("\nLeading and Trailing Spaces Removed.\n")

# ============================================================
# Convert Character Columns to Lowercase
# ============================================================

battery <- battery %>%
  mutate(across(where(is.character), str_to_lower))

cat("\nCharacter Values Converted to Lowercase.\n")

# ============================================================
# Standardize Column Names
# ============================================================

colnames(battery) <- make.names(colnames(battery))

cat("\nColumn Names Standardized.\n")

# ============================================================
# Convert Categorical Variables to Factors
# ============================================================

battery$Formula <- as.factor(battery$Formula)
battery$Spacegroup <- as.factor(battery$Spacegroup)
battery$Has.Bandstructure <- as.factor(battery$Has.Bandstructure)
battery$Crystal.System <- as.factor(battery$Crystal.System)

cat("\nCategorical Variables Converted to Factors.\n")

# ============================================================
# Check Missing Values
# ============================================================

cat("\nMissing Values:\n")
print(colSums(is.na(battery)))

# ============================================================
# Check Unique Values
# ============================================================

cat("\nUnique Values Per Column:\n")
print(sapply(battery, function(x) length(unique(x))))

# ============================================================
# Final Dataset Structure
# ============================================================

cat("\nFinal Dataset Structure:\n")
str(battery)

# ============================================================
# Dataset Dimensions After Cleaning
# ============================================================

cat("\nFinal Dataset Dimensions:\n")
print(dim(battery))

# ============================================================
# Save Cleaned Dataset
# ============================================================

write_csv(
  battery,
  "lithium_ion_cleaned.csv"
)

cat("\nCleaned Dataset Saved Successfully!\n")
cat("File Name : lithium_ion_cleaned.csv\n")

# ============================================================
# END OF TASK 4
# ============================================================