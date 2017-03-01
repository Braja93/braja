#' Sum certain columns
#'
#' Replaces all NAs with a specified replacement in a column that has "string" in its name
#' @param x data.table.
#' @param id.col Character. ID column to index the output.
#' @param search.string Character. A string that is in the target column name.
#' @param onlyTotal Logical. TRUE = vector of summed columns, FALSE = column appended and returned with original data.table
#' @keywords sum columns
#' @export
#' @example inst/examples/sumCertainCols.R

sumCertainCols <- function(x, id.col = "Week", search.string, onlyTotal) {
  
  temp <- x[, c(id.col, grep(pattern = search.string, x = names(x), value = TRUE, ignore.case = TRUE)), with = FALSE]
  summaryname <- paste0(search.string, ".Total")
  temp[, paste0(search.string, ".Total") := rowSums(.SD, na.rm = TRUE), .SDcols = setdiff(names(temp), id.col)]
  
  if(isTRUE(onlyTotal)) { temp <- temp[[summaryname]] }
  
  return(temp[])
  
}
