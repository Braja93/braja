library(devtools)
library(roxygen2)

### building package

# before running, paste DESCRIPTION & R folder from 00 - files
# http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/

document()

### delete package from local

remove.packages("nladwa")

#### ways to install

install_github("nladwa/nladwa") # from github

setwd("..") # from local
install("nladwa")
library(nladwa)


