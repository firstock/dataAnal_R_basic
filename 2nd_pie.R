###### pie
par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)
pie(p1,radius=1)

pie(p1,radius=1,init.angle=90)



p1 <- c(10,20,30,40,50,60)
pie(p1,radius=1,edges=20)

pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),
    label=c("Week 1" ,"Week 2" , "Week 3" ,"Week 4"))



pct <- round(p1/sum(p1) * 100,1)
lab <- paste(pct," %")
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),
    label=lab)
legend("topright",c("Week 1","Week 2","Week 3","Week 4"),
       cex=0.5,fill=rainbow(length(p1)))



pct <- round(p1/sum(p1) * 100,1)
lab1 <- c("Week1","Week2","Week3","Week4")
lab2 <- paste(lab1,"\t",pct,"%")
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),label=lab2)




