# ============================================================
# Exploratory Data Analysis (EDA)
# Phase 1 - Task 6: Univariate Analysis
# Student: Ayush Kumar Yadav
# Reg No: 23BDS0333
# ============================================================

# Clear Workspace
rm(list = ls())

# ============================================================
# Load Required Libraries
# ============================================================

library(readr)
library(ggplot2)
library(dplyr)

# ============================================================
# Set Working Directory
# ============================================================

setwd("C:/Users/anind/OneDrive/Documents/EDA_PROJECT_23BDS0333")

# ============================================================
# Load Dataset
# ============================================================

battery <- read_csv("lithium_ion_transformed.csv")

# ============================================================
# Create Folder for Plots
# ============================================================

if(!dir.exists("plots")){
  dir.create("plots")
}

# ============================================================
# Plot 1 : Histogram - Formation Energy
# ============================================================

p1 <- ggplot(battery,
             aes(Formation.Energy..eV.)) +
  geom_histogram(fill="steelblue",
                 color="black",
                 bins=20) +
  labs(title="Distribution of Formation Energy",
       x="Formation Energy (eV)",
       y="Frequency") +
  theme_minimal()

print(p1)

ggsave("plots/univariate_hist_formation_energy.png",
       p1,
       width=7,
       height=5)

# ============================================================
# Plot 2 : Histogram - Band Gap
# ============================================================

p2 <- ggplot(battery,
             aes(Band.Gap..eV.)) +
  geom_histogram(fill="orange",
                 color="black",
                 bins=20) +
  labs(title="Distribution of Band Gap",
       x="Band Gap (eV)",
       y="Frequency") +
  theme_minimal()

print(p2)

ggsave("plots/univariate_hist_band_gap.png",
       p2,
       width=7,
       height=5)

# ============================================================
# Plot 3 : Boxplot - Density
# ============================================================

p3 <- ggplot(battery,
             aes(y=Density..gm.cc.)) +
  geom_boxplot(fill="lightgreen") +
  labs(title="Boxplot of Density",
       y="Density (gm/cc)") +
  theme_minimal()

print(p3)

ggsave("plots/univariate_box_density.png",
       p3,
       width=6,
       height=5)

# ============================================================
# Plot 4 : Bar Chart - Crystal System
# ============================================================

p4 <- ggplot(battery,
             aes(Crystal.System)) +
  geom_bar(fill="purple") +
  labs(title="Distribution of Crystal System",
       x="Crystal System",
       y="Count") +
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45,hjust=1))

print(p4)

ggsave("plots/univariate_bar_crystal_system.png",
       p4,
       width=8,
       height=5)

# ============================================================
# Plot 5 : Bar Chart - Has Bandstructure
# ============================================================

p5 <- ggplot(battery,
             aes(Has.Bandstructure)) +
  geom_bar(fill="darkcyan") +
  labs(title="Has Bandstructure",
       x="Has Bandstructure",
       y="Count") +
  theme_minimal()

print(p5)

ggsave("plots/univariate_bar_bandstructure.png",
       p5,
       width=7,
       height=5)

# ============================================================
# Plot 6 : Bar Chart - Top 10 Spacegroups
# ============================================================

top_spacegroup <- battery %>%
  count(Spacegroup, sort=TRUE) %>%
  slice(1:10)

p6 <- ggplot(top_spacegroup,
             aes(reorder(Spacegroup,n),
                 n)) +
  geom_col(fill="brown") +
  coord_flip() +
  labs(title="Top 10 Spacegroups",
       x="Spacegroup",
       y="Count") +
  theme_minimal()

print(p6)

ggsave("plots/univariate_top10_spacegroup.png",
       p6,
       width=8,
       height=6)

# ============================================================
# Summary
# ============================================================

summary(battery)

cat("\nUnivariate Analysis Completed Successfully!\n")
cat("Plots saved inside 'plots' folder.\n")