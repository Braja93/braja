#' Reads all CSVs from a folder, and stacks them by row
#'
#' Reads all CSVs from a folder (pre-set the working directory), and stacks them by row
#' @param No arguments
#' @keywords stack csv
#' @export
#' @examples
#' stackCSVsfromFolder()

stackCSVsfromFolder <- function() { # make sure wd is set...
  all.files <- list.files(pattern = "\\.csv$") # vector of files in wd ending in csv
  l <- lapply(all.files, data.table::fread) # fread all.files as a list
  x <- data.table::rbindlist(l) # combine by stacking all the rows
  return(x)
}