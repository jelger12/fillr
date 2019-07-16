context("test-fill_missing_strict")

test_that("filling works", {
  expect_equal(fill_missing_strict(c(NA, 1)), c(1, 1))
})

test_that("filling doesn't happen when not all values are equal", {
    expect_equal(fill_missing_strict(c(NA, 1, 2)), c(NA, 1, 2))
})

test_that("filling doesn't happen when no values are known", {
    expect_equal(fill_missing_strict(c(NA, NA)), c(NA, NA))
})
