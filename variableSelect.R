#step6. 변수선택하
getwd()
setwd("E:/github/dataAnal_R_basic")

install.packages("leaps")
library(leaps)

install.packages("mlbench") #BostonHousing
library(mlbench)

data(BostonHousing)
head(BostonHousing)

#medv 빼고 다 넣어라
reg_m <- regsubsets(medv ~., data= BostonHousing)
summary(reg_m)

names(reg_m) #bic, adjr2 이 어디있음???
summary(reg_m)$bic
summary(reg_m)$adjr2

# par(mfrow= c(1,1)) #plot 초기화
par(mfrow= c(3,1)) #plot 판대기
plot(summary(reg_m)$adjr2)
plot(reg_m)
plot(reg_m, scale="r2")


