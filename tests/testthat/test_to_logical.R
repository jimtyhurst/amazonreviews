library(testthat)

context("Converting strings to logical values")

test_that("Variants of y|yes are TRUE", {
  expect_true(yes_no_to_logical("y"))
  expect_true(yes_no_to_logical("yes"))
  expect_true(yes_no_to_logical("YES"))
  expect_true(yes_no_to_logical("yEs"))
})

test_that("Variants of n|no are FALSE", {
  expect_false(yes_no_to_logical("n"))
  expect_false(yes_no_to_logical("no"))
  expect_false(yes_no_to_logical("NO"))
  expect_false(yes_no_to_logical("nO"))
})

test_that("Unexpected values are FALSE", {
  expect_false(yes_no_to_logical("z"))
  expect_false(yes_no_to_logical("noz"))
  expect_false(yes_no_to_logical(""))
  expect_false(yes_no_to_logical("NA"))
  expect_false(yes_no_to_logical(NA))
})

