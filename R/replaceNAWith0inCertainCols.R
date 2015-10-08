#' Replaces NAs with 0 in certain columns
#'
#' Replaces all NAs with 0 in a column that has "string" in its name
#' @param x data.table.
#' @param string Character. A string that is in the target column name.
#' @keywords NA
#' @export
#' @examples
#' replaceNAWith0()

replaceNAWith0inCertainCols <- function(x, string) {
  for (col in grep(string, x = names(x), value = TRUE))
    x[is.na(get(col)), (col) := 0]
}
