context("test-fill_missing_interval")

test_that("filling works with interval 1, 2, NA, NA", {
    expect_equal(fill_missing_interval(c(1,2,NA,NA)), c(1,2,3,4))
})

test_that("filling works for missing values within the interval", {
    expect_equal(fill_missing_interval(c(1,2,NA,4)), c(1,2,3,4))
})

test_that("filling works for missing values before the interval", {
    expect_equal(fill_missing_interval(c(NA,NA,3,4)), c(1,2,3,4))
})

test_that("filling works for negative values", {
    expect_equal(fill_missing_interval(c(NA,NA,1,2)), c(-1,0,1,2))
})

test_that("filling doesn't happen when interval is not equal between values", {
    expect_equal(fill_missing_interval(c(1,2,4,NA)),c(1,2,4,NA))
})

test_that("filling doesn't happen when no values are known", {
    expect_equal(fill_missing_interval(c(NA, NA)), c(NA, NA))
})

