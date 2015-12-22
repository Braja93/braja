#' Plots actual v fitted
#'
#' Takes a lm.actualvfitted object and plots.
#' @param lm.contribution.object lm.contribution object. Output of lm.contribtion saved as an object.
#' @keywords lm actual fitted ggplot
#' @import data.table
#' @export

lm.actualvfitted.ggplot <- function(lm.actualvfitted.object) {
  id.var <- names(lm.actualvfitted.object)[1]
  out <- reshape2::melt(lm.actualvfitted.object, id.vars = id.var)
  ggplot2::ggplot(out, ggplot2::aes_string(x = id.var, y = "value", colour = "variable")) +
    ggplot2::geom_line()
}