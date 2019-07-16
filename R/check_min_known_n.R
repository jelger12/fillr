check_min_known_n <- function(x, x_na_omit, min_known_n) {
    known_n <- length(x_na_omit)
    ## Als het aantal bekende waarden kleiner is dan het opgegeven minimum, wordt
    ## de rest van de functie niet uitgevoerd, en x teruggegeven.
    if (known_n < min_known_n) {
        return(FALSE)
    } else {
        TRUE
    }
}
