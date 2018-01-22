setwd("d:/data")
techJob <- read.csv("ustechJob__/diceJob.csv"
                 # ,header=TRUE
                  ,stringsAsFactors=FALSE
                 # ,quote=""
                 # ,sep=","
                 )
head(techJob,1)
summary(techJob)
str(techJob)

names(techJob)

# for(i in c(1:12)) a <- max(data.frame(chr=apply(techJob,2,nchar)[,i]));a
max(data.frame(chr=apply(techJob,2,nchar)[,12]))
