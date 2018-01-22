getwd()
setwd("D:/data/readFile/")
sv <- read.csv("readcsv_simple.csv", header=TRUE)
str(sv)

sv_sfF <- read.csv("readcsv_simple.csv", header=TRUE,
                   stringsAsFactors=FALSE)
str(sv_safF)
# colnames(sv_sfF) <- c("carName",colnames(sv_sfF)[-1])
colnames(sv_sfF)[1] <- c("carName")
head(sv_sfF,1)


#p45
numchar1 <- read.csv("numChar.csv", header=TRUE)
head(numchar1)
numchar2 <- read.csv("numChar.csv", header=TRUE,
                     na.strings=c("NIL"))
head(numchar2)

sv_think <- read.csv("numChar2.csv", header=TRUE,
                     na.strings=c("NN","NIL","CC"))
sv_think
is.na(sv_think$score)

#p49
read.csv("quote.csv",header=TRUE)
read.csv("quote.csv",quote="'",header=TRUE)
?read.csv
