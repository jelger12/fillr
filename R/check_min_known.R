check_min_known <- function(x, x_na_omit, min_known_n, min_known_p){
    ## Check if the minimum known n and percentage criteria are matched
    if (!is.null(min_known_n)) {

        if(!check_min_known_n(x, x_na_omit, min_known_n)){
            return(FALSE)
        }
    }
    if (!is.null(min_known_p)) {

        if(!check_min_known_p(x, x_na_omit, min_known_p)) {
            return(FALSE)
        }
    }
    TRUE
}
