#' Reads Excel table from clipboard to data.frame
#'
#' Create data.frame from Excel table that's held in the clipboard.
#' @param No arguments
#' @keywords excel
#' @export

readExcelClipboard <- function() {
  return(read.table("clipboard", header = TRUE, sep = "\t", stringsAsFactors = FALSE, row.names = NULL))
}