#' Fill missing strict
#'
#' Fill all missing values in a vector with the same value if it is known. Only
#' fills the value when all known values are the same
#'
#' @param x The vector to fill
#'
#' @return a filled vector
#' @export
#'
#' @examples
#' fill_missing_strict(c(NA, 1))
fill_missing_strict <- function(x) {
    ## Check if missing values can and should be filled
    if(!check_some_missing(x)) {
        return(x)
    }
    ## Create vector without mising values
    y <- stats::na.omit(x)
    ## Only fill missing if all non-missing values are the same
    if (length(unique(y)) == 1) {
        ## use coalesce with the only non- missing value
        x <- dplyr::coalesce(x, y[1])
    }
    x
}
