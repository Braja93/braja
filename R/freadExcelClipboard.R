#' Reads Excel table from clipboard to data.table
#'
#' Create data.table from Excel table that's held in the clipboard.
#' @param No arguments
#' @keywords excel
#' @export

freadExcelClipboard <- function (date.col = "Week", check.names = FALSE, ...) {
  x <- tempfile()
  writeLines(readLines("clipboard"), x)
  x <- data.table::fread(x, check.names = check.names, ...)
  
  if(!is.na(date.col)) {x[, eval(date.col) := excelDateToRDate(get(date.col))]}
  
  return(x[])
  
}
