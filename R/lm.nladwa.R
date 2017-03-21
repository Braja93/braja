#' Creates list of all functions associated with lm from this package.
#'
#' Take a lm object, and some arguments to streamline modelling.
#' @param x data.table with all the data for modelling.
#' @param formula an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.
#' @param data.index Character. The date index of the lm(data = ?) variable.
#' @param conf.level confidence level, default = 95\%.
#' @param test.dep.varCharacter. Defaults to FALSE which replaces ".Train" in the dependent variable (from lm.object), with ".Train". If you know that variable doesn't exist, enter the variable name here.
#' @keywords lm
#' @import data.table
#' @export

lm.nladwa <- function(x, formula, ..., date.index = "Week", conf.level = 0.95, test.dep.var = FALSE) {
  
  lm.out <- lm(data = x, formula = formula, ...)
  
  out <- list("formula" = formula,
              "lm.object" = lm.out,
              "lm.cont" = nladwa::lm.contribution(lm.out, date.index = date.index),
              "lm.cont.summary" = nladwa::lm.contribution.summary(lm.out, date.index = date.index),
              "lm.avf" = nladwa::lm.actualvfitted(nladwa::lm.contribution(lm.out, date.index = date.index)),
              "lm.fitconf" = nladwa::lm.fitconf(lm.out, date.index = date.index, conf.level = conf.level),
              "lm.trainAndTest" = nladwa::lm.trainAndTest(lm.out, date.index = date.index, test.dep.var = test.dep.var))
  
  return(out)
  
}
