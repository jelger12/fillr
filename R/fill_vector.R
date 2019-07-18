#' fill_vector_strict
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without na's
fill_vector_strict <- function(x, x_na_omit) {
    ## Only fill missing if all non-missing values are the same
    if (length(unique(x_na_omit)) == 1) {
        ## use fill_value with the only non- missing value
        return(fill_value(x, x_na_omit[1]))
    }
    x
}

#' fill_vector_last
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without na's
fill_vector_last <- function(x, x_na_omit) {
    ## use fill_value with the last known value
    fill_value(x, x_na_omit[length(x_na_omit)])
}


#' fill_vector_min
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without na's
fill_vector_min <- function(x, x_na_omit) {
    ## use fill_value with the minimum value
    fill_value(x, min(unique(x_na_omit)))
}

#' fill_vector_max
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without na's
fill_vector_max <- function(x, x_na_omit) {
    ## use fill_value with the maximum value
    fill_value(x, max(unique(x_na_omit)))
}

#' fill_vector_previous
#'
#' @param x the vector to be filled
fill_vector_previous <- function(x) {
    ## Determine the posisition of NA's
    position_not_na <- which(!is.na(x))
    ## When the vector starts with NA we add the first position, because we
    ## are not able to fill this value
    if (is.na(x[1]))
        position_not_na <- c(1, position_not_na)
    ## determine how often a value has to be repeated within the vector
    rep_times <- diff(c(position_not_na, length(x) + 1))
    ## repeat the value at the determined positions
    rep(x[position_not_na], times = rep_times)
}


