#' Cuts numeric variable into groups
#'
#' Builds on base cut function
#' @param x Vector of numeric.
#' @param breaks Integer. Number of groups to create.
#' @param midpoints Logical. Return midpoint of groups, rather than character?
#' @param dp Integer. Number of decimal places if midpoints == TRUE.
#' @keywords cut
#' @export
#' @example inst/examples/cutVar.R

cutVar <- function(x, breaks, midpoints, labels = NULL, dp = 2, ...){
  out <- cut(x = x, breaks = breaks, labels = labels, ...)
  if(isTRUE(midpoints)) {
    lower <- as.numeric(gsub(",.*", "", gsub("\\(|\\[|\\)|\\]", "", out)))
    upper <- as.numeric(gsub(".*,", "", gsub("\\(|\\[|\\)|\\]", "", out)))
    out <- round(lower + (upper - lower) / 2, dp) 
  }
  return(out)
}
