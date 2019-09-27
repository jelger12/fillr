#' fill_vector_strict
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without NA values
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
#' @param x_na_omit the x vector without NA values
fill_vector_last <- function(x, x_na_omit) {
    ## use fill_value with the last known value
    fill_value(x, x_na_omit[length(x_na_omit)])
}


#' fill_vector_min
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without NA values
fill_vector_min <- function(x, x_na_omit) {
    ## use fill_value with the minimum value
    fill_value(x, min(unique(x_na_omit)))
}

#' fill_vector_max
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without NA values
fill_vector_max <- function(x, x_na_omit) {
    ## use fill_value with the maximum value
    fill_value(x, max(unique(x_na_omit)))
}

#' fill_vector_previous
#'
#' @param x the vector to be filled
fill_vector_previous <- function(x) {
    ## Determine the posisition of NA values
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


#' fill_vector_interval
#'
#' @param x the vector to be filled
fill_vector_interval <- function(x) {
    ## Determine the posisition of NA values
    position_not_na <- which(!is.na(x))

    ## Create a shifted vector, to calculate the difference with the previous
    ## value
    vector_lead <- c(NA, x[1:(length(x) - 1)])
    ## Calculate the interval for each item
    vector_intervals <- x - vector_lead

    ## Determine all unique interval values
    vector_interval <- unique(stats::na.omit(vector_intervals))
    ## If the interval is not the same for each item, return the the x: don't
    ## fill this vector
    if (length(vector_interval) != 1) {
        return(x)
    }

    ## Determine the first posisition of not-NA values
    first_position_not_na <- which(!is.na(x))[1]
    first_value <- x[first_position_not_na]

    ## The number of NA-values the vector starts with
    number_na_start <- first_position_not_na - 1

    ## The value of the first item in the vector is calculated with
    ## the first known value and the number of NA values before that value
    value_pos_1 <- first_value - number_na_start * vector_interval

    ## Create the sequence
    x_new <- seq(value_pos_1, length.out = length(x), by = vector_interval)

    ## Test whether the sequence of all non-missing values in x is identical
    ## tot the new vector
    if (!identical(x[which(!is.na(x))], x_new[which(!is.na(x))])) {
        return(x)
    }
    x_new

}


