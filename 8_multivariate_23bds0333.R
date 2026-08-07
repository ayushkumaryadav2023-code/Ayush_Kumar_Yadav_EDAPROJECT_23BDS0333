# ============================================================
# Exploratory Data Analysis (EDA)
# Phase 1 - Task 8: Multivariate Analysis
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
library(ggplot2)

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
# Plot 1 : Bubble Chart
# ============================================================

p1 <- ggplot(
  battery,
  aes(
    x = Formation.Energy..eV.,
    y = Band.Gap..eV.,
    size = Density..gm.cc.,
    color = Crystal.System
  )
) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Bubble Chart",
    x = "Formation Energy (eV)",
    y = "Band Gap (eV)"
  ) +
  theme_minimal()

print(p1)

ggsave(
  "plots/multivariate_bubble_chart.png",
  p1,
  width = 8,
  height = 6
)

# ============================================================
# Plot 2 : Correlation Heatmap (Base R)
# ============================================================

numeric_data <- battery %>%
  select(where(is.numeric))

corr_matrix <- cor(numeric_data)

png(
  "plots/multivariate_correlation_heatmap.png",
  width = 900,
  height = 700
)

heatmap(
  corr_matrix,
  Rowv = NA,
  Colv = NA,
  scale = "none",
  col = heat.colors(256),
  margins = c(8,8),
  main = "Correlation Heatmap"
)

dev.off()

heatmap(
  corr_matrix,
  Rowv = NA,
  Colv = NA,
  scale = "none",
  col = heat.colors(256),
  margins = c(8,8),
  main = "Correlation Heatmap"
)

# ============================================================
# Plot 3 : Scatter Matrix
# ============================================================

png(
  "plots/multivariate_scatter_matrix.png",
  width = 900,
  height = 900
)

pairs(
  numeric_data,
  main = "Scatter Matrix",
  pch = 19,
  col = "steelblue"
)

dev.off()

pairs(
  numeric_data,
  main = "Scatter Matrix",
  pch = 19,
  col = "steelblue"
)

# ============================================================
# Plot 4 : Faceted Scatter Plot
# ============================================================

p4 <- ggplot(
  battery,
  aes(
    Formation.Energy..eV.,
    Band.Gap..eV.,
    color = Crystal.System
  )
) +
  geom_point(size = 3) +
  facet_wrap(~Has.Bandstructure) +
  labs(
    title = "Formation Energy vs Band Gap"
  ) +
  theme_minimal()

print(p4)

ggsave(
  "plots/multivariate_faceted_scatter.png",
  p4,
  width = 10,
  height = 6
)

# ============================================================
# Plot 5 : Parallel Coordinate Plot
# ============================================================

parallel_data <- battery %>%
  select(
    Formation.Energy..eV.,
    Band.Gap..eV.,
    Density..gm.cc.,
    Volume
  )

png(
  "plots/multivariate_parallel_coordinates.png",
  width = 900,
  height = 700
)

matplot(
  scale(parallel_data),
  type = "l",
  lty = 1,
  col = rainbow(nrow(parallel_data)),
  xlab = "Variables",
  ylab = "Scaled Values",
  main = "Parallel Coordinate Plot"
)

axis(
  1,
  at = 1:4,
  labels = names(parallel_data)
)

dev.off()

matplot(
  scale(parallel_data),
  type = "l",
  lty = 1,
  col = rainbow(nrow(parallel_data)),
  xlab = "Variables",
  ylab = "Scaled Values",
  main = "Parallel Coordinate Plot"
)

axis(
  1,
  at = 1:4,
  labels = names(parallel_data)
)

# ============================================================
# Plot 6 : Multivariable Scatter Plot
# ============================================================

p6 <- ggplot(
  battery,
  aes(
    Formation.Energy..eV.,
    Band.Gap..eV.,
    color = Crystal.System,
    shape = Has.Bandstructure,
    size = Density..gm.cc.
  )
) +
  geom_point(alpha = 0.8) +
  labs(
    title = "Multivariable Scatter Plot"
  ) +
  theme_minimal()

print(p6)

ggsave(
  "plots/multivariate_scatter.png",
  p6,
  width = 9,
  height = 6
)

# ============================================================
# Correlation Matrix
# ============================================================

cat("\nCorrelation Matrix\n")
print(round(corr_matrix,2))

# ============================================================
# Dataset Summary
# ============================================================

cat("\nDataset Summary\n")
summary(battery)

# ============================================================
# Completion Message
# ============================================================

cat("\nMultivariate Analysis Completed Successfully!\n")
cat("All graphs have been saved in the 'plots' folder.\n")