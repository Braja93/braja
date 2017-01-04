library(data.table)
library(mgcv)
library(ggplot2)

mtcars <- data.table(mtcars)

set.seed(123)
mtcars[, curve := (1 / (1 + exp(-(mpg - mean(mpg))))) + rnorm(n = .N, mean = 0, sd = 0.1)]

ggplot(mtcars, aes(x = curve, y = mpg)) +
  geom_point()

m1 <- lm(formula = mpg ~ wt + hp + gear + curve, data = mtcars)

m2 <- gam(formula = mpg ~ s(wt) + s(hp) + gear, data = mtcars)

m3 <- gam(formula = mpg ~ s(wt) + s(hp) + gear + s(curve, k = 3), data = mtcars)

summary(m3)

anova(m1, m2, m3, test = "Chi")

nladwa::gam.contribution.ggplot(nladwa::gam.contribution(m2))
nladwa::gam.contribution.ggplot(nladwa::gam.contribution(m3))
