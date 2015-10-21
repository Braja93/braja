#' Converts data from wide to long
#'
#' Reads data from clipboard, and melts the data.frame based on the id.vars entered.
#' @param x data.frame or data.table. In wide format.
#' @param id.vars Character. Column name from the source data that will be the id of the output.
#' @param writeToClipboard Logical. TRUE or FALSE.
#' @keywords wide long reshape
#' @export
#' @example inst/examples/wideToLong.R

wideToLong <- function(x, id.vars, writeToClipboard) {
  xm <- reshape2::melt(x, id.vars = id.vars)
  if (writeToClipboard == TRUE) {
    writeToClipboard(xm)
  } else if (writeToClipboard == FALSE) {
    return(xm)
  }
}