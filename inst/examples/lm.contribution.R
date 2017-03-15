x <- data.table::fread(system.file("extdata", "lm.csv", package = "nladwa"))
x[, Week := excelDateToRDate(Week)]
lm.x <- lm(TotalGrossLeads ~ Search.Spend + Competitor.Spend, data = x)
lm.object <- lm.contribution(lm.object = lm.x, date.index = "Week")
print(lm.object)
