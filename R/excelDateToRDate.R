#' Excel date to R date class
#'
#' dd/mm/yyyy to yyyy-mm-dd
#' @param Date Date, as character in dd/mm/yyyy
#' @keywords excel date
#' @export
#' @examples
#' excelDateToRDate()

excelDateToRDate <- function(Date) {
  return(as.Date(Date, "%d/%m/%Y"))
}