install_github("nladwa/nladwa")

library("nladwa")

excelDateToRDate("01/01/2015")

getWeek(excelDateToRDate("01/01/2015"), order = "Sun-Mon")

wideToLong(id.vars = "ID")