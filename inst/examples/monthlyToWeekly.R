x <- data.table::data.table(Month = seq.Date(as.Date("2017-01-01"), as.Date("2017-12-01"), by ="month"))
x[, Var1 := c(sample(50:100, size = 12))]
x[, Var2 := c(sample(50:100, size = 12))]
x[, Var3 := c(sample(50:100, size = 12))]

x
monthlyToWeekly(x)
