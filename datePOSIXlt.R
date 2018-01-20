#p120
getwd()
setwd("D:/myR")
aapl <- read.csv("data/aapl.csv", header= TRUE)
# aapl_f <- read.csv("data/aapl_f.csv", header= FALSE)

# head(aapl_f,3)
str(aapl)
summary(aapl)

aapl$Date2 <- as.POSIXlt(aapl$Date)
aapl$year <- aapl$Date2$year+ 1900
aapl$mon <- aapl$Date2$mon+1
aapl$mday <- aapl$Date2$mday
aapl$wday <- aapl$Date2$wday

head(aapl$Date2$wday,7)
# tail(aapl$Date2$wday,7)
head(weekdays(aapl$Date2),7)

names(aapl)
summary(aapl)

#visualization
close2 <- aapl$Close
hist(close2, freq= FALSE)
lines(density(close2))

abline(v=mean(close2), lty="dotted", col="red")
abline(v=median(close2), lty="dashed", col="green")
abline(v=quantile(close2, c(0.95)),col="blue")

#p125
aapl_sub <- subset(aapl, (year>=2010) & (year!=2013))
str(aapl_sub$year)
plot(aapl_sub$mon, aapl_sub$Close, col=as.integer(aapl_sub$year))
legend(
  "topleft",
  legend = levels(factor(aapl_sub$year)),
  col = levels(factor(aapl_sub$year)),
  pch = 1
)

summary(aapl_sub)

#ÀüÃ¼ max 
subset(aapl_sub, aapl_sub$Close == max(Close))

