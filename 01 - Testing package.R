library("nladwa")
library("data.table")
library("reshape2")
library("ggplot2")

excelDateToRDate("01/01/2015")

getWeek(excelDateToRDate("01/01/2015"), order = "Sun-Mon")

devtools::run_examples(pkg = "nladwa", fresh = TRUE) # use when testing examples from local?

example("lm.contribution.ggplot") # use when you've installed from github

example("stackCSVsfromFolder")
