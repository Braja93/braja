#' Plots the contribution of a GAM's smoothed independent variables
#'
#' Takes GAM and visualises it.
#' @param gam.object GAM object. A GAM saved to a variable.
#' @keywords gam contribution ggplot
#' @import ggplot2
#' @export
#' @example inst/examples/gam.contribution.ggplot.R

gam.contribution.ggplot <- function (gam.object, incl.intercept = TRUE, scales = "free_x") {
  
  int <- coef(gam.object)["(Intercept)"]
  
  if(is.na(int)) { int <- 0; message("No intercept in model") }
  
  dt <- gam.contribution(gam.object)
  lapply(dt, function(zzz) {
    zzz[, `:=`(variable, names(zzz)[1])]
  })
  lapply(seq_along(dt), function(i) {
    old.names <- names(dt[[i]])
    new.names <- c("xvar", "contribution", "variable")
    data.table::setnames(x = dt[[i]], old = old.names, new = new.names)
  })
  
  out <- Reduce(function(...) merge(..., all = TRUE), dt)
  
  if(isTRUE(incl.intercept)) {out[, contribution := contribution + int]}
  
  p1 <- ggplot2::ggplot(out, ggplot2::aes(x = xvar, y = contribution, 
                                          colour = variable)) + ggplot2::geom_hline(yintercept = 0, 
                                                                                    alpha = 0.3) + ggplot2::geom_line() + ggplot2::facet_wrap(~variable, 
                                                                                                                                              ncol = 3, scales = scales) + labs(x = "")
  
  
  print(p1)
}
