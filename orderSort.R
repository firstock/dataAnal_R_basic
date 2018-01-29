setwd("d:/github/dataAnal_R_basic")
getwd()
vScore <- c(30,10,40,50,20,20,10,20,50)

fScore <- ordered(vScore)

ordered(fScore)

order(fScore)
order(vScore, decreasing= T) #값이 아니라 index

vScore[order(vScore)]

sort(vScore)

vScore_d <- c(30,10,40,50,20,20,10,20,50)
order(vScore_d)

c(30,10,40,50,20,20,10,20,50)

#
(iris[order(iris$Petal.Length, iris$Petal.Width),])

write.csv(head(iris[order(iris$Petal.Length, iris$Petal.Width), ]),"result/order_iris_.csv")

#
# install.packages("doBy")
library(doBy)
??orderBy

#summary 결과보고 정렬의 기준이 1순위가 되는 속성을 기재하시오
summary(iris)



#orderBy(~ 정렬기준1+정렬기준2, 데이터셋)
orderBy(~ Sepal.Width, iris)
orderBy(~ Species+ Sepal.Width, iris)
# 정렬하되 첫번째 우선순위 Species, 두번째 Sepal.Width, 세번째 Petal.Length 되도록
ord_sepe <- orderBy(~ Species+ Sepal.Width+ Petal.Length, iris)
head(ord_sepe,8)

# 파일없어서 만듦
col1 <- c(seq(20,60,by=10))
col2 <- c(seq(40,80,by=10))
orderbytable <- data.frame(col1,col2)
names(orderbytable)<- c("순위","영화명")
write.csv(orderbytable,"data/orderbytable.csv")

#
ordbytable <- read.csv("data/orderbytable.csv",header=T)
str(ordbytable)
head(ordbytable)

ordbytable$영화명
orderedtable <- ordbytable[order(ordbytable$영화명, decreasing= T), ]
write.csv(orderedtable,"data/ordered_table.csv")


#시각화



#그룹화
install.packages("reshape2")
library(reshape2)

length(airquality[is.na(airquality)])
names(airquality) <- tolower(names(airquality))
#결측값 있는 44개 제거. melt?
aqm <- melt(airquality, id=c("month", "day"), na.rm=TRUE)
aqm

# install.packages("plyr")
library(plyr)
# detach("package:reshape2", unload=TRUE)
# . ???
# acast: https://www.rdocumentation.org/packages/reshape2/versions/1.4.3/topics/cast 다시 틀 짜
reshape2::acast(aqm, variable~ month, mean, subset= .(variable=="ozone"))

acast(aqm, variable~ month, mean, subset= .(variable=="solar.r"))

acast(aqm, variable~ month, mean, subset= .(variable=="wind"))

acast(aqm, variable~ month, mean, subset= .(variable=="temp"))
