### 비계층적 군집분석
## 군집개수 지정된 k-means clustering


# install.packages("flexclust")
# install.packages("graphics")

# install.packages("cluster")
# install.packages("fpc")

library(flexclust) #nutrient
# library(graphics)

library(cluster)  #clusplot
library(fpc)      #plotcluster

data(nutrient)

# # scale 적용 안해도 똑같은 그래프가 나올것. 눈금 차이만 약간
# nutrient.scaled <- scale(nutrient)
# kms <- kmeans(nutrient.scaled, 5); kms

kms <- kmeans(nutrient, 5); kms # clustering에서 nutrient에는 5가 적당하다고 결론냈었다


## 군집분석의 시각화
# 각 변수 쌍끼리 2차원 그래프 상에서 군집분석의 시각화 표현
plot(nutrient, col= kms$cluster)

plotcluster(nutrient, kms$cluster)
clusplot(nutrient, kms$cluster, color=T, shade=T, labels=2, lines=0)
#???? #with(nutrient, pairs(nutrient.scaled, col= c(1:3)[kms$cluster])) 


## Elbow point 구하기- 군집개수의 검증
wss <- 0
i <- 0
for(i in 1:10){
  wss[i] <- sum(kmeans(nutrient, centers= i)$withinss)
  # 근데이거왜 지역변수가 제대로 안 먹히냐
}

plot(1:10, wss
     ,type= "b", xlab= "number of clusters"
     ,ylab= "within group sum of squares")
