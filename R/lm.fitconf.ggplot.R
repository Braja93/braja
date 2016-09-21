#' Plot of lm.fitconf.
#'
#' Outputs a ggplot of fit and confidence interval, over time.
#' @param lm.fitconf.object Output of lm.fitconf function.
#' @keywords lm confidence fit plot
#' @import data.table
#' @import ggplot2
#' @export

lm.fitconf.ggplot <- function(lm.fitconf.object) {
  date.index <- names(lm.fitconf.object)[1]
  
  out <- data.table::melt(lm.fitconf.object, id.vars = date.index)
  out.plot <- ggplot2::ggplot(out, ggplot2::aes_string(x = date.index, y = "value", colour = "variable")) + ggplot2::geom_line()
  
  print(out.plot)
}