#' Replaces NAs in certain columns
#'
#' Replaces all NAs with a specified replacement in a column that has "string" in its name
#' @param x data.table.
#' @param string Character. A string that is in the target column name.
#' @keywords NA
#' @export
#' @example inst/examples/replaceNAWithinCertainCols.R

replaceNAWithinCertainCols <- function(x, replacement, string) {
  for (col in grep(string, x = names(x), value = TRUE))
    x[is.na(get(col)), (col) := replacement]
}
