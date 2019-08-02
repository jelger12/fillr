
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fillr

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/jelger12/fillr.svg?branch=master)](https://travis-ci.org/jelger12/fillr)
[![Codecov test
coverage](https://codecov.io/gh/jelger12/fillr/branch/master/graph/badge.svg)](https://codecov.io/gh/jelger12/fillr?branch=master)

<!-- badges: end -->

Fillr is an R package. The goal of fillr is to edit vectors to fill
missing values, based on the vector itself. These functions are best
used on variables within a grouped data frame.

## Installation

Fillr is on CRAN, you can install the stable release using

``` r
# Install release version from CRAN
intall.packages("fillr")

# Install development version from GitHub
devtools::install_github("jelger12/fillr")
```

## Example

When you want to fill values in a vector with another value, the fillr
functions can be used to impute all NA values based on some set rules.

Fill the NA values with the minimum, maximum or last value

``` r
fill_missing_min(c(1, 2, 1, 1, NA))
#> [1] 1 2 1 1 1
fill_missing_max(c(1, 2, 1, 1, NA))
#> [1] 1 2 1 1 2
fill_missing_last(c(1, NA, 1, 2, NA))
#> [1] 1 2 1 2 2
```

Fill the NA values with the same value, only when all non-NA values are
the same

``` r
fill_missing_strict(c(1, NA, 1, 1, NA))
#> [1] 1 1 1 1 1
fill_missing_strict(c("a", NA, "a", "a", NA))
#> [1] "a" "a" "a" "a" "a"
```

Fill the NA values with the previous value (repeating with multiple
repeating NA values)

``` r
fill_missing_previous(c(1, NA, 1, 2, NA, NA))
#> [1] 1 1 1 2 2 2
```

## Example within a grouped data frame

Fillr is best used within a grouped data frame. You can use the
`fill_missing_` functions to fill the missing values within the groups.

``` r
# Use tibble and dplyr for this example
library(tibble)
library(dplyr)
```

``` r
# Create a tibble with missing values
df <-tibble(group = c("a", "a", "a", "b", "b", "b"),
            value = c(NA, 1 , NA, 5, 6, NA)) 
df
#> # A tibble: 6 x 2
#>   group value
#>   <chr> <dbl>
#> 1 a        NA
#> 2 a         1
#> 3 a        NA
#> 4 b         5
#> 5 b         6
#> 6 b        NA

# Use fillr functions to fill the missing data 
df %>% 
  group_by(group) %>% 
  mutate(value_strict    = fill_missing_strict(value),
         value_min       = fill_missing_min(value),
         value_previous  = fill_missing_previous(value))
#> # A tibble: 6 x 5
#> # Groups:   group [2]
#>   group value value_strict value_min value_previous
#>   <chr> <dbl>        <dbl>     <dbl>          <dbl>
#> 1 a        NA            1         1             NA
#> 2 a         1            1         1              1
#> 3 a        NA            1         1              1
#> 4 b         5            5         5              5
#> 5 b         6            6         6              6
#> 6 b        NA           NA         5              6
```
