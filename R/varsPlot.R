#' Plot multiple variables over time.
#'
#' Prints a ggplot of selected variables over time.
#' @param x data.table
#' @param date.index Character. The column in x that is the date variable.
#' @param vars Vector of characters - columns from x to be plotted.
#' @keywords variables plot
#' @import data.table
#' @import ggplot2
#' @export

varsPlot <- function(x, vars, date.index = "Week") {
  
  vars <- c(date.index, vars)
  
  options(warn = -1)
  meltplot <- melt(x[, vars, with = FALSE], id.vars = date.index, verbose = FALSE)
  options(warn = 0)
  
  vars.plot <- ggplot(meltplot, aes_string(x = date.index, y = "value")) +
    geom_line() +
    facet_grid(variable ~ ., scales = "free_y")
  
  print(vars.plot)
  
}
