#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Australian 
  #electoral divisions dataset.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(dplyr)

simulation <- read_csv("data/00-simulated_data/simulated_data.csv")

#### Test data ####
test_that("simulation data contains no NA values", {
  expect_false(any(is.na(simulation)))
})

# Test that `nowtime` is within the year 2024
test_that("nowtime is within the year 2024", {
  expect_true(all(simulation$nowtime >= as.POSIXct("2024-01-01 00:00:00") &
                    simulation$nowtime <= as.POSIXct("2024-12-31 23:59:59")))
})

# Test that `vendor` values are within the predefined list
test_that("vendor values are valid", {
  vendor_values <- c("Galleria", "NoFrills", "Voila", "Loblaws", "Metro", "SaveOnFoods", "TandT", "Walmart")
  expect_true(all(simulation$vendor %in% vendor_values))
})

# Test that `product_name` values are within the predefined list
test_that("product_name values are valid", {
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
  expect_true(all(simulation$product_name %in% product_name))
})


# Test that `product_id` is within the specified range
test_that("product_id is within the specified range", {
  expect_true(all(simulation$product_id >= 10000 & simulation$product_id <= 20000))
})

# Test that `current_price` and `old_price` are within reasonable ranges
test_that("current_price is within expected range", {
  expect_true(all(simulation$current_price >= 3.00 & simulation$current_price <= 6.50))
})

test_that("old_price is within expected range", {
  expect_true(all(simulation$old_price >= 3.00 & simulation$old_price <= 6.50))
})

# Test that `units` values are within the predefined list
test_that("units values are valid", {
  units_values <- c("EA", "275g", "200g", "59g", "Value Size275g", "Potato Chips200g", "200GM", "275GM")
  expect_true(all(simulation$units %in% units_values))
})

# Test that `other` values are within the predefined list
test_that("other values are valid", {
  other_values <- c("Out of Stock", "SALE", "SCENE+ Buy 1 Earn 150 Points", "sale\n$5.00 MIN 2", 
                    "Low Stock", "$4.29", "$3.99", "sale", "sale\n$3.99", 
                    "2 for $11", "2 for $9", "Best seller", "Save now", "Out of stock", "Rollback")
  expect_true(all(simulation$other %in% other_values))
})
