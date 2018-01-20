getwd()
setwd("d:/myR")

btcD <- read.csv("data/btc/bitstampUSD_2012-2018.csv", header=TRUE)
str(btcD)
summary(btcD)
head(btcD,3)

hist(btcD, freq= FALSE)
lines(density(btcD))

curMax <-  subset(btcD, btcD$Volume_.Currency. == max(Volume_.Currency.))
curmin <-  subset(btcD, btcD$Volume_.Currency. == min(Volume_.Currency.))
curMax
curmin
# head(as.POSIXct(btcD$Timestamp, origin="1960-01-01"),1)
as.POSIXct(curMax$Timestamp, origin="1960-01-01")
as.POSIXct(curmin$Timestamp, origin="1960-01-01")
