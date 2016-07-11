#' Adds missing dates to wide data
#'
#' Adds rows with 0 values to a wide table that doesn't have consecutive dates
#' @param x data.table. In wide format.
#' @param date.index Character. The column in x that is the date variable.
#' @param seq.by Integer. Number of days that each row should cover? 1 = week day, 7 = one week.
#' @keywords missing dates
#' @import data.table
#' @export
#' @example inst/examples/addMissingDates.R

addMissingDates <- function(x, date.index, seq.by = 1) {
  
  x.dates <- x[, get(date.index)]
  tomerge.date <- seq(from = min(x.dates), to = max(x.dates), by = seq.by)
  tomerge.date <- tomerge.date[!(tomerge.date %in% x.dates)]
  
  tomerge <- data.table::as.data.table(matrix(nrow = length(tomerge.date), ncol = ncol(x), dimnames = list(NULL, names(x)), data = 0))
  tomerge[, date.index := tomerge.date, with = FALSE]
  
  out <- data.table::rbindlist(list(x, tomerge))
  out <- out[, lapply(.SD, sum, na.rm = TRUE), by = date.index]
  data.table::setkeyv(out, date.index)
  return(out)
}
