x <- data.table::fread(system.file("extdata", "lm.csv", package = "nladwa"))
x <- x[complete.cases(x)]
x[, Week := as.Date(Week)]
x[, dummy := 0]
x[sample(1:nrow(x), 60), dummy := 1]

ggplot() +
  geom_shade(data = x, variable = "dummy", date.index = "Week", alpha = 0.5) +
  geom_line(data = x, aes(x = Week, y = TotalGrossLeads))

warning("This function is only really any good for plotting one variable")
