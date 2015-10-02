#' Gets month from a date
#'
#' Gets month from a date, has to be Date class
#' @param Date Date class object
#' @keywords month
#' @export
#' @examples
#' getMonth()

getMonth <- function(Date) {
  Month <- format(Date, "%b-%Y")
  return(Month)
}
