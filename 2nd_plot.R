# library(googleVis)
# Fruits
v1 <- seq(1,5,1)
plot(v1)

v2 <- rep(2,3)
plot(v2)

x <- 1:3
y <- 3:1
plot(x,y)
plot(y) # 하나 생략하면 y로 들어감

x <- 1:3
y <- 3:1
plot(x,y, xlim= c(1,10))
plot(x,y, xlim= c(1,10), ylim= c(1,5))

x <- 1:3
y <- 3:1
plot(x,y, xlim=c(1,10), ylim= c(1,5)
     ,xlab="X축 값", ylab="y축 값", main= "plot test")

v1 <- c(100,130,120,160,150)
#par(mfrow= c(nr,nc))
par(mfrow= c(1,3))
plot(v1, type="o", lty=1)
plot(v1, type="s", lty=2, col=5)
plot(v1, type="l", lty=3, col="skyblue")
??plot

par(mfrow= c(1,3))
pie(v1)
plot(v1, type="o", lty="twodash")
barplot(v1)

v1 <- 1:5
v2 <- 5:1
v3 <- 3:7

#범주 겹침 -_-
par(mfrow= c(1,1))
plot(v1, type="s", col="red", ylim=c(1,5))
par(new= T)
plot(v2, type="o", col=5, ylim=c(1,5))
par(new= T)
plot(v3, type="l", col="green")

#데이터만 겹치게
par(mfrow= c(1,1))
plot(v1, type="s", col="burlywood4", ylim= c(1,10))
lines(v2, type= "o", col="khaki3", ylim= c(1,5))
lines(v3, type="l", col="skyblue", ylim=c(1,15))
#범주 위치/세부값
legend(4,9,  c("v1","v2","v3"), cex= 0.5, col= c("burlywood4","khaki3","skyblue"),lty=1)

