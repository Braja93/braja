#' Writes a data.table or data.frame to a CSV
#'
#' Writes a data.table or data.frame to a CSV, with a filename manually entered.
#' @param x A data.table or data.frame
#' @param filename A character string that the output will be called, e.g. "output"
#' @keywords CSV write
#' @export
#' @examples
#' writeToCSV()

writeToCSV <- function(x, filename) {
  write.csv(x, paste0(filename, ".csv"), row.names = FALSE)
}