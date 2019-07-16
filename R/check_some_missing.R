#' Check if some missing values are present
#'
#' Check if some missing values are present, but not all are missing. returns a boolean
#'
#' @param x the vector to check
#' @return TRUE or FALSE
#' @export
#' @examples
#' check_some_missing(c(NA, 1))
check_some_missing <- function(x) {
    x <- unique(x)
    any(is.na(x)) & !all(is.na(x))
}
