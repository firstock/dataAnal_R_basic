#extract. step3_p104
setwd("E:/github/dataAnal_R_basic")
head(mtcars)

which(mtcars$wt> 5)
which(mtcars$wt> 5, arr.ind= T)
# typeof(which(mtcars$wt> 5))
# typeof(c(1:4))
mtcars[15,]
mtcars[16,]
mtcars[17,]
mtcars[which(mtcars$wt> 5),]

subset(mtcars, wt>5)

mtcars[!(mtcars$wt>5),]
mtcars[mtcars$wt<=5,]
subset(mtcars, wt<=5)

mtcars[(mtcars$wt>5 & mtcars$mpg<12),]
mtcars[(mtcars$wt>5 | mtcars$mpg<12),]
subset(mtcars, 5<wt & wt<5.4 )
#마력이 200이상인 차량만 추출
mtcars[which(mtcars$hp>=200), ]
subset(mtcars, hp>=200)

mtcars[which(mtcars$wt>5 & mtcars$mpg<12),]
subset(mtcars, wt>5 & mpg<12)

names(mtcars)
mtcars[which(mtcars$hp>=200 & mtcars$gear==5),]
subset(mtcars,wt>5 & mpg<=12)

head(iris)
data(iris)
attach(iris)

head(
  subset(iris, select= c(Sepal.Length, Species))
)

head(
  subset(iris, select= -c(Sepal.Length, Species))
)


