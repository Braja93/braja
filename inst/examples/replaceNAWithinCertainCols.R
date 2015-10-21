x <- data.table::fread(system.file("extdata", "NA.csv", package = "nladwa"))
print(x)
replaceNAWithinCertainCols(x = x, replacement = "space", string = ".a")
print(x)