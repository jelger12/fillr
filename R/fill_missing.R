#' Fill missing
#'
#' wrapper function to do check and call all fill_vector functions
#' @param x The vector to fill
#' @param min_known_n numeric value: the minimum number of not-missing values
#' @param min_known_p numeric value between 0 and 1: the minimum fraction of not-missing values
#' @param type the type of fill missing function to be called
fill_missing <- function(x, min_known_n = NULL, min_known_p = NULL, type) {

    stopifnot(type %in% c("last",
                          "min",
                          "max",
                          "strict",
                          "previous",
                          "interval"))

    ## Check if missing values can and should be filled
    if(!check_some_missing(x)) {
        return(x)
    }

    ## Create vector without mising values
    x_na_omit <- stats::na.omit(x)

    ## Check if the minimum known n and percentage criteria are matched
    if(!check_min_known(x, x_na_omit, min_known_n, min_known_p)) {
        return(x)
    }

    ## Call the fill_vector function, depending on the given type argument
    if (type == "last"){
        return(fill_vector_last(x, x_na_omit))
    } else if (type == "min") {
        stopifnot(is.numeric(x))
        return(fill_vector_min(x, x_na_omit))
    } else if (type == "max") {
        stopifnot(is.numeric(x))
        return(fill_vector_max(x, x_na_omit))
    } else if (type == "strict") {
        return(fill_vector_strict(x, x_na_omit))
    } else if (type == "previous") {
        return(fill_vector_previous(x))
    } else if (type == "interval") {
        return(fill_vector_interval(x))
    }


}
