#' Replaces all NAs
#'
#' Replaces all NAs with whatever is specified.
#' @param x data.table.
#' @keywords NA
#' @export
#' @example inst/examples/replaceNAWith.R

replaceNAWith <- function(x, replacement) {
  for(j in names(x))
    data.table::set(x, which(is.na(x[[j]])), j, replacement)
}