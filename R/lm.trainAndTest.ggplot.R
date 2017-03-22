#' Create a data.table for actual v fitted, with train and test sets
#'
#' Takes a lm object and outputs an actual vs fitted table.
#' @param lm.trainAndTest.object The output of lm.trainAndTest.
#' @keywords lm actual fitted train test ggplot
#' @import data.table
#' @import ggplot2
#' @export
#' @example inst/examples/lm.trainAndTest.R

lm.trainAndTest.ggplot <- function (lm.trainAndTest.object) {
  date.index <- names(lm.trainAndTest.object)[1]
  
  options(warn = -1)
  out <- data.table::melt(lm.trainAndTest.object, id.vars = c(date.index, "Type"))
  options(warn = 0)
  
  ggplot2::ggplot() +
    ggplot2::geom_line(data = out[variable == "Actual"], ggplot2::aes(Week, value), colour = "black") +
    ggplot2::geom_point(data = out[variable == "Fitted"], ggplot2::aes(Week, value, colour = Type)) + 
    ggplot2::ylab("")
}

