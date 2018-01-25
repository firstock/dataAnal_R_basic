###web_need_easy
file_path <- "D:/github/dataAnal_R_basic/" #집== 학원
setwd(file_path)

## 무작위 샘플 300개
# install.packages("data.table")
library(data.table)
kick <- fread("data/kick201801.csv")
# example(sample)
kick300 <- head(kick,300)
str(kick300)

## 엑셀로 text 데이터 다 지우기. state빼고
## 다루기 쉬운 data.frame으로 다시 데려옴
names(kick300)
subset(kick300
       , select=c("deadline","goal","launched"
                  ,"pledged","state","backers"
                  ,"usd pledged")
)

# 단일 데이터셋이라 merge 없음
# #

## state. 범주형 > 숫자화. 1~5
# error. 5번째에 이상한 게 옴
kick300$state
stateSort <- unique(kick300$state)
head(stateSort,5)
for(i in 1:length(stateSort)){
  kick300$state <- gsub(stateSort[i],i,kick300$state)
}

head(kick300,1)
names(kick300)
str(kick300)

# # error! FUN(newX[, i], ...) : invalid multibyte string, element 64
# # 이상치 간단 체크. 칼럼별 celㅣ 최대 길이 보기
# for(i in 1:length(kick300)) {
#   print(max(data.frame(chr = apply(kick300, 2, nchar)[, i])))
# }

# # error! 원하는대로 나오지 X. deadline을 다 NA로 밀어버림
# # goal 9자리 무엇?
# # length(kick300[,"goal"])==9 #ㄴㄴ
# # error! filter랑 sapply랑 의미 공부!
# kick300_g9 <-
#   sapply(kick300$goal, function(x) {
#     Filter(function(y) {
#       nchar(as.character(y)) == 9
#     }, x)
#   })
# kick300_g9

## string -> date.deadline, launched
# ??lubridate
# install.packages("lubridate")

kick300$deadline

library(lubridate)
kick300$deadline_hm <- ymd_hms(kick300$deadline)
kick300$launched_hm <- ymd_hms(kick300$launched)
head(kick300$deadline)
head(kick300$launched)

## date -> 정수형 파생변수 만들기
kick300$endY <- year(kick300$deadline)
kick300$endMon <- month(kick300$deadline)
kick300$endD <- day(kick300$deadline)
kick300$endH <- hour(kick300$deadline)
kick300$endMin <- minute(kick300$deadline)
kick300$endS <- second(kick300$deadline)


kick300$initY <- year(kick300$launched)
kick300$initMon <- month(kick300$launched)
kick300$initD <- day(kick300$launched)
kick300$initH <- hour(kick300$launched)
kick300$initMin <- minute(kick300$launched)
kick300$initS <- second(kick300$deadline)

names(kick300)
head(kick300,2)

## 가설: 목표금액이 높을 수록 프로젝트 성공률이 낮다. goal is smaller than, state will be fail
## 종속변수_state ~ 독립변수_goal + pledged+ backers+ usd.pledged
# install.packages("caret")
# install.packages("corrplot")
# install.packages("FactoMineR")
library(caret)
library(corrplot)
library(FactoMineR)

mod <- lm(state~ ., data=kick300)
plot(mod)

cor <- cor(round(kick300[,],digit=0))

#error !
