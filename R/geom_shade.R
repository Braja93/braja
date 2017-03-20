#' Geom for shading graph to highlight periods.
#'
#' Plots "recession bars" on a graph. Note - only really good for plotting one variable.
#' @param data data.table that holds the data
#' @param variable Numeric. Dummy variable, 1 = plot.
#' @param date.index Character. Date index of x, e.g. "Week", need to be of Date class.
#' @param alpha Transparency of bar shades. 1 = opaque, 0 = transparent.
#' @param overlap Numeric. Overlap of the bars, seems to be OK left as 3.5.
#' @param fill Character. Colour for the bars.
#' @keywords ggplot shade
#' @import ggplot2
#' @export
#' @example inst/examples/geom_shade.R

geom_shade <- function(data, variable, date.index = "Week", alpha = 0.2, overlap = 3.5, fill = "pink") {
  geom_rect(data = data[get(variable) == 1], ggplot2::aes_string(xmin = paste0(date.index, "-", overlap),
                                                        xmax = paste0(date.index, "+", overlap)),
            ymin = -Inf,
            ymax = +Inf,
            fill = fill,
            alpha = alpha)
}
