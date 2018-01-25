###web_need_easy
file_path <- "D:/github/dataAnal_R_basic/" #집== 학원
setwd(file_path)

## 상위 300개
# install.packages("data.table")
library(data.table)
kick <- fread("data/kick201801.csv") 
# example(sample)
kick300 <- head(kick,300)
str(kick300)
#같은걸 read.csv로 다시 데려오면 error. 129개 읽어옴

## numeric column only
names(kick300)
kick300_num <- subset(kick300, select=c("deadline","goal","launched"
                  ,"pledged","state","backers","usd pledged"))

# 단일 데이터셋이라 merge 없음

## state. 범주형 > 숫자화. 1~5
kick300_num$state
stateSort <- unique(kick300_num$state)
head(stateSort,5)
for(i in 1:length(stateSort)){
  kick300_num$state <- gsub(stateSort[i],i,kick300_num$state)
}

head(kick300_num,1)
names(kick300_num)
str(kick300_num)

## as.numeric



## 이상치?
# error! FUN(newX[, i], ...) : invalid multibyte string, element 64##### 이상치 간단 체크. 칼럼별 celㅣ 최대 길이 보기> 폴(i in 1:length(kick300_num)) {print(max(data.frame(chr = apply(kick300_num, 2, nchar)[, i]))) }
# error! deadline을 다 NA로 밀어버림, goal 9자리 무엇? error! filter랑 sapply랑 의미 공부!. 딴거 <- sapply(kick300_num$goal, function(x) {Filter(function(y) {nchar(as.character(y)) == 9 }, x) })

# install.packages("lubridate")
kick300_num$deadline

library(lubridate)
kick300_num$deadline_hm <- ymd_hms(kick300_num$deadline)
kick300_num$launched_hm <- ymd_hms(kick300_num$launched)
head(kick300_num$deadline)
head(kick300_num$launched)

## date -> 정수형 파생변수 만들기
kick300_num$endY <- year(kick300_num$deadline)
kick300_num$endMon <- month(kick300_num$deadline)
kick300_num$endD <- day(kick300_num$deadline)
kick300_num$endH <- hour(kick300_num$deadline)
kick300_num$endMin <- minute(kick300_num$deadline)
kick300_num$endS <- second(kick300_num$deadline)


kick300_num$initY <- year(kick300_num$launched)
kick300_num$initMon <- month(kick300_num$launched)
kick300_num$initD <- day(kick300_num$launched)
kick300_num$initH <- hour(kick300_num$launched)
kick300_num$initMin <- minute(kick300_num$launched)
kick300_num$initS <- second(kick300_num$deadline)

names(kick300_num)
head(kick300_num,2)
str(kick300_num)
summary(kick300_num)

## 가설: 목표금액이 높을 수록 프로젝트 성공률이 낮다. goal is smaller than, state will be fail
## 종속변수_state ~ 독립변수_goal + pledged+ backers+ usd.pledged
# install.packages("caret")
# install.packages("corrplot")
# install.packages("FactoMineR")
library(caret)
library(corrplot)
library(FactoMineR)

# 상관관계. 종속변수가 factor라서 로지스틱 회귀 써야.
kick300_num$state <- as.factor(kick300_num$state)
str(kick300_num)

mod <- lm(state~ goal, data=kick300_num)
summary(mod)


#error !
cor <- cor(round(kick300_num[,],digit=0))

