
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fillr

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/jelger12/fillr.svg?branch=master)](https://travis-ci.org/jelger12/fillr)
[![Codecov test
coverage](https://codecov.io/gh/jelger12/fillr/branch/master/graph/badge.svg)](https://codecov.io/gh/jelger12/fillr?branch=master)

<!-- badges: end -->

The goal of fillr is to edit vectors to fill missing values, based on
the vector itself.

## Installation

You can install fillr from with:

``` r
devtools::install_github("jelger12/fillr")
```

## Example

When you want to fill values in a vector with another value, the fillr
functions can be used to impute all NA’s based on some set rules.

``` r
## basic example code
fillr::fill_missing_min(c(1, 2, 1, 1, NA))
#> [1] 1 2 1 1 1
fillr::fill_missing_max(c(1, 2, 1, 1, NA))
#> [1] 1 2 1 1 2
fillr::fill_missing_strict(c(1, NA, 1, 1, NA))
#> [1] 1 1 1 1 1
fillr::fill_missing_last(c(1, NA, 1, 2, NA))
#> [1] 1 2 1 2 2
fillr::fill_missing_previous(c(1, NA, 1, 2, NA))
#> [1] 1 1 1 2 2
```
