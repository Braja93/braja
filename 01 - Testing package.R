library("nladwa")
library("data.table")
library("reshape2")
library("ggplot2")

excelDateToRDate("01/01/2015")

getWeek(excelDateToRDate("01/01/2015"), order = "Sun-Mon")

wideToLong(id.vars = "ID")

# load lm.contribution and lm.contribution.ggplot

out <- lm.contribution(lm.x, date.index = "Week")
lm.contribution.ggplot(out)

devtools::run_examples(pkg = "nladwa") # use when testing examples from local?

example("addMissingDates") # use when you've installed from github