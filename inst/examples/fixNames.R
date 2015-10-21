x <- data.table::fread(system.file("extdata", "Newspapers.csv", package = "nladwa"))
names(x)
fixNames(x)
names(x)
