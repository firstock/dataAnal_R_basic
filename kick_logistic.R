## 가설: 목표금액이 높을 수록 프로젝트 성공률이 낮다.
## goal is smaller than, state will be fail
###web_need_logistic
file_path <- "D:/github/dataAnal_R_basic/" #집== 학원
setwd(file_path)

## 상위 300개. -> sample web인거 아닌거 나눠서 비율별로
# install.packages("data.table")
library(data.table)
kick <- fread("data/kick201801.csv") 

kick300 <- kick[sample(nrow(kick), size=300, replace=TRUE),]
str(kick300)
#같은걸 read.csv로 다시 데려오면 error. 129개 읽어옴

## numeric column only
names(kick300)
names(kick300_num)
kick300_num <- subset(kick300, select=c("deadline","goal","launched"
                                        ,"pledged","state","backers","usd pledged"))

# 단일 데이터셋이라 merge 없음

## state. 범주형 > 0 or 1. 근데 문자열이다??
kick300_num$state
kick300_num$state <- gsub('successful',1,kick300_num$state)
kick300_num$state <- gsub('[^1]+',0,kick300_num$state)

head(kick300_num,1)
names(kick300_num)
str(kick300_num)

# 칼럼명 공백 없애기
names(kick300_num) <- c("deadline","goal","launched","pledged","state","backers","usdpledged")

## 이상치
# error! FUN(newX[, i], ...) : invalid multibyte string, element 64##### 이상치 간단 체크. 칼럼별 celㅣ 최대 길이 보기> 폴(i in 1:length(kick300_num)) {print(max(data.frame(chr = apply(kick300_num, 2, nchar)[, i]))) }
# error! deadline을 다 NA로 밀어버림, goal 9자리 무엇? error! filter랑 sapply랑 의미 공부!. 딴거 <- sapply(kick300_num$goal, function(x) {Filter(function(y) {nchar(as.character(y)) == 9 }, x) })

# install.packages("lubridate")
# kick300_num$deadline

library(lubridate)
kick300_num$deadline_hms <- ymd_hms(kick300_num$deadline)
kick300_num$launched_hms <- ymd_hms(kick300_num$launched)
# head(kick300_num$deadline)
# head(kick300_num$launched)

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
head(kick300_num,100)
str(kick300_num)
summary(kick300_num)

# rm date
kick300_num <- subset(kick300_num,
                      select=c("goal","pledged","state"
                               ,"backers","usdpledged"
                               ,"endY","endMon","endD"
                               ,"endH","endMin","endS","initY","initMon"
                               ,"initD","initH","initMin","initS"))

# "goal","pledged","state"
# ,"backers","usdpledged","deadline_hms"
# ,"launched_hms","endY","endMon","endD"
# ,"endH","endMin","endS","initY","initMon"
# ,"initD","initH","initMin","initS"

# as.numeric
# ??apply
# apply(kick300_num, dimcode=1, function(x){  as.numeric(x)})
kick300_num$goal <- as.numeric(kick300_num$goal)
kick300_num$pledged <- as.numeric(kick300_num$pledged)
kick300_num$state <- as.numeric(kick300_num$state)
kick300_num$backers <- as.numeric(kick300_num$backers)
kick300_num$usdpledged <- as.numeric(kick300_num$usdpledged)



# install.packages("caret")
# install.packages("corrplot")
# install.packages("FactoMineR")
library(caret)
library(corrplot)
library(FactoMineR)

# 그냥 보기
plot(kick300_num$usdpledged, kick300_num$state)
plot(kick300_num$usdpledged)

# error!
# 상관관계. 종속변수가 factor라서 로지스틱 회귀 써야.
# kick300_num$state <- as.factor(kick300_num$state)
str(kick300_num)

# na.omit(kick300_num)

mod <- glm(state~., data=kick300_num)
summary(mod)
plot(mod)

#error !
??cor
cor <- cor(round(kick300_num[,1:17],digit=0))
crpl<- corrplot.mixed(cor,lower="number",upper="color")
# write.csv(crpl,"result/crplllll.csv")


# error!
#교차표
# install.packages("stats")
library(stats)
xtabs(formula=state~., data= kick300_num)