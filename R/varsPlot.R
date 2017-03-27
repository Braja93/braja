#' Plot multiple variables over time.
#'
#' Prints a ggplot of selected variables over time.
#' @param x data.table
#' @param vars Vector of characters - columns from x to be plotted.
#' @param date.index Character. The column in x that is the date variable.
#' @param facet TRUE = facets plot by variable, scales = "free_y".
#' @keywords variables plot
#' @import data.table
#' @import ggplot2
#' @export

varsPlot <- function (x, vars, date.index = "Week", facet = FALSE) {
  vars <- c(date.index, vars)
  options(warn = -1)
  meltplot <- melt(x[, vars, with = FALSE], id.vars = date.index, verbose = FALSE)
  options(warn = 0)
  
  if(isTRUE(facet)) {
    vars.plot <- ggplot2::ggplot(meltplot, ggplot2::aes_string(x = date.index, y = "value")) +
      ggplot2::geom_line() +
      ggplot2::facet_grid(variable ~ ., scales = "free_y")
  } else {
    vars.plot <- ggplot2::ggplot(meltplot, ggplot2::aes_string(x = date.index, y = "value", colour = "variable")) +
      geom_line()
  }
  
  print(vars.plot)
  
}
