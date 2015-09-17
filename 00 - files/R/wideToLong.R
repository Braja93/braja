#' Coverts data from wide to long
#'
#' Reads data from clipboard, and melts the data.frame based on the id.vars entered.
#' @param id.vars A vector, or individual column from the source data that will be the id of the output.
#' @keywords wide long reshape
#' @export
#' @examples
#' wideToLong()

wideToLong <- function(id.vars) {
  x <- readExcelClipboard()
  xm <- reshape2::melt(x, id.vars = id.vars)
  writeToClipboard(xm)
}