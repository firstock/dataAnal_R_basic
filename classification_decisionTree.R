### 의사결정나무
getwd()
setwd("E:/github/dataAnal_R_basic")

## 자료설명
## 분석목적
## 분석에 필요한 함수 및 패키지
# install.packages("rpart")
# install.packages("rpart.plot")
# install.packages("party")
library(rpart)
library(rpart.plot) #prp
library(party) #ctree


# ## Decision Tree 생성
# str(iris)
# summary(iris)
# data1 <-  iris
# newData<- iris

# skin
data1 <- read.csv("data2nd/skin.csv")
head(data1)
str(data1)

newData<- data1 # 일단~



# scale 필요없다.

# m <- rpart(Species~., data= data1); m
m <- rpart(쿠폰반응여부~., data= data1); m
m <- rpart(쿠폰반응여부~., data= data1
                 ,control= rpart.control(minsplit= 2)); m
m <- rpart(쿠폰반응여부~성별+ 나이+ 직장여부+ 결혼여부+ 차량보유여부, data= data1
                 ,control= rpart.control(minsplit= 2)); m

# ??rpart

# str(m)

## 시각화
plot(m, compress= T, margin= .1)
text(m, cex= 1.0)


## plot.rpart를 이용해서 시각화
prp(m, type= 4, extra= 2, digits= 3)


## 분류모델을 통해 예측 수행
head(predict(m, newdata= newData, type= "prob"))


## 검정: 적절한 가지 수 선택
m$cptable
plotcp(m)

## 조건부 추론 나무 생성 및 시각화
m <- ctree(쿠폰반응여부~., data= data1); m
m <- ctree(쿠폰반응여부~., data= data1, control= ctree_control(minsplit=1,minbucket=1,testtype="Univariate")); m
m <- ctree(쿠폰반응여부~성별+ 나이+ 직장여부+ 결혼여부+ 차량보유여부, data= data1, control= ctree_control(minsplit=1,minbucket=1,testtype="Univariate")); m

plot(m)
