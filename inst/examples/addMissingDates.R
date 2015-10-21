x <- data.table::fread(system.file("extdata", "Newspapers.csv", package = "nladwa"))
x$Date <- as.Date(x$Date)
print(x) # missing 2015-01-03, 05, 06, 07, 08, 09
addMissingDates(x = x, date.index = "Date") # now has them all
