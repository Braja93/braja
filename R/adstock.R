#' Adstocks a variable - infinite decay.
#'
#' User sets adstock rates, which append to the end of the original data.table.
#' @param data data.table that holds the variable to be transformed
#' @param variable Character string of the variable to be transformed
#' @param adstock.rates One (or many) rates to adstock the variable
#' @keywords adstock
#' @import data.table
#' @export
#' @example inst/examples/adstock.R

# adapted from: http://stackoverflow.com/questions/14372880/simple-examples-of-filter-function-recursive-option-specifically

adstock <- function(data, variable, adstock.rates) {
  
  adstocked <- data.table(matrix(nrow = nrow(data), ncol = length(adstock.rates), dimnames = list(NULL, as.character(adstock.rates))))
  
  for (i in 1:length(adstock.rates)) {
    adstocked[, i := as.numeric(filter(x = data[, get(variable)], filter = adstock.rates[i], method = "recursive")), with = FALSE]
  }
  
  setnames(adstocked, names(adstocked), paste(variable, names(adstocked), sep = ":"))
  
  out <- cbind(data, adstocked)
  
  return(out)
}
