context("test-fill_missing_max")

test_that("filling with minimum works", {
    expect_equal(fill_missing_max(c(1, 2, NA)), c(1, 2, 2))
})

test_that("negative numbers work", {
    expect_equal(fill_missing_max(c(-1, 0, 1, NA)), c(-1, 0, 1, 1))
})
