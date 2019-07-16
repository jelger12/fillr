context("test-check_some_missing")

test_that("some missing", {
  expect_equal(check_some_missing(c(NA, 1)), TRUE)
})
test_that("all missing", {
    expect_equal(check_some_missing(c(NA, NA)), FALSE)
})
test_that("none missing", {
    expect_equal(check_some_missing(c(1, 2)), FALSE)
})
