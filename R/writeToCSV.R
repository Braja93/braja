#' Writes a data.table or data.frame to a CSV
#'
#' Writes a data.table or data.frame to a CSV, with a filename manually entered.
#' @param x data.table or data.frame.
#' @param filename Character. A string that the CSV will be called, e.g. "output" will save as "output.csv".
#' @keywords CSV write
#' @export

writeToCSV <- function(x, filename) {
  write.csv(x, paste0(filename, ".csv"), row.names = FALSE)
}