#' Gets week from a date
#'
#' Gets week from a date, has to be Date class
#' @param Date. Date class object.
#' @param order Character. "Mon-Sun" or "Sun-Mon".
#' @keywords week
#' @export
#' @examples
#' getWeek()

getWeek <- function(Date, order = "Mon-Sun") {
  if (class(Date) != "Date") stop("Date needs to be of Date class")
  if (order == "Mon-Sun") { # Monday is first day of week
    Week <- lubridate::floor_date(Date, "week") + ifelse(lubridate::wday(Date) == 1, -6, 1)
  } else if (order == "Sun-Mon") { # Sunday is first day of week
    Week <- lubridate::floor_date(Date, "week")
  }
  return(Week)
}
