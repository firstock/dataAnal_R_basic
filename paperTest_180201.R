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




확률표집 <- c("단순무작위표집","층화표집","계통표집", "집락표집")
비확률표집 <- c("편의표집", "유의표집", "눈덩이표집", "할당표집")
data.frame(확률표집, 비확률표집)

##which 안 쓰면 가끔 근본없는 NA가 나타나기도 함
mtcars[mtcars$hp>=200,]
mtcars[which(mtcars$hp>=200),]

