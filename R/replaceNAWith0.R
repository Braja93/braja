#' Replaces all NAs with 0
#'
#' Replaces all NAs with 0
#' @param x data.table.
#' @keywords NA
#' @export
#' @examples
#' replaceNAWith0()

replaceNAWith0 <- function(x) {
  for(j in names(x))
    data.table::set(x, which(is.na(x[[j]])), j, 0)
}