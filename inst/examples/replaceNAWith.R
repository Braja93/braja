x <- data.table::fread(system.file("extdata", "NA0.csv", package = "nladwa"))
print(x)
replaceNAWith(x = x, replacement = 0)
print(x)