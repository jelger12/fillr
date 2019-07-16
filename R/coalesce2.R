
#' coalesce missing values
#'
#' Returns the first non null column element for each row. code from:
#' https://stackoverflow.com/questions/19253820/how-to-implement-coalesce-efficiently-in-r
#' @param ... vectors. All imputs should have the same length
#' @return vector with the same length as the first vector
#' @export
#'
#' @examples
#' coalesce2(c(NA,1), c(2, NA))
coalesce2 <- function(...) {
    Reduce(function(x, y) {
        i <- which(is.na(x))
        x[i] <- y[i]
        x},
        list(...))
}
