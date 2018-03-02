# 그래프 물결모양
# broken y axis chart 

install.packages("plotrix")
library(plotrix)

plot(3:10, main = "Axis break test")
# put a break at the default axis and position
# axis.break()
# axis.break(2, 8, style = "zigzag")
twogrp <- c(rnorm(10) + 4, rnorm(10) + 20)
gap.plot(twogrp,gap = c(8,16), xlab = "Index", ylab = "Group values",
         main = "Two separated groups with gap axis break",
         col = c(rep(2, 10), rep(3, 10)), ytics = c(3, 5, 18, 20))
legend(12, 6, c("Low group", "High group"), pch = 1, col = 2:3)




twogrp<-c(rnorm(5)+4,rnorm(5)+20,rnorm(5)+5,rnorm(5)+22)
gpcol<-c(2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5)
gap.plot(twogrp,gap=c(8,16),xlab="Index",ylab="Group values",
         main="Gap on Y axis",col=gpcol)
gap.plot(twogrp,rnorm(20),gap=c(8,16),gap.axis="x",xlab="X values",
         xtics=c(4,7,17,20),ylab="Y values",main="Gap on X axis with added lines")
gap.plot(c(seq(3.5,7.5,by=0.5),seq(16.5,22.5,by=0.5)),
         rnorm(22),gap=c(8,16),gap.axis="x",type="l",add=TRUE,col=2,)
gap.plot(twogrp,gap=c(8,16,25,35),
         xlab="X values",ylab="Y values",xlim=c(1,30),ylim=c(0,42),
         main="Test two gap plot with the lot",xtics=seq(0,30,by=5),
         ytics=c(4,6,18,20,22,38,40,42),
         lty=c(rep(1,10),rep(2,10)),
         pch=c(rep(2,10),rep(3,10)),
         col=c(rep(2,10),rep(3,10)),
         type="b")
gap.plot(21:30,rnorm(10)+40,gap=c(8,16,25,35),add=TRUE,
         lty=rep(3,10),col=rep(4,10),type="l")

??gap.plot



??subplot

library(Hmisc) #subplot
data=data.frame(CAx=120,CAp=32,CTAx=12,CTAp=4,MTAX=6,MTSAx=3)

lower=c(0,55)
upper=c(95,140)
y_outer=21

lowspan=c(0,11)
topspan=c(lowspan[2]+1,21)

ylabel="y-axis value"
xlabel="x-axis value"
legendtext=c('C-Ax','C-Ap','CT-Ax','CT-Ap','MT-AX','MTS-Ax')

plot(c(0,1),c(0,y_outer),type='n',axes=FALSE,ylab=ylabel,xlab='',lwd=7)
subplot({
  y <- as.matrix(data)
  bp <- barplot(y,col=heat.colors(2),ylim=lower,xpd=FALSE,las=3)
  arrows(bp, y * .95, bp, y * 1.05, xpd = NA, angle = 90, code = 3,
         length = .1, col = ifelse(y > max(lower), 0, 1))
},x=c(0,1),y=lowspan)

subplot({
  bp <- barplot(y, col=heat.colors(2), ylim=upper, xpd=FALSE,
                names.arg=vector(mode="character",length=length(data)))
  arrows(bp, y * .95, bp, y * 1.05, xpd = NA, angle = 90, code = 3,
         length = .1, col = ifelse(y > max(lower), 1, 0))
}, x=c(0,1), y=topspan)
