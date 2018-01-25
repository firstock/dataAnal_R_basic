###web_need_easy
file_path <- "D:/github/dataAnal_R_basic/" #집== 학원
setwd(file_path)

# ## 상위 300줄만 추출
# # install.packages("data.table")
# library(data.table)
# 
# kick <- fread("data/kick201801.csv")
# kick300 <- head(kick,300)
# write.csv(kick300,"data/kick18_easy.csv")

## 엑셀로 text 데이터 다 지우기. state빼고
## 다루기 쉬운 data.frame으로 다시 데려옴
kickE <- read.csv("data/kick18_easy.csv")
kickE$state <- factor(kickE$state)
# head(kickE$state,100)
# 단일 데이터셋이라 merge 없음
# #

## state. 범주형 > 숫자화. 1~5
stateSort <- unique(kickE$state)
stateSort
for(i in 1:length(stateSort)){
  kickE$state <- gsub(stateSort[i],i,kickE$state)
}

head(kickE,1)
names(kickE)

# 이상치 간단 체크. 칼럼별 celㅣ 최대 길이 보기
for(i in 1:length(kickE)) {
  print(max(data.frame(chr = apply(kickE, 2, nchar)[, i])))
}
# goal 9자리 무엇? 
# length(kickE[,"goal"])==9 #ㄴㄴ
# 이거됨?? 
kickE_g9 <-
  sapply(kickE, function(x) {
    Filter(function(y) {
      nchar(y) == 9
    }, x)
  })


## string -> date.deadline, launched
# ??lubridate
# install.packages("lubridate")
library(lubridate)
kickE$deadline <- ymd_hm(kickE$deadline)
kickE$launched <- ymd_hm(kickE$launched)
head(kickE$deadline)
head(kickE$launched)

## date -> 정수형 파생변수 만들기
kickE$endY <- year(kickE$deadline)
kickE$endMon <- month(kickE$deadline)
kickE$endD <- day(kickE$deadline)
kickE$endH <- hour(kickE$deadline)
kickE$endMin <- minute(kickE$deadline)

kickE$initY <- year(kickE$launched)
kickE$initMon <- month(kickE$launched)
kickE$initD <- day(kickE$launched)
kickE$initH <- hour(kickE$launched)
kickE$initMin <- minute(kickE$launched)

names(kickE)
head(kickE,2)

## 가설: 목표금액이 높을 수록 프로젝트 성공률이 낮다. goal is smaller than, state will be fail
## 종속변수_state ~ 독립변수_goal + pledged+ backers+ usd.pledged
cor <- cor(round(kickE[,-c(1:2,4)],digit=0))

#error !
