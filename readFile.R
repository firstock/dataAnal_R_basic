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

#p50. 직접 손으로 ??? 말도 안돼

#p51
cols <- read.csv("quote.csv", header=TRUE, quote="'",
                 colClasses=c("character","numeric",
                              "numeric","numeric","factor"));cols

#p52
icheon <- read.csv("기상이천시강수량_20100101-20151231.csv")
head(icheon,10)
icheon2 <- read.csv("기상이천시강수량_20100101-20151231.csv",skip=6)
head(icheon2,10)


icheon <- structure(icheon
                    , "Term"="2010.1.1~2015.12.31"
                    , "district"="Icheon"
                    , "description"="일단위 측정")
str(icheon)


#p54
stock.data <- read.csv("kos-dateVol.csv")
str(stock.data)
head(stock.data)

stock.data$time1 <- as.POSIXlt(stock.data$time)
str(stock.data)
head(stock.data)
stock.data$time1

stock.data$time1$year
stock.data$year1 <- stock.data$time1$year+1900
stock.data$mon1 <- stock.data$time1$mon+1
stock.data$day1 <- stock.data$time1$mday
head(stock.data,10)

write.csv(stock.data,"D:/data/result/final_stock_data.csv")

#p56
revg <- read.csv("icheon_revgeo.csv",stringsAsFactors=F)
head(revg$result)

strules_ic <- mapply(strsplit, revg$result, ",", USE.NAMES=F)
head(strules_ic)

tf <- tempfile()
writeLines(revg$result, tf)

read.csv(tf, fill=TRUE)
ncol <- max(count.fields(tf, sep=","))
# head(read.csv(tf, fill=TRUE, header=FALSE,
#               col.names=paste0("V",seq_len(ncol))))
address_drivenVal <- read.csv(tf, fill=TRUE, header=FALSE,
              col.names=paste0("V",seq_len(ncol)))

# revg$result[1]
# strules_ic[[1]][1]

write.csv(address_drivenVal, "D:/data/result/final_address.csv")


#sns 키워드 가공. 날짜 +
setwd("d:/data")
tw <- read.csv("_tweets_web.csv")
colnames(tw)
head(tw,1)

tw$time <- as.POSIXlt(tw$created)
tw$year <- tw$time$year+1900
tw$mon <- tw$time$mon+1
tw$day <- tw$time$mday

tw$hour <- tw$time$hour
tw$min <- tw$time$min
tw$sec <- tw$time$sec

tw$time


# 주소가공
libAddr <- read.csv("libraryPublic.csv",skip=2)
head(libAddr,1)
# libAddr <- read.csv(text=gsub('?',readLines("libraryPublic.csv"))
#                     ,sep=",",skip=2)
# libAddr <- gsub("\?","",libAddr)
