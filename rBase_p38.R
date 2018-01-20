# p.42
setwd("D:/myR")
x <- 1:5
y <- 6:10
save(x,y, file="xy.RData")

Sys.getenv("R_HOME")
Sys.getenv("HOME")
# 안되나 Sys.setenv("HOME","D:/myR")

list.files()
dir()

# 없으면 폴더 만들기
if(!file.exists("data")){
  dir.create("data")
}

file.exists("xy.*")
file.exists("data")


####

# ??regex
# ??KoNLP
# install.packages("KoNLP")
# install.packages("rex")
# install.packages("stringr")
# install.packages("stringi")

??nnet
??regression
??kmeans
RSiteSearch("kmeans")


#p.50
RSiteSearch("decisionTree")

install.packages("C50")
library(C50)
example(plot.C5.0)


.libPaths()

#p.69
search()
library()

library(zoo)
suppressMessages(require(zoo))
search()
# 메모리에서 zoo내리기
detach(package:zoo)

search()


#p.71 실습없이 넘어감
