% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stackCSVsfromFolder.R
\name{stackCSVsfromFolder}
\alias{stackCSVsfromFolder}
\title{Reads all CSVs from a folder, and stacks them by row}
\usage{
stackCSVsfromFolder()
}
\arguments{
\item{No}{arguments}
}
\description{
Reads all CSVs from a folder (pre-set the working directory), and stacks them by row
}
\examples{
list.files(path = paste0(.libPaths(), "/nladwa/extdata/stack"))
setwd(paste0(.libPaths(), "/nladwa/extdata/stack"))
stackCSVsfromFolder()
}
\keyword{csv}
\keyword{stack}
