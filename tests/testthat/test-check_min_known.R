context("test-check_min_known")

test_that("known n => min known n", {
    expect_equal(fill_missing_strict(c(1, 1, 1, NA), min_known_n = 3), c(1, 1, 1, 1))
})

test_that("known n < min known n", {
    expect_equal(fill_missing_strict(c(1, 1, NA, NA), min_known_n = 3), c(1, 1, NA, NA))
})

test_that("known p => min known p", {
    expect_equal(fill_missing_strict(c(1, 1, 1, NA), min_known_p = 0.75), c(1, 1, 1, 1))
})

test_that("known p < min known p", {
    expect_equal(fill_missing_strict(c(1, 1, NA, NA), min_known_p = 0.75,), c(1, 1, NA, NA))
})

test_that("known p < min known p and known n => min known n", {
    expect_equal(fill_missing_strict(c(1, 1, NA, NA), min_known_p = 0.75, min_known_n = 2), c(1, 1, NA, NA))
})

test_that("known p => min known p and known n < min known n", {
    expect_equal(fill_missing_strict(c(1, 1, NA, NA), min_known_p = 0.5, min_known_n = 3), c(1, 1, NA, NA))
})
