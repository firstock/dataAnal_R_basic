## 파생변수 생성- 구간
getwd()
# setwd("E:\github\dataAnal_R_basic")

vMPG <- mtcars$mpg; vMPG
vMPG[32] <- 30 #not high but medium
vMPG

#초과~이하
include.lowest= F
right= T
vMPG$cul_lebel <-cut(vMPG, breaks= c(0,20,30,50), labels= c("low","medium","high"))

vMPG
