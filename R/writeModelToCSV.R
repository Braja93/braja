#' Linear model summary, actual v fitted, and decomp to CSV
#'
#' Writes summary(lm.object), AvF, decomp to CSVs.
#' @param lm.object lm object. A lm saved to a variable.
#' @param filename Character string. What the output should be saved as.
#' @param date.index Character. The date index of the lm(data = ?) variable.
#' @keywords lm CSV summary AvF decomp
#' @export

writeModelToCSV <- function(lm.object, filename, date.index){
  
  filename.summary <- paste0(filename,"_Summary")
  
  if(file.exists(paste0(filename.summary, ".csv"))) {stop("File already exists, choose another filename")}
  
  # coefficients in dataframe
  out <- data.table::data.table(summary(lm.object)$coefficients)
  out[, Variable := row.names(summary(lm1)$coefficients)]
  
  # format the table
  out[, `Pr(>|t|)` := ifelse(test = `Pr(>|t|)` < 0.001, yes = "< 0.001", no = ifelse(test = `Pr(>|t|)` < 0.01, yes = "< 0.01", no = round(`Pr(>|t|)`, 3)))]
  out[Variable == "(Intercept)", Variable := "Intercept"]
  out <- out[, c("Variable", "Estimate", "Std. Error", "t value", "Pr(>|t|)"), with = FALSE]
  
  # write it as a csv file 
  writeToCSV(out, filename.summary)
  
  out.cont <- lm.contribution(lm.object, date.index)
  out.avf <- lm.actualvfitted(out.cont)
  
  writeToCSV(out.avf, paste0(filename, "_AvF")) # write model actual vs fitted to CSV
  writeToCSV(out.cont, paste0(filename, "_Decomp")) # write model decomp to CSV
}
