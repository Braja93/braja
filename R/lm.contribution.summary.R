#' Outputs the contribution of each lm independent variable - at a top level
#'
#' Takes a lm and applies coefficients to show how each independent variable contributes to the dependent variable, but grouped by whatever is before the first "." in the independent variable. "Ext." and the intercept are grouped to "Base". IMPORTANT: lm(data = ?) has to be a data.table.
#' @param lm.object lm object. A lm saved to a variable.
#' @param date.index Character. The date index of the lm(data = ?) variable.
#' @keywords lm contribution summary
#' @import data.table
#' @export

lm.contribution.summary <- function(lm.obj, date.index) {
  
  out <- nladwa::lm.contribution(lm.obj, date.index = date.index)
  
  out <-  data.table::melt(out, id.vars = names(out)[1:2], variable.name = "Independent.Var")
  out[, Independent.Var := gsub(".*_", "", Independent.Var)]
  out[, Independent.Var := gsub("\\..*$", "", Independent.Var)]
  out[Independent.Var == "Intercept" | Independent.Var == "Ext", Independent.Var := "Base"]
  
  frm <- as.formula(paste(date.index, "+", names(out)[2], "~", "Independent.Var"))
  
  out <- data.table::dcast.data.table(out, frm, fun.aggregate = sum)
  
  return(out)
}

