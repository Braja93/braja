x <- data.table::fread(system.file("extdata", "lm.csv", package = "nladwa"))
lm.x <- lm(TotalGrossLeads ~ Search.Spend + Competitor.Spend, data = x)
lm.object <- lm.contribution(lm.object = lm.x, date.index = "Week")
lm.contribution.ggplot(lm.object)
