#' Fill missing strict
#'
#' Fill all missing values in a vector with the same value if it is known. Onlx_na_omit
#' fills the value when all known values are the same
#' @param x The vector to fill
#' @param min_known_n numeric value: the minimum number of not-missing values
#' @param min_known_p numeric value between 0 and 1: the minimum fraction of not-missing values
#'
#' @return a filled vector
#' @export
#'
#' @examples
#' fill_missing_strict(c(NA, 1))
fill_missing_strict <- function(x, min_known_n = NULL, min_known_p = NULL) {
    ## Check if missing values can and should be filled
    if(!check_some_missing(x)) {
        return(x)
    }

    ## Check if the minimum known n and percentage criteria are matched
    if (!is.null(min_known_n)) {

        if(!check_min_known_n(x, x_na_omit, min_known_n)){
            return(x)
        }
    }
    if (!is.null(min_known_p)) {

        if(!check_min_known_p(x, x_na_omit, min_known_p)) {
            return(x)
        }
    }



    ## Create vector without mising values
    x_na_omit <- stats::na.omit(x)
    ## Onlx_na_omit fill missing if all non-missing values are the same
    if (length(unique(x_na_omit)) == 1) {
        ## use coalesce with the onlx_na_omit non- missing value
        x <- coalesce2(x, x_na_omit[1])
    }
    x
}
