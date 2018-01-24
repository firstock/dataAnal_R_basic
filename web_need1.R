#fail. ??????. ???????????? 4?????? ?????? ??? ??????
file_path <- "D:/github/dataAnal_R_basic/" #ÇÐ¿ø
setwd(file_path)

# install.packages("data.table") #????????? ?????????!
# install.packages("csvread")
install.packages("tm")

library(data.table)
library(NLP)
library(tm)

job <- fread("data/diceJob.csv")
kick <- fread("data/kick201801.csv")
str(kick)
head(kick,10)
names(kick)

# max(data.frame(chr = apply(job, 2, nchar)[, 1])) #at data.table?

names(job)
head(job,5)

# column type ??????
kick$category <- factor(kick$category)
kick$state <- factor(kick$state)

# ?????? ??????. state: 6, category: 159
kick_state <- kick$state
kick_state <- unique(kick_state)
kick_state

kick_category <-kick$category
kick_category <- unique(kick_category)
str(kick_category)
kick_category
write.csv(kick_category,"result/kick_category.csv")


# text clustering. no data frame param
dist_category <- dist(kick_category, method="euclidean")
groups <- hclust(dist_category, method="ward.D")
plot(groups, cex=0.9, hang=-1)
rect.hclust(groups, k=5)

?hclust
# column select
# job <- job[c("employmenttype_jobstatus", "jobdescription", "jobtitle", "postdate", "skills")]

# row search select

# ????????? ??? ??????
# kick_colShift <- kick[grep("\\d", kick$currency),]
# head(kick_colShift,6)

kick$state

kick_web <- kick[grep("[wW]eb", kick$category),]
str(kick_web)
head(kick_web,6)

# grep ?????????: list
# grepl ??????: T/F
kick_other2 <- kick[grepl("[wW]eb", kick$category)==FALSE,]
head(kick_other2,6)
str(kick_other2)

getwd()
write.csv(kick_web,"data/kick_web.csv")
write.csv(kick_other2,"data/kick_other2.csv")

# don't need
# merge
# outer_j_k <- merge(x=job, y=kick, all=TRUE)

