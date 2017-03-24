#' Tests multiple variables, returning a summary table
#'
#' Takes a formula, a list of variables to test, and the data.table they are stored in, and returns a summary table of that formula, with all the variables tested individually.
#' @param data data.table. Where all the variables are stored.
#' @param formula.to.test Character. Formula, not including the variables you want to test, e.g. "y ~ x1 + x2 + x3"
#' @param test.variables Character. List of variable to tack on the end of formula.to.test, individually tested.
#' @param sort.var Character. Column name to sort by.
#' @param decreasing Logical. Default is Low to High. Set to TRUE for High to Low.
#' @keywords lm multivariable test
#' @import data.table
#' @export

lm.multiVariableTesting <- function (data, formula.to.test, test.variables, sort.var = "Pr(>|t|)", decreasing = FALSE) {
  
  lm.all <- lapply(test.variables, function(x) { summary(lm(formula = as.formula(paste(formula.to.test, "+", x)), data = data)) })
  
  out <- lapply(lm.all, function(x) { x$coefficients })
  
  out <- lapply(out, FUN = function(x) { x[nrow(x), 1:4] })
  
  SSE <- lapply(lm.all, function(x) { data.table(SSE = sum(x$residuals^2)) })
  
  out <- lapply(out, FUN = function(x) { data.table::data.table(t(x)) })
  
  out <- data.table::rbindlist(out)
  out[, `:=`(Variable, test.variables)]
    SSE <- data.table::rbindlist(SSE)
  
  out <- cbind(out, SSE)
  
  out <- out[, c("Variable", "Estimate", "Std. Error", "t value", "Pr(>|t|)", "SSE"), with = FALSE]
  out <- out[order(get(sort.var), decreasing = decreasing)]
  
  return(out[])
}
