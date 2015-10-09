library("nladwa")

excelDateToRDate("01/01/2015")

getWeek(excelDateToRDate("01/01/2015"), order = "Sun-Mon")

wideToLong(id.vars = "ID")

# load lm.contribution and lm.contribution.ggplot

library("data.table")
library("reshape2")
library("ggplot2")

out <- lm.contribution(lm.x, date.index = "Week")
lm.contribution.ggplot(out)

run_examples(pkg = "nladwa")