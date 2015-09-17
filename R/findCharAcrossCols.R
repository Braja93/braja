#' Find characters across all columns
#'
#' Searches each column for a particular string
#' @param x A data.table or data.frame
#' @param string A character string that you want to find in x
#' @keywords unique character
#' @export
#' @examples
#' findCharAcrossCols()

findCharAcrossCols <- function(x, string) {
  apply(x, 2, function(x) {grep(string, x, ignore.case = TRUE)})
}
