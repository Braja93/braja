#' Outputs the contribution of each lm independent variable
#'
#' Takes a lm and applies coefficients to show how each independent variable contributes to the dependent variable. IMPORTANT: lm(data = ?) has to be a data.table.
#' @param lm.object A lm() saved to a variable
#' @param date.index The date index of the lm(data = ?) variable, as a character, e.g. "Week"
#' @keywords lm contribution
#' @import data.table
#' @export
#' @examples
#' lm.contribution()

lm.contribution <- function(lm.object, date.index) {
  data.source <- as.character(lm.object$call[3]) # data source of the regression
  out.cols <- c(date.index, names(lm.object$model)) # cols the the output should have (index, dependent and all independents)
  dependent.var <- out.cols[2] # dependent var
  
  out <- get(data.source)[, out.cols, with = FALSE] # cut data source to appropriate cols for output
  out <- out[complete.cases(out),] # only complete cases
  
  coeffs <- data.table::data.table(var = names(lm.object$coefficients), coeff = lm.object$coefficients) # table of coefficients from regression
  
  if(coeffs$var[1] == "(Intercept)") { # if the regression has an intercept then create a placeholder
    out[, "(Intercept)" := 1]
  }
  
  for (i in 1:nrow(coeffs)) { # loop over coeffs table and times the independents by coefficients
    out[, coeffs$var[i] := get(coeffs$var[i]) * coeffs$coeff[i]]
  }
  
  return(out)
}