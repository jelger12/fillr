#' Check if some missing values are present
#'
#' Check if some missing values are present, but not all are missing.
#' returns a boolean. This check is done to save time for vectors where filling
#' is not needed
#'
#' @param x the vector to check
#' @return TRUE or FALSE
check_some_missing <- function(x) {
    x <- unique(x)
    any(is.na(x)) & !all(is.na(x))
}
