% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lm.actualvfitted.gaps.R
\name{lm.actualvfitted.gaps}
\alias{lm.actualvfitted.gaps}
\title{Highlight gaps in the models}
\usage{
lm.actualvfitted.gaps(lm.avf.object, tolerance = 0.2, graph = TRUE, ...)
}
\arguments{
\item{lm.avf.object}{lm.avf object. Output of lm.avf saved as an object.}

\item{tolerance}{Numeric between 0 and 1, e.g. if abs.resid/dep.var > 0.2 then it is highlighted.}

\item{graph}{Logical. If TRUE then plots the variable with shades for gaps.}
}
\description{
Takes a lm.actualvfitted object and plots.
}
\keyword{actual}
\keyword{fitted}
\keyword{gaps}
\keyword{ggplot}
\keyword{lm}
