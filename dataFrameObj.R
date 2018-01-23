#p278. dataFrameObj
(vX1 <- c(TRUE,FALSE,TRUE))
(vX2 <- c(rnorm(3))) #정규분포 랜덤
dDataFrame <- data.frame(logic=vX1, value=vX2); dDataFrame

data.class(dDataFrame)
mode(dDataFrame)
typeof(dDataFrame)


#3,2,2 생성불가
lidftest <- data.frame(position=c("top","down","top"), value=c(2,4), tf=c(T,F))
#3,1,1 생성가능. 가능은 한데, 얘 규칙에따라~
lidftest <- data.frame(position=c("top","down","top"), value=c(2), tf=c(T)); lidftest

df1 <- data.frame(Col1=c("A","B","C"), Col2=c(10,20,30), Col3=c(3,2,1)); df1
