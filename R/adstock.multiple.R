#' Adstocks a variable - infinite decay.
#'
#' User sets adstock rates, which appends to the input variable in a new table.
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
  
  adstocked <- as.data.table(adstocked)
  
  setnames(adstocked, names(adstocked), paste(variable, as.character(adstock.rates), sep = ":"))
  
  out <- cbind(data[, .(variable = get(variable))], adstocked)
  
  setnames(out, "variable", variable)
  
  return(out)
}
