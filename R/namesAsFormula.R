#' Columns names to a formula layout.
#'
#' Outputs columns of a t
#' @param x data.table to convert to formula
#' @keywords lm names formula
#' @import data.table
#' @export

namesAsFormula <- function(x) {
  out <- paste("+", names(x))
  out[1] <- sub("\\+ ", "", x = out[1])
  cat(out, sep = "\n")
}