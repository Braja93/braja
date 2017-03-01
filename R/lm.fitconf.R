#' Fit of a lm with confidence intervals.
#'
#' data.table with date index, model fit, and lower and upper intervals.
#' @param lm.object Output of lm function.
#' @param date.index Character. The column from the model source data that is the date variable.
#' @param conf.level Confidence level, default = 95\%.
#' @keywords lm confidence fit
#' @import data.table
#' @export

lm.fitconf <- function(lm.object, date.index, conf.level = 0.95) {
  
  data.source <- as.character(lm.object$call[3])
  data.cols <- names(lm.object$model)
  
  date.data <- get(data.source)[, c(date.index, data.cols), with = FALSE]
  date.data <- date.data[complete.cases(date.data), get(date.index)]
  
  out <- data.table::data.table(predict.lm(object = lm.object, interval = "confidence", level = conf.level))
  out[, Week := date.data]
  
  data.table::setcolorder(out, c(date.index, "lwr", "fit", "upr"))
  data.table::setnames(out, names(out), c(date.index, "Lower", "Fit", "Upper"))
  
  return(out)
}
