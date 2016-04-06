x <- data.table::fread(system.file("extdata", "Model.csv", package = "nladwa"))

opt.rate <- adstockDerive(data = x, y = "Sales", x = "Media")

x[, Adstock.Media := adstock(x = Media, adstock.rate = opt.rate)]

xm <- data.table::melt(x, id.vars = "Week")

ggplot2::ggplot(x, ggplot2::aes(x = Week)) +
  ggplot2::geom_area(ggplot2::aes(y = Adstock.Media), alpha = 0.5) +
  ggplot2::geom_bar(ggplot2::aes(y = Media), stat = "identity")

model1 <- lm(Sales ~ Media, data = x)
model2 <- lm(Sales ~ Adstock.Media, data = x)

summary(model1)
summary(model2)

sum(residuals(model1)^2)
sum(residuals(model2)^2)

sum(residuals(model2)^2) < sum(residuals(model1)^2)
