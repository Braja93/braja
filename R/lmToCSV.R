#' Linear model summary to CSV
#'
#' Writes summary(lm.object) to a CSV.
#' @param lm.object lm object. A lm saved to a variable.
#' @param filename Character string. What the output should be saved as.
#' @keywords lm CSV
#' @export

lmToCSV <- function(lm.object, filename){
  
  filename <- paste0(filename,"_Summary")
  
  if(file.exists(filename)) {stop("File already exists, choose another filename")}
  
  # coefficients in dataframe
  out <- data.table::data.table(summary(lm.object)$coefficients)
  out[, Variable := row.names(summary(lm1)$coefficients)]
  
  # format the table
  out[, `Pr(>|t|)` := ifelse(test = `Pr(>|t|)` < 0.001, yes = "< 0.001", no = ifelse(test = `Pr(>|t|)` < 0.01, yes = "< 0.01", no = round(`Pr(>|t|)`, 3)))]
  out[Variable == "(Intercept)", Variable := "Intercept"]
  out <- out[, c("Variable", "Estimate", "Std. Error", "t value", "Pr(>|t|)"), with = FALSE]
  
  # write it as a csv file 
  writeToCSV(out, filename)
}
