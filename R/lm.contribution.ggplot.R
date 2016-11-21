#' Plots the contribution of a lm's independent variables
#'
#' Takes lm.contribution output and visualises it.
#' @param lm.contibution.object The output of lm.contribution.
#' @param date.index Character. Only define if error. The date index of the lm(data = ?) variable, as a character, e.g. "Week".
#' @param dependent.var Character. Only define if error. The dependent variable of the lm.
#' @keywords lm contribution ggplot
#' @import ggplot2
#' @export
#' @example inst/examples/lm.contribution.ggplot.R

lm.contribution.ggplot <- function(lm.contribution.object, date.index = NULL, dependent.var = NULL) 
{
  if (is.null(date.index)) {
    date.index <- names(lm.contribution.object)[1]
  }
  if (is.null(dependent.var)) {
    dependent.var <- names(lm.contribution.object)[2]
  }
  options(warn = -1)
  m.out <- reshape2::melt(lm.contribution.object, id.vars = date.index)
  options(warn = 0)
  if (m.out[variable != dependent.var, min(value)] >= 0) {
    lm.plot <- ggplot2::ggplot() +
      ggplot2::geom_bar(data = m.out[variable != dependent.var], ggplot2::aes_string(x = date.index, y = "value", fill = "variable", group = "variable"), stat = "identity") +
      ggplot2::geom_line(data = m.out[variable == dependent.var], ggplot2::aes_string(x = date.index, y = "value", fill = "variable", group = "variable")) +
      ggplot2::ylab(dependent.var)
  }
  else {
    lm.plot <- ggplot2::ggplot() +
      ggplot2::geom_bar(data = m.out[value >= 0 & variable != dependent.var], ggplot2::aes_string(x = date.index, y = "value", fill = "variable", group = "variable"), stat = "identity") +
      ggplot2::geom_bar(data = m.out[value < 0 & variable != dependent.var], ggplot2::aes_string(x = date.index, y = "value", fill = "variable", group = "variable"), stat = "identity") +
      ggplot2::geom_line(data = m.out[variable == dependent.var], ggplot2::aes_string(x = date.index, y = "value", group = "variable"), colour = "black") +
      ggplot2::ylab(dependent.var)
  }
  print(lm.plot)
}