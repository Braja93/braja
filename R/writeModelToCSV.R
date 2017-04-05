#' Linear model summary, actual v fitted, and decomp to CSV
#'
#' Writes summary(lm.object), AvF, decomp to CSVs.
#' @param lm.nladwa.object lm.nladwa object.
#' @param filename Character string. What the output should be saved as.
#' @param date.index Character. The date index of the lm(data = ?) variable.
#' @keywords lm CSV summary AvF decomp
#' @export

writeModelToCSV <- function(lm.nladwa.object, filename, date.index = "Week"){
  
  filename.summary <- paste0(filename,"_Summary")
  
  if(file.exists(paste0(filename.summary, ".csv"))) {stop("File already exists, choose another filename")}
  
  # coefficients in dataframe
  out <- data.table::data.table(summary(lm.nladwa.object$lm.object)$coefficients)
  out[, Variable := row.names(summary(lm.nladwa.object$lm.object)$coefficients)]
  
  # format the table
  out[, `Pr(>|t|)` := ifelse(test = `Pr(>|t|)` < 0.001, yes = "< 0.001", no = ifelse(test = `Pr(>|t|)` < 0.01, yes = "< 0.01", no = round(`Pr(>|t|)`, 3)))]
  out[Variable == "(Intercept)", Variable := "Intercept"]
  out <- out[, c("Variable", "Estimate", "Std. Error", "t value", "Pr(>|t|)"), with = FALSE]
  
  # lm.keystats
  
  lm.keystats <- function(lm.nladwa.object) {
    
    dep.var <- as.character(lm.nladwa.object$formula[[2]])
    
    out <- data.table(Model = dep.var, 
                      r2 = summary(lm.nladwa.object$lm.object)$r.squared,
                      adj.r2 = summary(lm.nladwa.object$lm.object)$adj.r.squared)
    
    if(grep(x = dep.var, pattern = "\\.Train$")) {
      
      temp1 <- MAPE.trainAndTest(lm.nladwa.object$lm.trainAndTest)
      temp1[, Index := .I]
      options(warn = -1)
      temp1 <- dcast.data.table(melt(temp1, id.vars = "Type", verbose = FALSE), . ~ variable + Type, sep = ".")
      options(warn = 0)
      temp1 <- temp1[, .(MAPE.Train, MAPE.Test)]
      
      out <- cbind(out, temp1)
    }
    
    return(out[])
  }
  
  # write it as a csv file 
  writeToCSV(out, filename.summary)
  writeToCSV(lm.nladwa.object$lm.avf, paste0(filename, "_AvF")) # write model actual vs fitted to CSV
  writeToCSV(lm.nladwa.object$lm.cont, paste0(filename, "_Decomp")) # write model decomp to CSV
  writeToCSV(lm.keystats(lm.nladwa.object), paste0(filename, "_KeyStats"))
}
