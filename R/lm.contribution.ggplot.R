#' Plots the contribution of a lm's independent variables
#'
#' Takes lm.contribution() output and visualises it.
#' @param lm.contibution.object The output of lm.contribution()
#' @param date.index The date index of the lm(data = ?) variable, as a character, e.g. "Week"
#' @param dependent.var The dependent variable of the lm
#' @keywords lm contribution ggplot
#' @export
#' @examples
#' lm.contribution.ggplot()

lm.contribution.ggplot <- function(lm.contribution.object, date.index, dependent.var) {
  
  m.out <- reshape2::melt(lm.contribution.object, id.vars = date.index)
  
  lm.plot <- ggplot() +
    geom_area(data = m.out[variable != dependent.var], aes_string(x = date.index, y = "value", fill = "variable")) +
    geom_line(data = m.out[variable == dependent.var], aes_string(x = date.index, y = "value", fill = "variable"))
  print(lm.plot)
}