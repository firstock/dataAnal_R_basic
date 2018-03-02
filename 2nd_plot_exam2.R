getwd()
hospi <- read.csv("data2nd/seoul_hospital.csv", stringsAsFactors = F)
# options(encoding="UTF-8")
# options(encoding="CP949") #R stuio encoding과 같아야

hospi
str(hospi)
colnames(hospi)
n_col <- length(hospi)
n_row <- length(rownames(hospi))

hs_depart <- hospi$표시과목

# plot(hospi) #error!

hs_kn <- hospi[,2]
hs_kd <- hospi[,3]
hs_ks <- hospi[,4]
hs_ka <- hospi[,5]
hs_kr <- hospi[,6]
hs_db <- hospi[,7]
hs_dd <- hospi[,8]
hs_dj <- hospi[,9]
hs_mp <- hospi[,10]
hs_sd <- hospi[,11]


## line 그렸더니, 겹치는 부분이 서로 분간이 안 된
plot(hs_kn, xlim=c(0,10), ylim=c(0,350), xlab="", ylab=""
     , col="lightpink4", type="o", axes= F)
title(main="지역별 병원부서", col.main="lightcoral")
#1x 2y
#las 2 눞
axis(1, at= 1:n_row, label= hs_depart, las= 2)#cex= 안먹힘
#plot(.. ylim=) 해서 여기선 따로 안써도 됨
axis(2, las=1)

lines(hs_kd, col="lightpink2", type="o", lwd= 1)
lines(hs_ks, col="lightpink1", type="o", lwd= 1)
lines(hs_ka, col="hotpink4", type="o", lwd= 1)
lines(hs_kr, col="hotpink3", type="o", lwd= 1)
lines(hs_db, col="hotpink2", type="o", lwd= 1)
lines(hs_dd, col="hotpink1", type="o", lwd= 1)
lines(hs_dj, col="indianred3", type="o", lwd= 1)
lines(hs_mp, col="indianred2", type="o", lwd= 1)
lines(hs_sd, col="indianred1", type="o", lwd= 1)

n_col
colsExcDep <- colnames(hospi)[2:n_col]
colsColor <- c("lightpink4","lightpink3", "lightpink2", "lightpink1", "hotpink4", "hotpink3", "hotpink2", "hotpink1", "indianred3", "indianred2", "indianred1")
legend(5,330, colsExcDep, cex=0.7, col= colsColor
       ,lty=1, lwd=3, bg= "white")


## barplot
barplot(as.matrix(hospi)) #그냥 과별로 겹쳐서 쭉쭉

str(hospi)
n_col <- length(hospi); n_col
n_row <- length(rownames(hospi))
n_row

hs_depart <- hospi$표시과목; hs_depart
mat_hospi <- as.matrix(hospi[,2:n_col])
mat_hospi

barplot(mat_hospi, las=2)


barplot(mat_hospi, las=2, beside= T, col= rainbow(n_row))

abline(h=seq(0,350,10), lty=3, lwd= 0.2)
# n_row
# hospi[,1]
legend("topright", hospi[,1], cex=0.7 ,fill= rainbow(n_row))

## 그래프 물결표시. r broken y axis chart
# install.packages("plotrix")
library(plotrix)
axis.break(1,2,style="slash") 