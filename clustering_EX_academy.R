### howToUse: methodNum <- 3, k_ea <- 8 숫자만 바꿔서
# line 34, 76. gotoLine: ctrl+ G
### 아래 쭉 실행: ctrl+ alt+ E
# 1 ward.D
# 2 ward.D2
# 3 single
# 4 complete
# 5 average
# 6 mcquitty
# 7 median"
# 8 centroid
######


getwd()
# install.packages("NbClust") # 군집수 정할
library("NbClust") # ??NbClust


aca <- read.csv("data2nd/academy.csv") 
head(aca)
summary(aca)



### 계층적 군집분석
# 변수 표준화
aca.scaled <- scale(aca)
d <- dist(aca.scaled)
head(aca.scaled)
summary(aca.scaled)


methodNum <- 5
# 1 ward.D
# 2 ward.D2
# 3 single
# 4 complete
# 5 average
# 6 mcquitty
# 7 median
# 8 centroid
######


clurMethod <- c("ward.D","ward.D2","single","complete","average","mcquitty","median" ,"centroid")
fit.method <- hclust(d, clurMethod[methodNum])

par(mfrow= c(1,1))
main_label1 <- paste0("Clustering ",clurMethod[methodNum])
plot(fit.method, hang= -1, cex= .8, main= main_label1)
# row name이 숫자라 height가 1,2,3,4 되는 게 정상



## 군집수 정하기



ncMethod <- c("ward.D", "ward.D2", "single", "complete", "average", "mcquitty", "median", "centroid", "kmeans","centroid")
nc <- NbClust(aca.scaled, distance= "euclidean"
              , min.nc= 2, max.nc= 15, method= ncMethod[methodNum]) #5: average

####### plot_군집수(k_ea) 추천
# (1)ward.D: 2,3> 9,14> 15> 4,5
# (2)ward.D2: 3> 2> 6,14,15> 4,11,12
# (3)single: 8> 2> 4> 3,6> 11, 15
# (4)complete: 2> 4>> 14> 3,9,11,12,15
# (5)average: 2> 3> 4> 13> 5, 15 
# (6)mcquitty: 3> 2> 14> 5,13> 4,15
# (7)median: 5,13,14,15> 2> 3> 9, 12
# (8)centroid: 2,12>> 3,10> 7,8

## 2, 6, 8, 4, 4, 2, 5, 12

k_ea <- 4
###### 아래 쭉 실행: ctrl+ alt+ E 


## 군집 시각
clusters <- cutree(fit.method, k= k_ea) # cut tree 
table(clusters)

par(mfrow= c(1,1))

main_label2 <- paste0(ncMethod[methodNum]," Linkage Clustering")
plot(fit.method, hang= -1, cex= .8, main= main_label2)

rect.hclust(fit.method, k= k_ea)