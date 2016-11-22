#' Adstocks a variable - infinite decay.
#'
#' User sets adstock rates, which transforms the input variable, outputting in a new table.
#' @param data data.table that holds the variable to be transformed
#' @param variable Character string of the variable to be transformed
#' @param adstock.rates One (or many) rates to adstock the variable
#' @keywords adstock
#' @import data.table
#' @export
#' @example inst/examples/adstock.multiple.R

# adapted from: http://stackoverflow.com/questions/14372880/simple-examples-of-filter-function-recursive-option-specifically

adstock.multiple <- function(data, variable, adstock.rates) {
  
  adstocked <- sapply(adstock.rates, function(adstock.rate) { adstock(x = data[, get(variable)], adstock.rate = adstock.rate)})
  
  out <- as.data.table(adstocked)
  
  setnames(out, names(out), paste(variable, as.character(adstock.rates), sep = "."))
  
  return(out)
}
