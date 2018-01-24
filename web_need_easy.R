###web_need_easy
file_path <- "D:/github/dataAnal_R_basic/" #학원
setwd(file_path)

## 상위 300줄만 추출
# install.packages("data.table")
library(data.table)

kick <- fread("data/kick201801.csv")
kick300 <- head(kick,300)
write.csv(kick300,"data/kick18_easy.csv")

## 엑셀로 text 데이터 다 지우기. state빼고
## 다루기 쉬운 data.frame으로 다시 데려옴
kickE <- read.csv("data/kick18_easy.csv")
kickE$state <- factor(kickE$state)
# head(kickE$state,100)
# 단일 데이터셋이라 merge 없음
# #

## state. 범주형 > 숫자화
stateSort <- unique(kickE$state)
stateSort
# stateSort[5]
# length(stateSort)

for(i in 1:length(stateSort)){
  kickE$state <- gsub(stateSort[i],i,kickE$state)
}
# head(kickE$state,100)

head(kickE,1)
names(kickE)

for(i in 1:length(kickE)){
  print(max(data.frame(chr=apply(kickE,2,nchar)[,i])))
}



## date -> 정수형 파생변수 만들기. deadline, launched
??lubridate

## 가설: 목표금액이 높을 수록 프로젝트 성공률이 낮다. goal is smaller than, state will be fail
## 종속변수_state ~ 독립변수_goal + pledged+ backers+ usd.pledged
cor <- cor(round(kickE[,-1],digit=0))
