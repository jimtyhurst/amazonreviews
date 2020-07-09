
#' Converts strings to logical values
#'
#' Converts non-case-sensitive strings like "n" or "y" to logical values FALSE or TRUE.
#'
#' @param x (character vector) strings like "y", "Y", "yes", "YES", "n", "N", "no", or "NO" that represent a logical value.
#'
#' @return vector where non-case-sensitive strings "y", "yes" have been converted to `TRUE` and all other values, including `NA` or empty string (""), have been converted to `FALSE`.
#'
#' @import assertthat
#' @export
yes_no_to_logical <- function(x) {
  if(is.na(x) || is.string(x))
    return(yes_no_to_logical_translator(x))
  else
    assert_that(is.character(x))
    return(sapply(x, yes_no_to_logical_translator))
}

#' @import stringr
yes_no_to_logical_translator <- function(x) {
  if(is.na(x))
    return(FALSE)
  else
    return(
      stringr::str_detect(
        x,
        stringr::regex("y|yes", ignore_case = TRUE)
      )
    )
}
