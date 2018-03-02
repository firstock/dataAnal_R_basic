###### boxplot {graphics}

v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
boxplot(v1,v2,v3,col=c("blue","yellow","pink"),
        names=c("Blue","Yellow","Pink"),
        horizontal=T)

a1 <- read.csv("data2nd/seoul_hospital.csv",stringsAsFactors = F)
a1
b1<-a1[,2]; b1 #값. integer
b2<-a1[2]; b2 #리스트 list
typeof(b1)
typeof(b2)

x <- round(rnorm(30),2)
y <- round(rnorm(30),2)
var1 <- abs(round(rnorm(30),2))
var2 <- abs(round(rnorm(30),2))
var3 <- round(runif(30),2)
var4 <- round(runif(30),2)
var5 <- round(runif(30),2)
x #30개

par(mfrow=c(2,3))
par(mfrow=c(2,3), mar= c(20,1,5,1))
par(mar = rep(.5,4))
example(par)

symbols(x,y,circles=abs(x), inches=0.2,bg=1:30)
title(main="symbols 함수 - 원")

symbols(x,y,squares=abs(x), inches=0.2,bg=1:30)
title(main="symbols 함수 - 정사각형")

symbols(x,y,rectangles=cbind(abs(x),abs(y)),inches=0.2,bg=1:30)
title(main="symbols 함수 - 직사각형")

symbols(x,y,stars=cbind(abs(x),abs(y),var1,var2,var3),inches=0.2,bg=1:30)
title(main="symbols 함수 - 스타형")

symbols(x,y,thermometers=cbind(abs(x),abs(y),var4),inches=0.2,bg=1:30)
title(main="symbols 함수 - thermometer형")

symbols(x,y,boxplots=cbind(abs(x),abs(y),var3,var4,var5),inches=0.2,bg=1:30)
title(main="symbols 함수 - boxplot형")


par(mfrow=c(1,1))
symbols(x,y,boxplots=cbind(abs(x),abs(y),var3,var4,var5),inches=0.5,bg=1:30)
title(main="symbols 함수 - boxplot형")


##### geom_boxplot {ggplot2}
# apropos("^geom*_")
korean <- read.csv("data2nd/korean.csv")
head(korean)

# axis.text.x 테스트
p <- ggplot(korean,aes(x=x,y=var1)) + geom_point( )+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
p

# box plot
p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot(outlier.colour = "red", outlier.shape = 1)

p + geom_boxplot(aes(colour = drv))

