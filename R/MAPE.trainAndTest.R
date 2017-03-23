#' Mean Absolute Percentage Error on a lm.trainAndTest.object
#'
#' Mean Absolute Percentage Error on a lm.trainAndTest.object.
#' @param lm.trainAndTest.object The output of lm.trainAndTest.
#' @keywords MAPE error train test
#' @export
#' @example inst/examples/lm.trainAndTest.R

MAPE.trainAndTest <- function(lm.trainAndTest.object) {
  return(lm.trainAndTest.object[complete.cases(lm.trainAndTest.object), .(MAPE = nladwa::MAPE(Actual = Actual, Fitted = Fitted)), by = Type][])
}
