x <- data.table::fread(system.file("extdata", "lm.csv", package = "nladwa"))
x[, Week := excelDateToRDate(Week)]
lm1 <- lm(TotalGrossLeads.Train ~ Search.Spend + Competitor.Spend, data = x)
lm1.trainAndTest <- lm.trainAndTest(lm.object = lm1, date.index = "Week")
print(lm1.trainAndTest)

lm.trainAndTest.ggplot(lm1.trainAndTest)

lm1.trainAndTest[complete.cases(lm1.trainAndTest) & Type == "Test", MAPE(Actual = Actual, Fitted = Fitted)]
