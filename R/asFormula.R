#' Columns names to a formula layout.
#'
#' Outputs columns of a t
#' @param x vector or data.table or data.frame to convert to formula
#' @keywords lm names formula
#' @import data.table
#' @export
#' @example inst/examples/asFormula.R

asFormula <- function (x) {
  
  if("data.frame" %in% class(x)) {x <- names(x)}
  
  out <- paste("+", x)

  cat(out, sep = "\n")
  
}
