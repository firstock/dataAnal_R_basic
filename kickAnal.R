Sys.setlocale(category = "LC_ALL", locale = "us")
setwd("d:/data")
kick <- read.csv("kick__/k201801.csv"
                  ,header=TRUE
                  ,stringsAsFactors=FALSE
                  ,quote=""
                  ,sep=",")
# quote 없이 read> kickName만 뽑은 다음에
# 위엣걸로 다시 read
# kick <- read.csv("kick__/k201801.csv"
#                  ,header=TRUE
#                  ,stringsAsFactors=FALSE
#                  ,sep=",")
# kickName <- names(kick); kickName
names(kick) <- c("ID",kickName[-1])
names(kick)

head(kick,2)
str(kick)
colnames(kick)
summary(kick)

data.frame(chr=apply(kick,2,nchar)[2,])
max(data.frame(chr=apply(kick,2,nchar)[,1])$chr)
max(data.frame(chr=apply(kick,2,nchar)[,2]))

max(data.frame(chr=apply(kick,2,nchar)[,2])$chr)
kick

kick[,length(kick$ID)>10]
