#' Scatter plot with linear regression.
#'
#' Plots a scatter, with linear fit, with equation and r2 in the title.
#' @param data data.table.
#' @param x Character. The column in data to be the x variable.
#' @param y Character. The column in data to be the y variable.
#' @keywords scatter regression
#' @import scales
#' @import ggplot2
#' @export
#' @example inst/examples/scatterPlot.R

scatterPlot <- function(data, x, y, title = NULL, ...) {
  
  m <- lm(formula = as.formula(get(y) ~ get(x)), data = data)
  
  a.coef <- format(coef(m)[1], digits = 2)
  b.coef <- format(coef(m)[2], digits = 2)
  r2 <- format(summary(m)$r.squared, digits = 3)
  
  eq <- paste0(b.coef, "x + ", a.coef, ". r2 = ", r2)
  
  if(is.null(title)) title <- eq else title <- paste0(title, ". ", eq)
  
  out <- ggplot(data, aes_string(x = x, y = y, ...)) +
    geom_point() +
    stat_smooth(method = "lm") +
    labs(list(title = title)) +
    scale_x_continuous(labels = comma) + 
    scale_y_continuous(labels = comma)
  
  print(out)
}
