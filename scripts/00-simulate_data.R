#### Preamble ####
# # Purpose: Simulates a dataset of grocery
# Author: Yunkai Gu & Anqi Xu & Yitong Wang
# Date: 21 November 2024
# Contact: kylie.gu@mail.utoronto.ca & anjojoo.xu@mail.utoronto.ca & stevenn.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed


#### Workspace setup ####
library(tidyverse)
set.seed(777)

#### Simulate data ####
vendor <- c("Galleria", "NoFrills", "Voila", "Loblaws", "Metro", "SaveOnFoods", "TandT", "Walmart")
product_name <- c(
  "MISS VICKIE`S ORIGINAL 200G",
  "Original Recipe kettle cooked potato chips 275g",
  "Miss Vickie's Kettle Cooked Potato Chips Original Recipe 200 g",
  "Miss Vickie's Kettle Cooked Potato Chips Original Recipe 275 g",
  "Original Recipe Kettle Cooked Potato Chips",
  "Original Recipe kettle cooked potato chips 200g",
  "Original Recipe Kettle Cooked Chips",
  "Original Recipe Kettle Cooked Chips, Value Pack",
  "Miss Vickies - Original Recipe Potato Chips, Value Size, 275 Gram",
  "Miss Vickies - Original Recipe, Potato Chips, 200 Gram",
  "Miss Vickies Original Recipe Chips 200g",
  "Miss Vickie's Original Recipe kettle cooked potato chips, 200GM",
  "Miss Vickie's Original Recipe kettle cooked potato chips, 275GM"
)

brand <- c( "Miss Vickies", "Miss Vickie's")
other <- c("Out of Stock", "SALE", "SCENE+ Buy 1 Earn 150 Points", "sale\n$5.00 MIN 2", "Low Stock", "$4.29", "$3.99", "sale", "sale\n$3.99", "2 for $11", "2 for $9", "Best seller", "Save now", "Out of stock", "Rollback")

# Set the number of rows for simulation
n <- 1780

# Simulate data using the defined variables and generating ranges for other variables
simulated_data <- tibble(
  nowtime = as.POSIXct("2024-01-01") + runif(n, 0, as.numeric(difftime(as.POSIXct("2024-12-31 23:59:59"), as.POSIXct("2024-01-01")))),
  vendor = sample(vendor, n, replace = TRUE),
  product_id = sample(10000:20000, n, replace = TRUE),
  product_name = sample(product_name, n, replace = TRUE),
  brand = sample(brand, n, replace = TRUE),
  current_price = round(runif(n, 3.00, 6.50), 2),
  old_price = round(runif(n, 3.00, 6.50), 2),  # Generating a similar price range for old_price
  units = sample(c("EA", "275g", "200g", "59g", "Value Size275g", "Potato Chips200g", "200GM", "275GM"), n, replace = TRUE),
  price_per_unit = paste0("$", round(runif(n, 1.50, 4.00), 2), "/100g"),
  other = sample(other, n, replace = TRUE)
)

write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")