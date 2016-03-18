#' Adstocks a variable - max decay.
#'
#' User sets adstock rates, and period where adstock decays to 0.
#' @param data data.table that holds the variable to be transformed
#' @param variable Character string of the variable to be transformed
#' @param adstock.rates One (or many) rates to adstock the variable
#' @param max.decay Number of periods that the adstock takes to decay to 0
#' @keywords adstock decay
#' @import data.table
#' @export
#' @example inst/examples/adstock.maxDecay.R

# adapted from: https://github.com/AnalyticsArtist/BlogFiles/blob/master/Advertising%20Adstock%20Transformation%20with%20Maximum%20Period%20Decay.R

adstock.maxDecay <- function(data, variable, adstock.rates, max.decay) {
  
  learn.rates <- data.table(matrix(nrow = max.decay + 1, ncol = length(adstock.rates), dimnames = list(NULL, as.character(adstock.rates))))
  
  for (i in 1:ncol(learn.rates)) {
    learn.rates[, i := rep(adstock.rates[i], max.decay + 1) ^ c(0:max.decay), with = FALSE]
  }
  
  out <- data.table(matrix(nrow = length(data[, get(variable)]) + max.decay, ncol = ncol(learn.rates), dimnames = list(NULL, as.character(adstock.rates))))
  
  for (i in 1:ncol(learn.rates)) {
    out[, i := filter(c(rep(0, max.decay), data[, get(variable)]), learn.rates[[i]], method = "convolution"), with = FALSE]
  }
  
  out <- out[complete.cases(out)]
  
  setnames(out, names(out), paste(variable, names(out), max.decay, sep = ":"))
  
  out <- cbind(data, out)
  
  return(out)
}
