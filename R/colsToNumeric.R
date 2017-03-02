#' Converts selected columns to numeric
#'
#' Removes all punctuation, except "-" and ".", and converts to numeric. Also divides character with "%" by 100 automatically.
#' @param x data.table.
#' @param colsToTransform Character. Vector of character columns to convert.
#' @param overwrite Logical. Default = FALSE, and just returns the transformed columns. TRUE = overwrites the original columns.
#' @keywords sum columns
#' @export
#' @example inst/examples/colsToNumeric.R

colsToNumeric <- function(x, colsToTransform, overwrite = FALSE) {
  
  removePunctuation <- function(colToTransform, div100) {
    
    ifelse(isTRUE(div100), yes = div100 <- 100, no = div100 <- 1) 
    
    out <- as.numeric(gsub("([.-])|[[:punct:]]", "\\1", colToTransform)) / div100
    
    return(out)
    
  }
  
  pc.cols <- grepl("%", x[, ..colsToTransform])
  
  out <- sapply(seq_along(colsToTransform),
                function(i) {
                  removePunctuation(x[[colsToTransform[i]]], div100 = pc.cols[i])
                })
  
  out <- data.table::data.table(out)
  setnames(out, names(out), colsToTransform)
  
  if(isTRUE(overwrite)) {
    x[, eval(colsToTransform) := out]
  } else {
    return(out) 
  }
}
  