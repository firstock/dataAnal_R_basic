### 분류분석
setwd("E:/github/dataAnal_R_basic")
install.packages("class") #knn
library(class)

# data <- read.csv("data2nd/buy.csv", stringsAsFactors = F)
data <- read.csv("data2nd/like.csv", stringsAsFactors = F)

str(data)
head(data)
names(data) <- gsub('\\.','',names(data))

### buy
# data$age <- scale(data$나이)
# data$pay <- scale(data$월수입)
# 
# 
# train <- data[ ,c(4,5)]
# labels <- data[ ,3]
# 
# ## KNN분류모델에 의한 예측/판별
# test <- data.frame(age= 44, pay= 400)
# 
###

### like
data$talk <- scale(data$말이많은정도)
data$read <- scale(data$책을좋아하는정도)
data$tour <- scale(data$여행을좋아하는정도)
data$score <- scale(data$학교성적)
data$height <- scale(data$키)
data$skin <- scale(data$피부가좋은정도)
data$body <- scale(data$근육질의정도)

head(data$talk)
head(data)
str(data)

labels <- data[ ,8] #호감
train <- data[ ,c(9:15)] #scale한 예측변수

## knn분류모델에 의한 예측/판별
test <- data.frame(talk=50, read= 50
                   ,tour= 50, score=50
                   ,height=50, skin=50
                   ,body=50)

### 
knnpred5 <- knn(train, test, labels, k=5, prob=T); knnpred5
knnpred6 <- knn(train, test, labels, k=6, prob=T); knnpred6

## 왜안되니
for(kn in 1:10){
  knnpred[kn] <- knn(train, test, labels, k=kn, prob= T)
}
knnpred[2] <- knn(train, test, labels, k=2, prob= T)
knnpred[2]


