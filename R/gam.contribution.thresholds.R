#' Outputs point where contribution is closest to 0, and max point
#'
#' Takes a gam.contribution object.
#' @param gam.contribution.object gam.contribution object.
#' @keywords GAM contribution threshold
#' @import mgcv
#' @export

gam.contribtion.thresholds <- function(gam.contribution.object) {
  return(lapply(gam.contribution.object, function(dt) {
    dt[c(which.min(abs(get(names(dt)[2]))),
         which.max(get(names(dt)[2])))]
  }))
}
