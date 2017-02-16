#' Plot correlation matrix.
#'
#' Prints a ggplot of selected variables over time.
#' @param x data.table
#' @keywords correlation plot
#' @import data.table
#' @import ggplot2
#' @export
#' @example inst/examples/corPlot.R

corPlot <- function(x) {
  
  out <- cor(Filter(is.numeric, x))
  
  corplot <- data.table::melt(out)
  
  p1 <- ggplot2::ggplot(corplot, ggplot2::aes(Var1, Var2, fill = value)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient2("Correlation", limits = c(-1, 1)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1)) +
    ggplot2::labs(list(x = "", y = ""))
  
  print(p1)
  
}
