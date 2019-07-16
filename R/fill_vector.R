#' fill_vector.strict
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without na's
fill_vector.strict <- function(x, x_na_omit) {
    ## Only fill missing if all non-missing values are the same
    if (length(unique(x_na_omit)) == 1) {
        ## use coalesce with the only non- missing value
        x <- fill_value(x, x_na_omit[1])
    }
    x
}

#' fill_vector.last
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without na's
fill_vector.last <- function(x, x_na_omit) {
    fill_value(x, x_na_omit[length(x_na_omit)])
}


#' fill_vector.min
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without na's
fill_vector.min <- function(x, x_na_omit) {
    fill_value(x, min(unique(x_na_omit)))
}

#' fill_vector.max
#'
#' @param x the vector to be filled
#' @param x_na_omit the x vector without na's
fill_vector.max <- function(x, x_na_omit) {
    fill_value(x, max(unique(x_na_omit)))
}

#' fill_vector.previous
#'
#' @param x the vector to be filled
fill_vector.previous <- function(x) {
    ## Bepaal posities van NA's
    position_na <- which(!is.na(x))
    ## Als vector met NA begint dan:
    if (is.na(x[1]))
        ## voegen we de eerste positie toe
        position_na <- c(1, position_na)
    ## geef aan hoe vaak een nummer in een vector herhaald moet worden
    rep_times <- diff(c(position_na, length(x) + 1))
    ## herhaal de gewenste waarde op deze plek
    rep(x[position_na], times = rep_times)
}


