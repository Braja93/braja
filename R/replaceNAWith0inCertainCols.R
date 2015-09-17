#' Replaces NAs with 0 in certain columns
#'
#' Replaces all NAs with 0 in a column that has "string" in its name
#' @param x A data.table
#' @param string A character string that the column name has
#' @keywords NA
#' @export
#' @examples
#' replaceNAWith0()

replaceNAWith0inCertainCols <- function(x, string) {
  for (col in grep(string, x = names(x), value = TRUE))
    x[is.na(get(col)), (col) := 0]
}
