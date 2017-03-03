#' Reads Excel table from file to data.table
#'
#' Create data.table from Excel table that's in an XLSX file.
#' @param file Character. Path to file.
#' @param date.index Character. Optional, column name of date variable.
#' @param sheet Integer. Sheet number of table (from open.xlsx)
#' @param startRow Integer. Row that the data starts (from open.xlsx)
#' @param origin Character. from open.xlsx
#' @keywords excel xlsx fread
#' @export

freadExcel <- function(file, date.index = NULL, sheet = 1, startRow = 1, origin = "1900-01-01") {
  
  out <- data.table::as.data.table(
    openxlsx::read.xlsx(xlsxFile = file, sheet = sheet, startRow = startRow))
  
  if(is.null(date.index)) {
    message("No date.index selected.")
  } else {
    out[, (date.index) := openxlsx::convertToDate(get(date.index), origin = origin)]
  }
  
  nladwa::fixNames(out)
  
  return(out)
  
}
