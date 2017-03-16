#' Create a data.table for actual v fitted, with train and test sets
#'
#' Takes a lm object and outputs an actual vs fitted table.
#' @param data data.table.
#' @param variable Character. The variable name, of which to create training and test sets.
#' @param date.index Character. The date index of the lm(data = ?) variable.
#' @param to.break Defaults to NA which creates the training set as 2/3 of the data, the last 1/3 is the test. Set to a number between 0 and 1 to act as a percentage split, e.g. 0.5 - half the data is training. Or, enter a character in yyyy-mm-dd as the date to split.
#' @param append Defaults to FALSE - which returns date.index, and the training and test variables. TRUE returns data, with two new columns at the end - useful to overwrite the original table.
#' @keywords lm actual fitted train test
#' @import data.table
#' @export
#' @example inst/examples/lm.trainAndTest.R

TrainAndTest.break <- function(data, variable, date.index = "Week", to.break = NA, append = FALSE) {
  
  select.cols <- c(date.index, variable)
  x <- data[, ..select.cols]
  
  if(is.na(to.break)) {
    to.break <- x[nrow(x) * 2/3, ..date.index][[date.index]]
  } else if(is.numeric(to.break)) {
    to.break <- x[nrow(x) * to.break, ..date.index][[date.index]]
  } else if(is.character(to.break)) {
    to.break <- as.Date(to.break)
  } else {stop("to.break argument is invalid - check the help file.")}
  
  x[, test := get(variable)]
  
  data.table::setnames(x, names(x)[2:3], paste0(names(x)[2], c(".Train", ".Test")))
  
  x[get(date.index) < to.break, names(x)[3] := NA]
  x[get(date.index) >= to.break, names(x)[2] := NA]
  
  message(paste("to.break date =", format(to.break, "%Y-%m-%d")))
  
  if(isTRUE(append)) { x <- merge(data, x, by = date.index) }
  
  return(x[])
  
}
