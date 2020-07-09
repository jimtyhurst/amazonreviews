
#' Reads an Amazon Customer Reviews file
#'
#' Reads a [Amazon Customer Reviews](https://s3.amazonaws.com/amazon-reviews-pds/readme.html) [dataset](https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt) of reviews of [Amazon](https://www.amazon.com/) products, written by Amazon customers.
#'
#' @param path character vector: fully qualified path to the file to be read.
#'
#' @return `tbl` with 14 columns:
#' * `marketplace` (character vector): 2-letter country code of the marketplace where the review was written.
#' * `customer_id` (character vector): random identifier that can be used to aggregate reviews written by a single author.
#' * `review_id` (character vector): unique ID of the review.
#' * `product_id` (character vector): unique Product ID the review pertains to.
#' * `product_parent` (character vector): random identifier that can be used to aggregate reviews for the same product.
#' * `product_title` (character vector): title of the product.
#' * `product_category` (character vector): broad product category that can be used to group reviews (also used to group the dataset into coherent parts).
#' * `star_rating` (integer): 1-5 star rating of the review.
#' * `helpful_votes` (integer): number of helpful votes.
#' * `total_votes` (integer): number of total votes the review received.
#' * `vine` (logical): TRUE if review was written as part of the Vine program; FALSE otherwise.
#' * `verified_purchase` (logical): TRUE if review is on a verified purchase; FALSE otherwise.
#' * `review_headline` (character vector): title of the review.
#' * `review_body` (character vector): full text content of the review.
#' * `review_date` (Date): date the review was written.
#'
#' @import readr
#' @import dplyr
#' @export
read_review_file <- function(path) {
  df <- readr::read_tsv(
    file = path,
    col_types = get_review_col_types()
  ) %>%
    dplyr::mutate(
      vine = yes_no_to_logical(vine),
      verified_purchase = yes_no_to_logical(verified_purchase)
    )
  return(df)
}

#' Returns a `col_spec` for Amazon Customer Reviews files.
#'
#' Returns a `col_spec` for Amazon Customer Reviews data
#'     to override the defaults detected by `readr::read_tsv`.
#'
#' @return `col_spec` for an Amazon Customer Reviews dataset.
#'
#' @import readr
#' @export
get_review_col_types <- function() {
  return(
    readr::cols(
      marketplace = readr::col_character(),
      customer_id = readr::col_character(),
      review_id = readr::col_character(),
      product_id = readr::col_character(),
      product_parent = readr::col_character(),
      product_title = readr::col_character(),
      product_category = readr::col_character(),
      star_rating = readr::col_integer(),
      helpful_votes = readr::col_integer(),
      total_votes = readr::col_integer(),
      vine = readr::col_character(),
      verified_purchase = readr::col_character(),
      review_headline = readr::col_character(),
      review_body = readr::col_character(),
      review_date = readr::col_date(format = "%Y-%m-%d")
    )
  )
}
