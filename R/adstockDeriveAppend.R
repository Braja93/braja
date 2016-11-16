#' Finds the optimum Adstock rate and applies it, appending the original table.
#'
#' Derives best adstock rate, based on lowest SSE, and adds the the original data.table.
#' @param data data.frame that holds the data (independent and dependent)
#' @param y Dependent variable e.g. Sales
#' @param x Independent variable, of which we want to derive optimum adstock. Can be a vector of variables
#' @param lim Numeric. Upper limit for adstock rate
#' @keywords adstock derive append
#' @import data.table
#' @export

adstock.DeriveAppend <- function(data, y, x, lim = FALSE) {
  
  for(i in seq_along(x)) {
    
    adstock.name <- paste0("adstock.", x[i])
    adstock.rate <- nladwa::adstockDerive(data = data, y = y, x = x[i], lim = lim)
    
    assign(x = adstock.name, value = adstock.rate, envir = globalenv())
    
    data[, paste0(x[i], "Adstocked", round(adstock.rate, 2)) := nladwa::adstock(get(x[i]), adstock.rate = adstock.rate)]
    
  }
  
  out <- as.data.table(matrix(data = NA, nrow = 1, ncol = length(x), dimnames = list("a", names(data)[(ncol(data) - length(x) + 1):ncol(data)])))
  cat(paste("+", names(out)), sep = "\n")
  
}
