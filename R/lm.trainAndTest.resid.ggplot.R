#' Create a data.table for actual v fitted, with train and test sets
#'
#' Takes a lm object and outputs an actual vs fitted table.
#' @param lm.trainAndTest.object The output of lm.trainAndTest.
#' @keywords lm actual fitted train test ggplot
#' @import data.table
#' @import ggplot2
#' @export
#' @example inst/examples/lm.trainAndTest.R

lm.trainAndTest.resid.ggplot <- function(lm.trainAndTest.object) {
  
  x <- data.table::copy(lm.trainAndTest.object)
  x[, Resid := Actual - Fitted]
  
  date.index <- names(x)[1]
  
  ggplot2::ggplot(x, ggplot2::aes_string(date.index, "Resid")) +
    ggplot2::geom_point(ggplot2::aes(colour = Type)) + ggplot2::stat_smooth(se = FALSE) +
    ggplot2::geom_hline(yintercept = 0)
}
