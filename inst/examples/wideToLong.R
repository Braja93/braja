x <- data.table::fread(system.file("extdata", "Newspapers.csv", package = "nladwa"))
x$Date <- as.Date(x$Date)
print(x)
wideToLong(x = x, id.vars = "Date", writeToClipboard = FALSE)
