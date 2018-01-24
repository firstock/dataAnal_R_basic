file_path <- "D:/github/dataAnal_R_basic/" #ÇÐ¿ø
setwd(file_path)

# Sys.setlocale(category = "LC_ALL", locale = "us") #read.csv tempSolution
# install.packages("data.table") #????????? ?????????!
# install.packages("csvread")
library(data.table)
# library(csvread)

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


# column select
# job <- job[c("employmenttype_jobstatus", "jobdescription", "jobtitle", "postdate", "skills")]

str(kickSome)
kickSome["category"]
kickSome$category

# row search select
kick_web <- kickSome[grep("[wW]eb", kickSome$category),]
str(kick_web)
head(kick_web,6)

# grep ?????????: list
# grepl ??????: T/F
kick_other2 <- kickSome[grepl("[wW]eb", kickSome$category)==FALSE,]
head(kick_other2,1)
str(kick_other2)

getwd()
write.csv(kick_web,"data/kick_web.csv")
write.csv(kick_other2,"data/kick_other2.csv")

# don't need
# merge
# outer_j_k <- merge(x=job, y=kick, all=TRUE)

