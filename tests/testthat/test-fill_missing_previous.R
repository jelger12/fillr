context("test-fill_missing_previous")

test_that("filling works", {
  expect_equal(fill_missing_previous(c(1, 2, NA)), c(1, 2, 2))
})

test_that("starting NA is not filled", {
    expect_equal(fill_missing_previous(c(NA, 1, 2)), c(NA, 1, 2))
})

test_that("repeating NA's are filled", {
    expect_equal(fill_missing_previous(c(1, NA, NA)), c(1, 1, 1))
})

test_that("different NA's are filled", {
    expect_equal(fill_missing_previous(c(1, NA, 2, NA)), c(1, 1, 2, 2))
})
