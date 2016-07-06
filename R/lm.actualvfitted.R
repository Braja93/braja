#' Create a data.table for actual v fitted
#'
#' Takes a lm.contribution object and outputs a actual vs fitted table.
#' @param lm.contribution.object lm.contribution object. Output of lm.contribtion saved as an object.
#' @keywords lm actual fitted
#' @import data.table
#' @export

lm.actualvfitted <- function(lm.contribution.object) {
  ncols <- ncol(lm.contribution.object)
  fitted <- rowSums(lm.contribution.object[, 3:ncols, with = FALSE], na.rm = TRUE)
  out <- lm.contribution.object[, 1:2, with = FALSE]
  out[, fitted := fitted]
  return(out)
}