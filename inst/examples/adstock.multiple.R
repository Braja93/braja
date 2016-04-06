x <- data.table::fread(system.file("extdata", "TVRs.csv", package = "nladwa"))
x[, Week := as.Date(Week, "%d/%m/%Y")]

out1 <- adstock.multiple(data = x, variable = "TVRs", adstock.rates = 0.1)
out2 <- adstock.multiple(data = x, variable = "TVRs", adstock.rates = seq(from = 0.1, to = 0.9, by = 0.1))

plot.out1 <- data.table::melt(out1, id.vars = "Week")

ggplot2::ggplot(plot.out1, ggplot2::aes(x = Week, y = value, colour = variable)) +
  ggplot2::geom_line()

plot.out2 <- data.table::melt(out2, id.vars = "Week")

ggplot2::ggplot(plot.out2, ggplot2::aes(x = Week, y = value, colour = variable)) +
  ggplot2::geom_line()
