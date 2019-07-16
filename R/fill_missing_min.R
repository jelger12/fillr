#' Fill missing minimum
#'
#' Fill all missing values in a vector with the minimum value if it is known.
#' @param x The vector to fill
#' @param min_known_n numeric value: the minimum number of not-missing values
#' @param min_known_p numeric value between 0 and 1: the minimum fraction of not-missing values
#'
#' @return a filled vector
#' @export
#'
#' @examples
#' fill_missing_min(c(1, 2, NA))
#' fill_missing_min(c(NA, 1, 2, NA))
fill_missing_min <- function(x, min_known_n = NULL, min_known_p = NULL) {
    ## Check if missing values can and should be filled
    if(!check_some_missing(x)) {
        return(x)
    }

    ## Create vector without mising values
    x_na_omit <- stats::na.omit(x)

    ## Check if the minimum known n and percentage criteria are matched
    if(!check_min_known(x, x_na_omit, min_known_n, min_known_p)) {
        return(x)
    }

    fill_vector.min(x, x_na_omit)
}
