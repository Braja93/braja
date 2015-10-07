library("devtools")

# ways to install

install_github("nladwa/nladwa") # from github

setwd("..") # from local
install("nladwa")

remove.packages("nladwa")

### testing package

library("nladwa")

excelDateToRDate("01/01/2015")

getWeek(excelDateToRDate("01/01/2015"), order = "Sun-Mon")

wideToLong(id.vars = "ID")