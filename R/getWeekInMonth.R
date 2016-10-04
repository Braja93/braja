#' Gets week in month from a date
#'
#' Gets week number (in month) from a week, has to be Date class
#' @param Week Date class object.
#' @keywords week number month
#' @export

getWeekInMonth <- function(Week) {
  out <- as.numeric(format(Week, "%U")) - as.numeric(format(as.Date(cut(Week, "month")), "%U")) + 1
  return(out)
}
