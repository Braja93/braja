x <- data.table::fread(system.file("extdata", "TVRs.csv", package = "nladwa"))
x[, Week := as.Date(Week, "%d/%m/%Y")]

out1 <- adstock.maxDecay(data = x, variable = "TVRs", adstock.rates = 0.5, max.decay = 2)
out2 <- adstock.maxDecay(data = x, variable = "TVRs", adstock.rates = 0.5, max.decay = 10)

data.table::setkey(out1, Week)
data.table::setkey(out2, Week)

out <- out1[out2]
out[, i.TVRs := NULL]

rm(out1, out2)

plot.out <- data.table::melt(out, id.vars = "Week")

ggplot2::ggplot(plot.out, ggplot2::aes(x = Week, y = value, colour = variable)) +
  ggplot2::geom_line()
