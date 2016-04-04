#' Simple Adstock.
#'
#' Adstocks one variable, returns a numeric vector.
#' @param data data.table that holds the variable to be transformed
#' @param variable Character string of the variable to be transformed
#' @param adstock.rate Rate to adstock the variable
#' @keywords adstock simple
#' @import data.table
#' @export

adstockSimple <- function(x, adstock.rate = 0){
  return(as.numeric(filter(x = x, filter = adstock.rate, method = "recursive")))
}
