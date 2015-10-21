#' Fixes column names
#'
#' Replaces and weird characters or spaces with dots
#' @param x data.table. With weird column names.
#' @keywords names
#' @export
#' @example inst/examples/fixNames.R

fixNames <- function(x) {
  data.table::setnames(x, names(x), make.names(names(x)))
}