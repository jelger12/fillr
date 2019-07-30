#' fill missing value
#'
#' Returns a vector with all missing values filled with another value
#' @param x vectors. All inputs should have the same length
#' @param value a value with the same class as x
#' @return vector with the same length as the first vector
#' @export
#'
#' @examples
#' fill_value(c(NA,1), 2)
fill_value <- function(x, value) {
    stopifnot(length(value) == 1)
    stopifnot(class(x) == class(value))
    i <- which(is.na(x))
    x[i] <- value
    x
}
