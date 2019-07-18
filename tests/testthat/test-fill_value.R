context("test-fill_value")

test_that("filling works with numeric", {
  expect_equal(fill_value(c(NA, 1), 2), c(2, 1))
})

test_that("filling works with character", {
    expect_equal(fill_value(c(NA, "a"), "b"), c("b", "a"))
})

test_that("error when a vector is given as value", {
    expect_error(fill_value(c(NA, 1), c(1, 1)), regexp = "length")
})

test_that("error when classes of x and value do not match", {
    expect_error(fill_value(c(NA, 1), "a"), regexp = "class")
})
