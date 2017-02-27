#' Converts monthly data to weekly.
#'
#' Roll the end of months based on days overlapping in the week.
#' @param x data.table. One columns called "Month" (a Date), and variable(s) to convert.
#' @keywords monthly weekly
#' @import data.table
#' @export
#' @example inst/examples/monthlyToWeekly.R

monthlyToWeekly <- function(x) {
  
  daterange <- nladwa::getWeek(range(x$Month))
  daterange[2] <- daterange[2] + months(1)
  
  out <- data.table::data.table(Week = seq(from = daterange[1], to = daterange[2], by = 7))
  out[, EOM := lubridate::ceiling_date(Week, unit = "month") - 1]
  out[, Month := as.Date(paste0(format(Week, "%Y-%m-"), "01"))]
  out[, diff := as.integer(EOM - Week)]
  
  var.names <- setdiff(names(x), "Month")
  
  out <- merge(out, x, by = "Month")
  
  for(i in var.names) {
    out[, paste0("lead1.", i) := data.table::shift(get(i), n = 1, type = "lead")]
  }
  
  for(i in var.names) {
    out[, paste0(i, ".weekly") := ifelse(test = diff > 7,
                                         yes = get(i),
                                         no = ((diff/7) * get(i)) + (((7 - diff)/7) * get(paste0("lead1.", i))))]
    
  }
  
  out <- out[, c("Week", paste0(var.names, ".weekly")), with = FALSE]
  
  return(out)
}
