#' Fixes column names
#'
#' Replaces and weird characters or spaces with dots
#' @param x A data.table with weird column names
#' @keywords names
#' @export
#' @examples
#' fixNames()

fixNames <- function(x) {
  data.table::setnames(x, names(x), make.names(names(x)))
}