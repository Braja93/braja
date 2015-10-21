x <- data.table::data.table(iris)
iris$Species <- as.character(iris$Species)
print(x)
uniqueCharCols(x)
