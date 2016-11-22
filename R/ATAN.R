#' ATAN transformation
#'
#' User sets rates, which transforms the input variable, outputting in a new table.
#' @param data data.table that holds the variable to be transformed
#' @param variable Character string of the variable to be transformed
#' @param rate One (or many) rates to adstock the variable
#' @keywords ATAN
#' @import data.table
#' @export

ATAN <- function(data, variable, rate) {
  
  x <- data[, get(variable)]
  max.var <- max(x, na.rm = TRUE)
  
  ATANed <- sapply(rate, function(rate) { atan(x/(max.var * rate)) })
  
  out <- as.data.table(ATANed)
  
  setnames(out, names(out), paste(variable, "ATAN", as.character(rate), sep = "."))
  
  return(out)
  
}
