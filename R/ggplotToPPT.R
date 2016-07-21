#' Exports a graph for presentations
#'
#' Exports ggplot graph to PNG, readable in PPT presentations.
#' @param filename Character. Filename of image to be created.
#' @param plot Character. Name of ggplot object.
#' @param units Character. Unit of measurement for dimensions; "in", "cm", or "mm". See "ggsave" documentation.
#' @keywords ggplot PPT
#' @import cairoDevice
#' @import ggplot2
#' @export

ggplotToPPT <- function(filename = NULL, plot, units = "cm", width = 43.2, height = 13.7, font.size = 17) {
  
  if(is.null(filename)) {
    stop("filename must be defined")
  }
  
  ggplot2::ggsave(filename = paste0(filename, ".png"), plot = plot + 
                    ggplot2::theme_gray(base_size = font.size), units = "cm", 
                  width = width, height = height, type = "cairo-png")
}