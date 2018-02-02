## paper text_2.1.금 prepare
setwd("D:/github/dataAnal_R_basic")

## 막대그래프
hist(mtcars$drat, freq=T, main="위에", xlab="x name") #frequency
hist(mtcars$drat, freq=F, main="위에", xlab="x name") #density
??hist

# 구불구불 선
lines(density(mtcars$hp))
lines(density(mtcars$drat), col="blue")
mtcars$hp
mtcars$drat
??lines

#세로 선
abline(v=mean(mtcars$drat), lty="dotted", lwd=3, col="purple")
??abline
median(mtcars$drat)
abline(v=median(mtcars$drat), lty="dashed", lwd=3, col="red")

#중위수 텍스트 추가
text(3.8, 0.77, "중위수", adj=0, col="red")




확률표집 <- c("단순무작위표집","층화표집","계통표집", "집락표집")
비확률표집 <- c("편의표집", "유의표집", "눈덩이표집", "할당표집")
data.frame(확률표집, 비확률표집)

##which 안 쓰면 가끔 근본없는 NA가 나타나기도 함
mtcars[mtcars$hp>=200,]
mtcars[which(mtcars$hp>=200),]


??regsubsets
install.packages("mlbench") #BostonHousing
install.packages("leaps") #regsubsets
library(mlbench)
library(leaps)
# detach("package:car")
data("BostonHousing")
reg_m <- regsubsets(medv~., data=BostonHousing)
??BostonHousing

# is.data.frame(BostonHousing)


df <- data.frame(
  gender = c(rep("female",3),rep("male",3),seq(1,4,2))
  , weight= seq(40,71,4)
  , height= seq(150,181,4)
); df

order(df$weight, dcreasing=T)


v1 <- seq(40,71,4); v1
order(v1, decreasing=T)
v1[order(v1, decreasing=T)]



RMSE = c("추정치와 실제값 간의 차이를 나타내기위한 척도"
         , "오차제곱의 평균에 제곱근을 씌운 형태"
         , "sqrt(mean(error^2))")
RMSE


install.packages("corrgram")
library(corrgram)

corrgram(cor(attitude), type="corr", upper.panel= panel.conf
         ,cor.method= "spearman", main="비선형")
args(corrgram)

corrgram(cor(attitude),"corr", upper.panel= panel.conf
         ,cor.method= "spearman", main="비선형")

??cor



#결과 왜이럼. old 6 나와야 하는데.
x <- factor(sample(c(rep("new",5), rep("old",6), "SSold"))); x
table(x)
which.max(table(x))
