check_min_known_p <- function(x, x_na_omit, type = "n", min_known_p) {
    known_p <- length(x_na_omit) / length(x)
    ## Als het aandeel bekende waarden kleiner is dan het opgegeven minimum, wordt
    ## de rest van de functie niet uitgevoerd, en x teruggegeven.
    if (known_p < min_known_p) {
        return(FALSE)
    } else {
        TRUE
    }

}
