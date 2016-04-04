#' Finds the optimum Adstock rate.
#'
#' Derives best adstock rate, based on lowest SSE.
#' @param data data.frame that holds the data (independent and dependent)
#' @param y Dependent variable e.g. Sales
#' @param x Independent variable, of which we want to derive optimum adstock
#' @keywords adstock derive
#' @import data.table
#' @export
#' @example inst/examples/adstockDerive.R

adstockDerive <- function(data, y, x){
  
  if (!requireNamespace("minpack.lm", quietly = TRUE)) {
    stop("Package 'minpack.lm' needed for this function to work. Please install it.",
         call. = FALSE)
  }
  
  opt.formula <- as.formula(paste0(y, " ~ b0 + b1 * adstockSimple(", x, ", rate)"))
  
  rate <- 0
  
  modFit <- minpack.lm::nlsLM(data = data, formula = opt.formula, 
                              start = c(b0 = 0, b1 = 1, rate = 0))
  
  rate <- coef(modFit)[[3]]
  
  return(rate)
}
