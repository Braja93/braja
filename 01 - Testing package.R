devtools::run_examples(pkg = "nladwa", fresh = TRUE) # use when testing examples from local?

# use when you've installed from github

library("nladwa")
library("data.table")
library("reshape2")
library("ggplot2")

excelDateToRDate("01/01/2015")

getWeek(excelDateToRDate("01/01/2015"), order = "Sun-Mon")

example("stackCSVsfromFolder")

example("lm.contribution")

example("lm.contribution.ggplot")
