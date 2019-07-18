check_min_known_n <- function(x, x_na_omit, min_known_n) {
    known_n <- length(x_na_omit)
    ## When the number of known values is smaller than the given minimum,
    ## FALSE will be returned
    if (known_n < min_known_n) {
        return(FALSE)
    } else {
        TRUE
    }
}
