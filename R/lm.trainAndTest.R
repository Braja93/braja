#' Create a data.table for actual v fitted, with train and test sets
#'
#' Takes a lm object and outputs an actual vs fitted table.
#' @param lm.object lm object. A lm saved to a variable.
#' @param date.index Character. The date index of the lm(data = ?) variable.
#' @param test.dep.var Character. Defaults to FALSE which replaces ".Train" in the dependent variable (from lm.object), with ".Train". If you know that variable doesn't exist, enter the variable name here.
#' @keywords lm actual fitted train test
#' @import data.table
#' @export
#' @example inst/examples/lm.trainAndTest.R

lm.trainAndTest <- function(lm.object, date.index = "Week", test.dep.var = FALSE) {
  
  if(test.dep.var == FALSE) test.dep.var <- gsub("Train", "Test", names(lm.object$model)[1])
  
  lm.train <- nladwa::lm.actualvfitted(nladwa::lm.contribution(lm.object = lm.object, date.index = date.index))
  data.table::setnames(lm.train, names(lm.train), c(date.index, "Actual", "Fitted"))
  lm.train[, Type := "Train"]
  
  lm.test.data <- x[!is.na(get(test.dep.var))]
  
  lm.test <- data.table::data.table(Week = lm.test.data[[date.index]],
                                    Actual = lm.test.data[[test.dep.var]],
                                    Fitted = predict(lm.object, newdata = lm.test.data),
                                    Type = "Test")
  
  lm.traintest <- data.table::rbindlist(list(lm.train, lm.test), use.names = TRUE)
  
  return(lm.traintest[])
}
