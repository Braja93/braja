#' Outputs the contribution of each smoothed independent variable
#'
#' Takes a GAM and outputs a list, containing data for each smoothed variable's contribution.
#' @param gam.object GAM object. A GAM saved to a variable.
#' @keywords GAM contribution
#' @import mgcv
#' @export
#' @example inst/examples/gam.contribution.R

gam.contribution <- function(gam.object) {
  
  gam.contrib <- mgcv::plot.gam(gam.object, select = 0)
  
  for(i in 1:length(gam.contrib)) {
    
    tablename <- paste0("out.", i)
    
    assign(tablename, data.table::data.table("a" = gam.contrib[[i]]$x, "b" = gam.contrib[[i]]$fit))
    data.table::setnames(get(tablename), names(get(tablename)), c(gam.contrib[[i]]$xlab, paste0("contribution.", gam.contrib[[i]]$xlab)))
    
  }
  
  rm(list = grep(pattern = "out.", x = ls(), value = TRUE, invert = TRUE))
  
  out <- as.list(environment())
  
  return(out)
}
