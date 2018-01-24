#################################################################3
#빅데이터 분석을 위한 데이터 탐색 및 가공, 한희선 저
#인터넷 교보문고
#cafe.naver.com/dataan
#########################################################

#################################################################3
#Chapter. Crosstab
#cafe.naver.com/dataan
#########################################################
#두 속성(변수)의 값 구성 파악을 위한 교차표
table(c("a", "b", "b", "b", "c", "c", "d"))
tabl<-(table(c("a", "b", "b", "b", "c", "c", "d")))
tabl[order(tabl)]
tabl[order(tabl,decreasing = T)]

#명목형 속성 2개, 숫자형 속성 1개의 교차표 http://cafe.naver.com/dataan/143

d <- data.frame(x=c("1", "2", "2", "1"),
                type=c("A", "B", "A", "B"),
                num=c(3, 5, 8, 7))
d

xt <- xtabs(num~x + type, data =d)
xt
tapply(d$num,list(d$x,d$type),sum)

col <- data.frame (c1=c("A", "A", "A", "B", "B"), c2 =c(1, 1, 1, 2, 2))
col
xtabs(~c1,col)

#length 교차표 http://cafe.naver.com/dataan/144
data(mtcars)
str(mtcars)
head(mtcars,4)
tapply(mtcars$mpg, list(mtcars$gear, mtcars$cyl), length)

#기어 및 실린더 개수별 평균 연비교차표 http://cafe.naver.com/dataan/145

xtabs(mpg ~ gear+cyl,data=mtcars)
tapply(mtcars$mpg, list(mtcars$gear, mtcars$cyl), length)
tapply(mtcars$mpg, list(mtcars$gear, mtcars$cyl), mean)
xtabs(mpg ~ gear+cyl,data=mtcars)/tapply(mtcars$mpg, list(mtcars$gear, mtcars$cyl), length)

#교차표의 열이름 읽기
a <- letters[1:3]
a_sa<-table(a, sample(a)) 
colnames(a_sa)

a_sa_d0<-table(a, sample(a), deparse.level = 0)
names(a_sa_d0)#NULL
colnames(a_sa_d0)
#deparse.level = 2으로 설정하면 행이름과 열이름이 출력된다.
a_sa_d2<-table(a, sample(a), deparse.level = 2) 
colnames(a_sa_d2)

#결측치(NA)가 집계된 교차표 http://cafe.naver.com/dataan/147
a <- rep(c(NA, 1/0:3), 10)
length(a)
table(a)
table(a, exclude = NULL)

#교차표에  합과 비율  표시하기
mt <- data.frame (x=c("1", "2", "2", "1"),y=c("A", "B", "A", "B"),num=c(5, 6, 8, 8))
mt
mt_tb<- xtabs(num~x + y, data =mt)
mt_tb
mt_tb1<-cbind(mt_tb, margin.table(mt_tb , 1))
mt_tb1
mt_tb2<-rbind(mt_tb1,margin.table(mt_tb1 , 2))
mt_tb2

#예제2 각 셀의 비율 
xt <- data.frame (x=c("A", "A", "A", "B", "B"), result =c(3, 2, 4, 7, 6))
prop.table(xt , 1)
prop.table (xt , 2)
prop.table(xt)

# (3) 예제3 prop.table() 함수
m <- matrix(1:4, 2)
m

# 행기준 계산
prop.table(m, 1)
# 열 기준 계산
prop.table(m, 2)
prop.table(m, c(1,2))

#자동차 연비에 영향을 미치는 변수 탐색 교차표 따라하기
str(cars_feature)
#R 코드
cars_feature$cyl_f<-factor(cars_feature$cyl)
cars_feature$vs_f<-factor(cars_feature$vs)
cars_feature$am_f<-factor(cars_feature$am)
cars_feature$gear_f<-factor(cars_feature$gear)
cars_feature$carb_f<-factor(cars_feature$carb)
sapply(cars_feature, table)
xtabs(mpg ~cyl+gear+am,data=cars_feature)
pairs(cars_feature[,c(1,2,8,9,10,11)],pch=as.integer(factor(cars_feature$vs)))
library(lattice)
xyplot(cars_feature$mpg ~ cars_feature$cyl | paste(factor(cars_feature$gear),"gear") * paste(factor(cars_feature$am), "am"), data=cars_feature, main="연비와 실린더 개수, 오토 여부와 기어개수")