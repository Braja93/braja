#' Simple Adstock.
#'
#' Adstocks one variable, returns a numeric vector.
#' @param data data.table that holds the variable to be transformed
#' @param variable Character string of the variable to be transformed
#' @param adstock.rate Rate to adstock the variable, between 0 and 1.
#' @keywords adstock simple
#' @import data.table
#' @export

adstock <- function(x, adstock.rate){
  return(as.numeric(filter(x = x, filter = adstock.rate, method = "recursive")))
}
