## subject1. IS web good? (state~ category)
# read
Sys.setlocale(category = "LC_ALL", locale = "us")

file_path <- "D:/github/dataAnal_R_basic/" #ÇÐ¿ø
setwd(file_path)

job <- read.csv("data/diceJob.csv",stringsAsFactors=FALSE)
kick <- read.csv("data/kick201801.csv",header=TRUE,stringsAsFactors=FALSE
                   ,quote="" ##
                   ,sep=",")
# kickName <- names(kick); kickName

names(kick) <- c("ID",kickName[-1])
names(kick)
names(job)

head(job,1)
head(kick,1)

# column select
# job <- job[c("employmenttype_jobstatus", "jobdescription", "jobtitle", "postdate", "skills")]
kick <- kick[c("name","category","main_category","currency","deadline","goal","launched","pledged","state","backers","country","usd.pledged")]
str(kick)

head(kick$category,100)

# row search select
kick_web <- kick[grep("[wW]eb", kick$category),]
head(kick_web,1)
str(kick_web)

# grep ?????????: list
# grepl ??????: T/F
kick_other2 <- kick[grepl("[wW]eb", kick$category)==FALSE,]
head(kick_other2,1)
str(kick_other2)

getwd()
write.csv(kick_web,"data/kick_web.csv")
write.csv(kick_other2,"data/kick_other2.csv")

# don't need
# merge
# outer_j_k <- merge(x=job, y=kick, all=TRUE)

