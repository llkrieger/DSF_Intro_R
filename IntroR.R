# Title: Introduction to R
# Author: Greg Chism
# Date: 2022-10-18
# Description: DSF Intro to R Session

# Setup required packages
# Penguins dataset
install.packages("palmerpenguins", dependencies = TRUE)

# HTML tables
install.packages("formattable")

# Load all required packages
library(palmerpenguins)
library(formattable)
library(tidyverse)


# Load and examine data
data("penguins")

# First 6 rows
head(penguins)

# First and last 6 rows HTML table
formattable(head(penguins))

formattable(tail(penguins))

# Summary statistics
summary(penguins)

# Tidyverse
# %>% Tidyverse pipe
# |> Base R Pipe

penguins |>
  group_by(species) |>
  select(bill_length_mm) |>
  filter(bill_length_mm > 39.23) |>
  arrange(desc(bill_length_mm)) |>
  head()

# Plotting in ggplot()
# Boxplot
penguins |>
  ggplot(aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot() +
  theme_minimal(base_size = 16) +
  xlab(NULL) +
  ylab("Bill length (mm)") +
  theme(legend.position = "none") +
  ggtitle("Penguin species bill lengths")

# Regression plot
penguins |>
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_smooth(method = "lm", se = FALSE) +
  geom_point() +
  theme_minimal(base_size = 16) +
  xlab("Bill length (mm)") +
  ylab("Bill depth (mm)") +
  ggtitle("Relationship between bill length and depth")

# Write .csv
# Log transform a dataset
penguins_bill_length <- penguins |>
  group_by(species) |>
  select(bill_length_mm) |>
  filter(bill_length_mm > 39.23) |>
  arrange(desc(bill_length_mm)) |>
  rename(Species = species) |>
  mutate(Log_bill_length = log(bill_length_mm))

# Write a new .csv
write.csv(penguins_bill_length, "penguins_bill_length.csv", row.names = FALSE)

# Read in a .csv
penguins_bill_length1 <- read.csv("penguins_bill_length.csv")


