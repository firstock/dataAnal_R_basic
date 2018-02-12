# data> http://marketdata.krx.co.kr/mdi#document=010401 어드메
setwd("E:/github/dataAnal_R_basic/data2nd")

## read, merge
(file_list= list.files(pattern="*.csv$"))

firstfileName <- file_list[1]#merge용 첫 파일
dataset <- read.csv(firstfileName, header=T, sep=",")
names(dataset)
for(file in file_list[-1]){
  print(file)
  temp= read.csv(file, header=T, sep=",")
  dataset <-  merge(dataset, temp, by="date", all=T)
}

head(dataset,3)
write.csv( dataset, "merge_index.csv", row.names=FALSE)


## linear regression
setwd("E:/github/dataAnal_R_basic")
data <- read.csv("merge_index.csv", header=T, sep=",")

summary(data)
head(data)

# m <- lm(data$h_price ~ data$kospi)
m <- lm(data$s_price ~ data$kospi)



## 결과추출
coef(m)
fitted(m)[1:4]
residuals(m)[1:4]


## 예측과 신뢰구간
predict.lm(m, newdata= data.frame(speed=3))
  #'newdata'는 1 개의 행을 가지고 있었습니다. 그러나 찾아진 변수는 249개의 행을 가지고 있었습니다. 
  #' ERROR ! ?? 1개만 나와야 할 것 같은데??
coef(m)


## 모델평가
summary(m) #설명력 22% ;;;;;


## 모델진단 그래프
plot(m)


## 회귀직선의 시각화
#ㄴㄴplot(data$h_price, data$kospi)
plot(data$kospi, data$h_price)
abline(coef(m))

coef(m)
