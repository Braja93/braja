#' Writes a data.table or data.frame to the clipboard
#'
#' Writes a data.table or data.frame to the clipboard.
#' @param x A data.table or data.frame.
#' @keywords clipboard write
#' @export

writeToClipboard <- function(x) {
  write.table(x, "clipboard-128", sep = "\t", row.names = FALSE)
}