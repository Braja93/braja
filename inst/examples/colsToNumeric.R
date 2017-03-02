mtcars.fudged <- data.table(mtcars)
mtcars.fudged[, `:=`(mpg = paste0(mpg, "%"),
                     qsec = gsub("\\.", ",", qsec),
                     drat = paste0("-", drat))]

colsToTransform <- names(Filter(is.character, mtcars.fudged))

colsToNumeric(mtcars.fudged, colsToTransform)

str(mtcars.fudged)

colsToNumeric(mtcars.fudged, colsToTransform, overwrite = TRUE)

str(mtcars.fudged)
