# ============================================================
# Exploratory Data Analysis (EDA)
# Phase 1 - Task 2: Basic Statistical Analysis
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
# BASIC INFORMATION
# ============================================================

cat("Number of Rows :", nrow(battery), "\n")
cat("Number of Columns :", ncol(battery), "\n\n")

cat("Column Names:\n")
print(colnames(battery))

cat("\nStructure of Dataset:\n")
str(battery)

# ============================================================
# SUMMARY STATISTICS
# ============================================================

cat("\nSummary of Dataset:\n")
summary(battery)

# ============================================================
# SELECT NUMERIC COLUMNS
# ============================================================

numeric_data <- battery %>%
  select(where(is.numeric))

cat("\nNumeric Columns:\n")
print(colnames(numeric_data))

# ============================================================
# MEAN
# ============================================================

cat("\nMean:\n")
print(sapply(numeric_data, mean, na.rm = TRUE))

# ============================================================
# MEDIAN
# ============================================================

cat("\nMedian:\n")
print(sapply(numeric_data, median, na.rm = TRUE))

# ============================================================
# STANDARD DEVIATION
# ============================================================

cat("\nStandard Deviation:\n")
print(sapply(numeric_data, sd, na.rm = TRUE))

# ============================================================
# VARIANCE
# ============================================================

cat("\nVariance:\n")
print(sapply(numeric_data, var, na.rm = TRUE))

# ============================================================
# MINIMUM VALUES
# ============================================================

cat("\nMinimum Values:\n")
print(sapply(numeric_data, min, na.rm = TRUE))

# ============================================================
# MAXIMUM VALUES
# ============================================================

cat("\nMaximum Values:\n")
print(sapply(numeric_data, max, na.rm = TRUE))

# ============================================================
# RANGE
# ============================================================

cat("\nRange:\n")
print(sapply(numeric_data, range, na.rm = TRUE))

# ============================================================
# INTERQUARTILE RANGE
# ============================================================

cat("\nInterquartile Range (IQR):\n")
print(sapply(numeric_data, IQR, na.rm = TRUE))

# ============================================================
# QUANTILES
# ============================================================

cat("\nQuantiles:\n")
print(sapply(numeric_data, quantile, na.rm = TRUE))

# ============================================================
# FREQUENCY DISTRIBUTIONS
# ============================================================

cat("\nFrequency Distribution - Crystal System\n")
print(table(battery$`Crystal System`))

cat("\nFrequency Distribution - Spacegroup\n")
print(table(battery$Spacegroup))

cat("\nFrequency Distribution - Has Bandstructure\n")
print(table(battery$`Has Bandstructure`))

# ============================================================
# UNIQUE VALUES
# ============================================================

cat("\nNumber of Unique Values in Each Column:\n")
print(sapply(battery, function(x) length(unique(x))))

# ============================================================
# MISSING VALUES
# ============================================================

cat("\nMissing Values in Each Column:\n")
print(colSums(is.na(battery)))

# ============================================================
# DATA TYPES
# ============================================================

cat("\nData Types:\n")
print(sapply(battery, class))

# ============================================================
# CORRELATION MATRIX
# ============================================================

cat("\nCorrelation Matrix:\n")
print(round(cor(numeric_data),2))

# ============================================================
# END OF TASK 2
# ============================================================

cat("\nBasic Statistical Analysis Completed Successfully!\n")