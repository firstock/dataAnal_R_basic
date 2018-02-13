## 자료설명
install.packages("flexclust") #nutrient
library(flexclust)

data(nutrient)
head(nutrient)


## 분석목적

## 거리행렬 출력. dist가 뭐하는 함수??
d <- dist(nutrient)
as.matrix(d)[1:4,1:4]
# length(as.matrix(d)) # 729


## 변수의 표준화 실시
nutrient.scaled <- scale(nutrient)
d2 <- dist(nutrient.scaled)
as.matrix(d2)[1:4,1:4]


## 계층적(위계적) 군집화 실시
# average 말고도 여럿 해봐라. 아래 쭉 실행: ctrl+ alt+ E  
method1 <- c("ward.D","ward.D2","single","complete","average","mcquitty","median" ,"centroid")
fit.method <- hclust(d2, method1[5]) # "average" #??hclust


par(mfrow= c(1,1))
# hang= -1: x축 이름이 나란히 출력
# cex: x축 이름을 작게
plot(fit.method, hang= -1, cex= .8   
     , main="Average Linkage Clustering")



## 군집수 정하기
# 표준화된 데이터로 돌려야 잘 나옴
# install.packages("NbClust")
library(NbClust)

nc <- NbClust(nutrient.scaled, distance= "euclidean"
              , min.nc= 2, max.nc= 15, method= "average")

# 그래프 꺾인부분을 보니>> k=5 가 적당


## 적합한 군집 수를 활용한 군집 재분류
# 각 군집별 군집 데이터의 개수
clusters <-  cutree(fit.method, k=5)
table(clusters)


## 군집 시각화하기
par(mfrow= c(1,1))
plot(fit.method, hang= -1, cex= .8
     ,main= "Average Linkage Clustering\n5 Cluster")

# 빨간 네모 5개
rect.hclust(fit.method, k=5)

