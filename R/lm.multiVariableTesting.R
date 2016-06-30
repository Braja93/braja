#' Tests multiple variables, returning a summary table
#'
#' Takes a formula, a list of variables to test, and the data.table they are stored in, and returns a summary table of that formula, with all the variables tested individually.
#' @param data data.table. Where all the variables are stored.
#' @param formula.to.test Character. Formula, not including the variables you want to test, e.g. "y ~ x1 + x2 + x3"
#' @param test.variables Character. List of variable to tack on the end of formula.to.test, individually tested.
#' @keywords lm multivariable test
#' @import data.table
#' @export

lm.multiVariableTesting <- function(data, formula.to.test, test.variables) {
  
  out <- lapply(test.variables, function(x){
    summary(lm(formula = as.formula(paste(formula.to.test, "+", x)), data = data))$coefficients})
  
  out <- lapply(out, FUN = function(x) {x[nrow(x), 1:4]})
  out <- lapply(out, FUN = function(x) {data.table::data.table(t(x))})
  out <- data.table::rbindlist(out)
  out[, Variable := test.variables]
  out <- out[, c("Variable", "Estimate", "Std. Error", "t value", "Pr(>|t|)"), with = FALSE]
  return(out)
}
