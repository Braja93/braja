x <- iris
findCharAcrossCols(x, "virg")
x[findCharAcrossCols(x, "virg")$Species, ]