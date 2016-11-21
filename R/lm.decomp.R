#' Sums the decomp of a linear model.
#'
#' Takes lm.contribution output and sums all the independent variables' contribution to the KPI.
#' @param lm.contibution.object The output of lm.contribution.
#' @keywords lm contribution decomp
#' @export

lm.decomp <- function(lm.contribution.object) {
  
  out <- as.matrix(colSums(Filter(is.numeric, lm.contribution.object)))
  out <- as.data.table(out, keep.rownames = TRUE)
  setnames(out, names(out), c("Variable", "Decomp"))
  dependent.var <- out[1, Variable]
  out <- out[-1,]
  
  out$Proportion <- out$Decomp / sum(out$Decomp)
  out$Proportion <- round(out$Proportion, digits = 4)
  
  out <- rbind(data.table(Variable = paste0("Dependent Variable = ", dependent.var),
                   Decomp = NA,
                   Proportion = NA),
        out)
  
  return(out)
}
