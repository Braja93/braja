x <- data.table::fread(system.file("extdata", "lm.csv", package = "nladwa"))
x[, Week := excelDateToRDate(Week)]

x <- createTrainAndTest(x, "TotalGrossLeads", to.break = "2015-04-06", append = TRUE)
# 06/04/2015

lm1 <- lm(TotalGrossLeads.Train ~ Search.Spend + Competitor.Spend, data = x)
lm1.trainAndTest <- lm.trainAndTest(lm.object = lm1, date.index = "Week")
print(lm1.trainAndTest)

lm.trainAndTest.ggplot(lm1.trainAndTest)

lm1.trainAndTest[complete.cases(lm1.trainAndTest), .(MAPE = MAPE(Actual = Actual, Fitted = Fitted)), by = Type]
