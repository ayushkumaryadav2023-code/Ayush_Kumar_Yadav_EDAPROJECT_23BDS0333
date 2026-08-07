# ============================================================
# Exploratory Data Analysis (EDA)
# Phase 1 - Task 7: Bivariate Analysis
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
# Plot 1 : Scatter Plot
# Formation Energy vs Band Gap
# ============================================================

p1 <- ggplot(battery,
             aes(x = Formation.Energy..eV.,
                 y = Band.Gap..eV.)) +
  geom_point(color="steelblue",
             size=3,
             alpha=0.7) +
  labs(title="Formation Energy vs Band Gap",
       x="Formation Energy (eV)",
       y="Band Gap (eV)") +
  theme_minimal()

print(p1)

ggsave("plots/bivariate_scatter_energy_bandgap.png",
       p1,
       width=7,
       height=5)

# ============================================================
# Plot 2 : Scatter Plot
# Density vs Volume
# ============================================================

p2 <- ggplot(battery,
             aes(x=Density..gm.cc.,
                 y=Volume)) +
  geom_point(color="darkgreen",
             size=3,
             alpha=0.7) +
  labs(title="Density vs Volume",
       x="Density (gm/cc)",
       y="Volume") +
  theme_minimal()

print(p2)

ggsave("plots/bivariate_scatter_density_volume.png",
       p2,
       width=7,
       height=5)

# ============================================================
# Plot 3 : Boxplot
# Band Gap by Crystal System
# ============================================================

p3 <- ggplot(battery,
             aes(x=Crystal.System,
                 y=Band.Gap..eV.,
                 fill=Crystal.System)) +
  geom_boxplot() +
  labs(title="Band Gap by Crystal System",
       x="Crystal System",
       y="Band Gap (eV)") +
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45,hjust=1))

print(p3)

ggsave("plots/bivariate_boxplot_bandgap_crystal.png",
       p3,
       width=8,
       height=5)

# ============================================================
# Plot 4 : Violin Plot
# Formation Energy by Crystal System
# ============================================================

p4 <- ggplot(battery,
             aes(x=Crystal.System,
                 y=Formation.Energy..eV.,
                 fill=Crystal.System)) +
  geom_violin(trim=FALSE) +
  labs(title="Formation Energy by Crystal System",
       x="Crystal System",
       y="Formation Energy (eV)") +
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45,hjust=1))

print(p4)

ggsave("plots/bivariate_violin_energy_crystal.png",
       p4,
       width=8,
       height=5)

# ============================================================
# Plot 5 : Grouped Bar Chart
# Crystal System vs Has Bandstructure
# ============================================================

p5 <- ggplot(battery,
             aes(x=Crystal.System,
                 fill=Has.Bandstructure)) +
  geom_bar(position="dodge") +
  labs(title="Crystal System vs Has Bandstructure",
       x="Crystal System",
       y="Count") +
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45,hjust=1))

print(p5)

ggsave("plots/bivariate_groupedbar_crystal_bandstructure.png",
       p5,
       width=8,
       height=5)

# ============================================================
# Plot 6 : Scatter Plot with Regression Line
# ============================================================

p6 <- ggplot(battery,
             aes(Formation.Energy..eV.,
                 Band.Gap..eV.)) +
  geom_point(color="red",
             size=3) +
  geom_smooth(method="lm",
              color="black",
              se=FALSE) +
  labs(title="Regression: Formation Energy vs Band Gap",
       x="Formation Energy (eV)",
       y="Band Gap (eV)") +
  theme_minimal()

print(p6)

ggsave("plots/bivariate_regression_energy_bandgap.png",
       p6,
       width=7,
       height=5)

# ============================================================
# Correlation Matrix
# ============================================================

numeric_data <- battery %>%
  select(where(is.numeric))

cat("\nCorrelation Matrix:\n")
print(round(cor(numeric_data),2))

# ============================================================
# End of Task 7
# ============================================================

cat("\nBivariate Analysis Completed Successfully!\n")
cat("Graphs have been saved in the 'plots' folder.\n")