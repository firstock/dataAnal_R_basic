#p62
filePath <- "D:/github/dataAnal_R_basic" #ÇÐ¿ø
setwd(filePath)

# space
ar <- read.delim("data/tab.txt", sep=" ")
dim(ar)
head(ar,2)
# blank
ar <- read.delim("data/tab.txt", sep="")
dim(ar)
head(ar,2)

# ==read.csv
ar <- read.delim("data/tab.txt", sep="\t")
dim(ar)
head(ar,2)

# csv, blank
ars <- read.csv("data/tab.csv", sep="")
dim(ars)
head(ars,2)

# csv, space
ars <- read.csv("data/tab.csv", sep=" ")
dim(ars)
head(ars,2)
