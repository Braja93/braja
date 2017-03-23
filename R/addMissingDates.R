#' Adds missing dates to wide data
#'
#' Adds rows with 0 values to a wide table that doesn't have consecutive dates
#' @param x data.table. In wide format.
#' @param date.index Character. The column in x that is the date variable.
#' @param start.date Character in "yyyy-mm-dd" format. The first date of the required output, if NULL, function takes the min of date.index.
#' @param end.date Character in "yyyy-mm-dd" format. The last date of the required output, if NULL, function takes the max of date.index.
#' @param data.frequency Integer. Number of days that each row should cover, 1 = one day, 7 = one week.
#' @keywords missing dates
#' @import data.table
#' @export
#' @example inst/examples/addMissingDates.R

addMissingDates <- function(x, date.index = "Week", start.date = NULL, end.date = NULL, data.frequency = 7) {
  
  if(is.null(start.date)) start.date <- min(x[, get(date.index)])
  if(is.null(end.date)) end.date <- max(x[, get(date.index)])
  
  start.date <- as.Date(start.date)
  end.date <- as.Date(end.date)
  
  x <- data.table::rbindlist(list(x, x[NA], x[NA]))
  x[(nrow(x) - 1):nrow(x), eval(date.index) := c(start.date, end.date)]
  x.dates <- x[, get(date.index)]
  tomerge.date <- seq(from = start.date, to = end.date, by = data.frequency)
  tomerge.date <- tomerge.date[!(tomerge.date %in% x.dates)]
  tomerge <- data.table::as.data.table(matrix(nrow = length(tomerge.date), ncol = ncol(x), dimnames = list(NULL, names(x)), data = 0))
  tomerge[, `:=`((date.index), tomerge.date)]
  out <- data.table::rbindlist(list(x, tomerge))
  out <- out[, lapply(.SD, sum, na.rm = TRUE), by = date.index]
  data.table::setkeyv(out, date.index)
  return(out[])
}
