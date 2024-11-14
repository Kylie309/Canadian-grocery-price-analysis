#### Preamble ####
# Purpose: Tests the structure and validity of the analysis grocery data
# Author: Yunkai Gu & Anqi Xu & Yitong Wang
# Date: 14 November 2024
# Contact: kylie.gu@mail.utoronto.ca & anjojoo.xu@mail.utoronto.ca & stevenn.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - The `testthat` package must be installed and loaded

#### Workspace setup ####
library(tidyverse)
library(testthat)
library(dplyr)

analysis <- read_csv("data/02-analysis_data/grocery_cleaned_data.csv")

#### Test data ####
# Test that `nowtime` is within the year 2024 and contains no NA values
test_that("nowtime is within the year 2024 and has no NA values", {
  expect_true(all(analysis$nowtime >= as.POSIXct("2024-01-01 00:00:00") &
                    analysis$nowtime <= as.POSIXct("2024-12-31 23:59:59")))
  expect_false(any(is.na(analysis$nowtime)))
})

# Test that `vendor` values are within the predefined list and contains no NA values
test_that("vendor values are valid and has no NA values", {
  vendor_values <- c("Galleria", "NoFrills", "Voila", "Loblaws", "Metro", "SaveOnFoods", "TandT", "Walmart")
  expect_true(all(analysis$vendor %in% vendor_values))
  expect_false(any(is.na(analysis$vendor)))
})

# Test that `product_name` values are within the predefined list and contains no NA values
test_that("product_name values are valid and has no NA values", {
  product_name_values <- c(
    "MISS VICKIE`S ORIGINAL 200G", "Original Recipe kettle cooked potato chips 275g",
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
  expect_true(all(analysis$product_name %in% product_name_values))
  expect_false(any(is.na(analysis$product_name)))
})

# Test that `brand` values are within the predefined list, allowing NA values
test_that("brand values are valid and may have NA values", {
  brand_values <- c("Miss Vickies", "Miss Vickie's")
  expect_true(all(na.omit(analysis$brand) %in% brand_values))  # Check only non-NA values
})

# Test that `other` values are within the predefined list, allowing NA values
test_that("other values are valid and may have NA values", {
  other_values <- c("Out of Stock", "SALE", "SCENE+ Buy 1 Earn 150 Points", "sale\n$5.00 MIN 2", 
                    "Low Stock", "$4.29", "$3.99", "sale", "sale\n$3.99", 
                    "2 for $11", "2 for $9", "Best seller", "Save now", "Out of stock", "Rollback")
  expect_true(all(na.omit(analysis$other) %in% other_values))  # Check only non-NA values
})