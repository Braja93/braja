#' Lags a variable by x observations
#'
#' Lags a variable, adding NAs at the front.
#' @param variable A vector, or column of a data.frame/table
#' @param lag.amount Periods to lag the variable by.
#' @keywords lag
#' @export
#' @example inst/examples/lagVariable.R

lagVariable <- function(variable, lag.amount) {
  
  variable.len <- length(variable)
  
  if(lag.amount >= variable.len) {stop("lag.amount too high")}
  
  return(c(rep(NA, lag.amount), variable[1:(variable.len - lag.amount)]))
}
