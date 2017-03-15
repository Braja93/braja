#' Mean Average Percentage Error
#'
#' Adstocks one variable, returns a numeric vector.
#' @param Actual vector of "Actual" data
#' @param Fitted vector of "Fitted" data
#' @keywords MAPE error
#' @export

MAPE <- function(Actual, Fitted) {
  return(mean(abs(Actual - Fitted) / Actual))
}
