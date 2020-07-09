library(dplyr)
library(testthat)

context("Reading Amazon Customer Reviews from a TSV file")

get_samples_file_path <- function() {
  return(file.path(here("inst/testdata"), "amazon_reviews_us_Tools_sample_50.tsv"))
}

test_that("Expected columns are present", {
  expected_columns <- c(
    "marketplace",
    "customer_id",
    "review_id",
    "product_id",
    "product_parent",
    "product_title",
    "product_category",
    "star_rating",
    "helpful_votes",
    "total_votes",
    "vine",
    "verified_purchase",
    "review_headline",
    "review_body",
    "review_date"
  )
  actual_columns <- colnames(read_review_file(get_samples_file_path()))
  expect_gte(length(actual_columns), length(expected_columns))
  expect_true(all(expected_columns %in% actual_columns))
})

test_that("'verified_purchase' column has logical values", {
  actual_reviews <- read_review_file(get_samples_file_path())
  expect_true(is.logical(actual_reviews$verified_purchase))
  expect_true(any(actual_reviews$verified_purchase))   # some values are true
  expect_false(all(actual_reviews$verified_purchase))  # some values are false
})
