#' Prints the unique values of any character columns
#'
#' Prints the unique values of any character columns
#' @param x data.table.
#' @keywords unique character
#' @export
#' @example inst/examples/uniqueCharCols.R

uniqueCharCols <- function(x) {
  sapply(X = x[, sapply(x, class) == "character", with = FALSE], FUN = unique)
}