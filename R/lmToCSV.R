#' Linear model summary to CSV
#'
#' Writes summary(lm.object) to a CSV.
#' @param lm.object lm object. A lm saved to a variable.
#' @param filename Character string. What the output should be saved as.
#' @keywords lm CSV
#' @export

lmToCSV <- function(lm.object, filename){
  
  filename <- paste0(filename,"_Summary.csv")
  
  if(file.exists(filename)) {stop("File already exists, choose another filename")}
  
  # coefficients in dataframe
  lmTable <- data.frame(summary(lm.object)$coefficients)
  
  # grab the coefficients
  colnames(lmTable) <- colnames(summary(lm.object)$coefficients)
  # get the p-vals 
  lmTable[ ,4] <- ifelse(lmTable[ ,4] < .001, "< 0.001", 
                         ifelse(lmTable[ ,4] < .01, "< 0.01", 
                                round(lmTable[ ,4], 3)))
  
  
  # format the table
  out <- format(lmTable)
  
  # write it as a csv file 
  write.csv(out, filename)
}
