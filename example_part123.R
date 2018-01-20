#example- p[46,52,78,100]
??nnet()

#####
getwd()
setwd("d:/myR")
x <- rep(1:2,times=2, each=3)
y <- 6:10
save(x, y, file="xy.RData")
#Rstudio ²¯ÄÔ

setwd("d:/myR")
load("xy.RData")
x
y

#####
install.packages("tm")
library()

remove.packages("tm")
library()

??tm

#####
mY <- c(10,20,30)
rep(1:2,times=4)
rep(1:2,each=2)
