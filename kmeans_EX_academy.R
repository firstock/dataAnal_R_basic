getwd()
setwd("E:/github/dataAnal_R_basic")
aca <- read.csv("data2nd/academy.csv") 

library(fpc)      #plotcluster

kms <- kmeans(aca, 4); kms # clustering에서 academy에는 4가 적당하다고 결론냈었다

plotcluster(aca, kms$cluster)            
plot(aca, col= kms$cluster) # ??plot

wss <- 0
max <- 0
for(i in 1:10){
  wss[i] <- sum(kmeans(aca, centers= i)$withinss)
}

plot(1:10, wss
     ,type= "b", xlab= "number of clusters"
     ,ylab= "within group sum of squares")
