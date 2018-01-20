#p184
as.complex(-1)
sqrt(as.complex(-1))

sqrt(-1)
#
xc1 <- -1+2i
yc2 <- -1-2i
xc1+yc2
#
tctT1 <- as.POSIXct("2010-06-01 01:01:01")
tctT2 <- as.POSIXct("2010-06-15 01:01:01")
tctT2-tctT1
#
vDateTime <- c("05-11-15 01:01:01","05-11-15 01:02:01")
tctDateTime <- as.POSIXct(vDateTime)
tltDateTime <- as.POSIXlt(vDateTime)
# typeof(vDateTime)
# typeof(tctDateTime)

str(tctDateTime)
str(tltDateTime)
# sec+= 10
tctDateTime+ 10
tltDateTime+ 10
#
sDate <- c("05/15/11","05/15/11")
sTime <- c("01:01:01","01:02:01")
sDateTime <- paste(sDate, sTime)
str(sDateTime)

iDateTime <- strptime(sDateTime,"%m/%d/%y %H:%M:%S")
iDateTime
str(iDateTime)
is.list(iDateTime)

#p189
vector <- c(seq(from=100,to=500, by=100))
vector[-2]
#
rep(c('a','b'),each=20) #40