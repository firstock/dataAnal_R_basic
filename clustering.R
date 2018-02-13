setwd("E:/github/dataAnal_R_basic")

# install.packages("cluster")
library(cluster)

data(iris)

## iris 대상 유클리드 거리생성
# NAs introduced by coercion : 문자->숫자 경고
method <-  c("euclidean", "maximum", "manhattan", "canberra", "binary" , "minkowski")
# method[1]

dist <- dist(iris, method[6])

## 클러스터링 적용
hc <- hclust(dist)

# par(mfrow= c(3,2)) #1번만 실행
plot(hc)
