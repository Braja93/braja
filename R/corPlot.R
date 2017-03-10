#' Plot correlation matrix.
#'
#' Prints a ggplot of selected variables over time.
#' @param x data.table
#' @keywords correlation plot
#' @import data.table
#' @import ggplot2
#' @export
#' @example inst/examples/corPlot.R

corPlot <- function(x, use = "complete.obs") {
  
  out <- Filter(is.numeric, x)
  
  if(use == "complete.obs") {
    out <- out[complete.cases(out)]
  } 
  
  obs <- paste0("n. obs = ", nrow(out))
  
  out <- cor(out, use = use)
  
  corplot <- data.table::melt(out)
  
  p1 <- ggplot2::ggplot(corplot, ggplot2::aes(Var1, Var2, fill = value)) + 
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient2("Correlation", limits = c(-1, 1)) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1)) +
    ggplot2::labs(list(x = "", y = "", caption = obs))
  
  print(p1)
}
