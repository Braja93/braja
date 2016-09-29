#' Highlight gaps in the models
#'
#' Takes a lm.actualvfitted object and plots.
#' @param lm.avf.object lm.avf object. Output of lm.avf saved as an object.
#' @param tolerance. Numeric between 0 and 1, e.g. if abs.resid/dep.var > 0.2 then it is highlighted.
#' @param graph. Logical. If TRUE then plots the variable with shades for gaps.
#' @keywords lm actual fitted ggplot gaps
#' @import data.table
#' @import ggplot2
#' @export

lm.actualvfitted.gaps <- function(lm.avf.object, tolerance = 0.2, graph = TRUE) {
  
  out <- copy(lm.avf.object)
  
  date.index <- names(out)[1]
  dep.var <- names(out)[2]
  
  out[, resid := out[, dep.var, with = FALSE] - fitted]
  out[, abs.resid := abs(resid)]
  out[, abs.resid.div.dep.var := abs.resid / out[, dep.var, with = FALSE]]
  out[, pc := ifelse(abs.resid.div.dep.var >= tolerance, 1, 0)]
  
  out.plot <- ggplot2::ggplot() +
    geom_shade(data = out, variable = "pc", date.index = date.index) +
    ggplot2::geom_line(data = out, ggplot2::aes_string(x = date.index, y = dep.var)) +
    ggplot2::geom_line(data = out, ggplot2::aes_string(x = date.index, y = "fitted"), linetype = "dashed", colour = "blue")
  
  if(graph) {
    print(out.plot); print(out[pc == 1])
  } else {
    print(out[pc == 1])
  }
}
