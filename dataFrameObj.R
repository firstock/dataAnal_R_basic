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
str(df1)
df1[,4] <- as.character(df1[,1])
str(df1)

m2 <- cbind(1,1:4); m2
colnames(m2, do.NULL=FALSE)
colnames(m2) <- c("X","Y")
m2
rownames(m2) <- rownames(m2, do.NULL= FALSE, prefix="Obs.")
args(rownames)
m2

dDataFrame
#행,열
dDataFrame[1,"logic"]
dDataFrame[1,1]
#열
dDataFrame[,"logic"]
dDataFrame$logic

data(mtcars)
dCar <- mtcars
str(dCar)
head(dCar,2)
(vcar6 <- dCar[,6]);
is.vector(vcar6)

dCar[,"cyl"]
dCar["Mazda RX4 Wag",]
df1

dfcol3 <- df1[,"Col3"]
mode(dfcol3)
is.vector(dfcol3)
df1[,3]
df1[1,]
df1[3,2]
(df1_dropF <- df1[,"Col3",drop=F]) #drop=F: dataframe구조 유지
mode(df1_dropF)
data.class(df1_dropF)
class(df1_dropF)

dWeight <- dCar[,6,drop=FALSE]; dWeight
data.class(dWeight)
