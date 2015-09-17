#' Reads Excel table from clipboard to data.table
#'
#' Create data.table from Excel table that's held in the clipboard.
#' @param No arguments
#' @keywords excel
#' @export
#' @examples
#' freadExcelClipboard()

freadExcelClipboard <- function(...) {
  x <- tempfile()
  writeLines(readLines("clipboard"), x)
  data.table::fread(x, ...)
}
