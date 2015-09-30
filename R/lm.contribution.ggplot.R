#' Plots the contribution of a lm's independent variables
#'
#' Takes lm.contribution output and visualises it.
#' @param lm.contibution.object The output of lm.contribution.
#' @param date.index Only define if error. The date index of the lm(data = ?) variable, as a character, e.g. "Week".
#' @param dependent.var Only define if error. The dependent variable of the lm.
#' @keywords lm contribution ggplot
#' @export
#' @examples
#' lm.contribution.ggplot()

lm.contribution.ggplot <- function(lm.contribution.object, date.index = NULL, dependent.var = NULL) {
  
  if(is.null(date.index)) {date.index <- names(lm.contribution.object)[1]}
  if(is.null(dependent.var)) {dependent.var <- names(lm.contribution.object)[2]}
  
  m.out <- reshape2::melt(lm.contribution.object, id.vars = date.index)
  
  lm.plot <- ggplot2::ggplot() +
    ggplot2::geom_area(data = m.out[variable != dependent.var], ggplot2::aes_string(x = date.index, y = "value", fill = "variable")) +
    ggplot2::geom_line(data = m.out[variable == dependent.var], ggplot2::aes_string(x = date.index, y = "value", fill = "variable"))
  print(lm.plot)
}