check_min_known_p <- function(x, x_na_omit, min_known_p) {
    known_p <- length(x_na_omit) / length(x)
    ## When the percentage of known values is smaller than the given minimum,
    ## FALSE will be returned
    if (known_p < min_known_p) {
        return(FALSE)
    } else {
        TRUE
    }

}
