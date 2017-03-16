#' Create a data.table for actual v fitted, with train and test sets
#'
#' Takes a lm object and outputs an actual vs fitted table.
#' @param data data.table.
#' @param date.index Character. The date index of the lm(data = ?) variable.
#' @param train.size Proportion of dataset that should be in the training set. Between 0 and 1.
#' @keywords lm actual fitted train test sample
#' @import data.table
#' @export

TrainAndTest.sample <- function(data, train.size = 0.75, date.index) {
  
  if(train.size > 1 | train.size < 0) { stop("train.size must be between 0 and 1") }
  
  out <- copy(data)
  
  smp_size <- floor(train.size * nrow(out))
  
  train_ind <- sample(seq_len(nrow(out)), size = smp_size)
  out[, Type := ifelse(.I %in% train_ind, "Train", "Test")]
  out <- data.table::melt(out, id.vars = c(date.index, "Type"))
  out <- data.table::dcast.data.table(out, get(date.index) ~ variable + Type, sep = ".")
  data.table::setnames(out, "date.index", date.index)
  
  return(out[])
  
}
