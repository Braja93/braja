x <- data.table::data.table(iris)
x[, Species := as.character(Species)]
print(x)
uniqueCharCols(x)
