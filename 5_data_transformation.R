# ============================================================
# Exploratory Data Analysis (EDA)
# Phase 1 - Task 5: Data Transformation
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
# Load Cleaned Dataset
# ============================================================

battery <- read_csv("lithium_ion_cleaned.csv")

cat("Dataset Loaded Successfully!\n\n")

# ============================================================
# Display Dataset Structure
# ============================================================

str(battery)

# ============================================================
# Feature Engineering
# Create Energy Density Index
# ============================================================

battery$Energy_Density_Index <-
  battery$Density..gm.cc. * battery$Band.Gap..eV.

cat("\nNew Feature Created : Energy_Density_Index\n")

# ============================================================
# Create Material Category
# ============================================================

battery$Material_Category <-
  ifelse(
    battery$Band.Gap..eV. >= median(battery$Band.Gap..eV.),
    "High Band Gap",
    "Low Band Gap"
  )

battery$Material_Category <-
  as.factor(battery$Material_Category)

cat("New Feature Created : Material_Category\n")

# ============================================================
# Min-Max Normalization
# ============================================================

min_max <- function(x){
  (x-min(x))/(max(x)-min(x))
}

battery$FormationEnergy_Normalized <-
  min_max(battery$Formation.Energy..eV.)

battery$BandGap_Normalized <-
  min_max(battery$Band.Gap..eV.)

battery$Density_Normalized <-
  min_max(battery$Density..gm.cc.)

battery$Volume_Normalized <-
  min_max(battery$Volume)

cat("\nMin-Max Normalization Completed.\n")

# ============================================================
# Z-Score Standardization
# ============================================================

battery$FormationEnergy_Zscore <-
  as.numeric(scale(battery$Formation.Energy..eV.))

battery$BandGap_Zscore <-
  as.numeric(scale(battery$Band.Gap..eV.))

battery$Density_Zscore <-
  as.numeric(scale(battery$Density..gm.cc.))

battery$Volume_Zscore <-
  as.numeric(scale(battery$Volume))

cat("Z-Score Standardization Completed.\n")

# ============================================================
# Log Transformation
# ============================================================

battery$FormationEnergy_Log <-
  log1p(abs(battery$Formation.Energy..eV.))

battery$BandGap_Log <-
  log1p(battery$Band.Gap..eV.)

battery$Density_Log <-
  log1p(battery$Density..gm.cc.)

battery$Volume_Log <-
  log1p(battery$Volume)

cat("Log Transformation Completed.\n")

# ============================================================
# Convert Categorical Variables to Factors
# ============================================================

battery$Formula <-
  as.factor(battery$Formula)

battery$Spacegroup <-
  as.factor(battery$Spacegroup)

battery$Crystal.System <-
  as.factor(battery$Crystal.System)

battery$Has.Bandstructure <-
  as.factor(battery$Has.Bandstructure)

cat("Categorical Variables Converted to Factors.\n")

# ============================================================
# Display Updated Dataset Structure
# ============================================================

cat("\nUpdated Dataset Structure:\n")
str(battery)

# ============================================================
# Preview First Six Records
# ============================================================

cat("\nFirst Six Records:\n")
head(battery)

# ============================================================
# Summary Statistics
# ============================================================

cat("\nSummary of Transformed Dataset:\n")
summary(battery)

# ============================================================
# Save Transformed Dataset
# ============================================================

write_csv(
  battery,
  "lithium_ion_transformed.csv"
)

cat("\nTransformed Dataset Saved Successfully!\n")
cat("File Name : lithium_ion_transformed.csv\n")

# ============================================================
# END OF TASK 5
# ============================================================