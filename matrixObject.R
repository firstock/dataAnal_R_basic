#p236
mX <- matrix(1:6, ncol=2)
mX

mX <- matrix(1:6, nrow=3)
mX

mX <- matrix(1:8,4,2, byrow=T)
mX
data.class(mX)
mode(mX)
typeof(mX)

dim(mX)
mX2 <- 1:12
dim(mX2) <- c(3:4)
mX2

data.class(mX2)
typeof(mX2)
mode(mX2)

# ch => numeric
tex1 <- c("1", "2", "3", "4", "5,", "6", "7", "8", "9")
is.vector(tex1)
mXtex <- matrix(tex1)
mXtex
# error => use 'as.integer'
# mXtexnume <- matrix(tex1, colClass="numeric")
# mXtexnume <- matrix(tex1, colClass=c("numeric"))
mXtex2 <- matrix(as.integer(tex1), nrow=3)
mXtex2

data.class(mXtex2)

#p240- 2018.1.21 집에서 타자
mD1 <- matrix(1:9,3,3, byrow=TRUE)
mD1

dX <- data.frame(col1= numeric(nrow(mD1)*nrow(mD1))
              , col2= numeric(nrow(mD1)*nrow(mD1))
              , val= numeric(nrow(mD1)*nrow(mD1)))
vX1 <- rep(1:nrow(mD1), nrow(mD1))

vX2 <- NULL
nrow(mD1)
rep(1, nrow(mD1))
rep(2, nrow(mD1))
rep(3, nrow(mD1))
for(i in 1:nrow(mD1)) vX2 <- c(vX2, rep(i, nrow(mD1)))
vX2

vV <- as.vector(mD1)
vV
dD1 <- data.frame(vX1, vX2, vV)
dD1

dD1[order(dD1$vX1, dD1$vX2),]

#p242
mM1 <- rbind(c(101,102), c(201,202,203,204), c(301,302,303,304))
mM1

mM1[1,3]

mM3 <- rbind(c(101,102,103), c(201,202,203), c(301,302,303))
mM3

#p244 추출
mM3 <- rbind(c(101,102,103), c(201,201,203), c(301,302,303))
mM3

mM3[,3]>300
mM3

mM3[mM3[,3]>300]
mM3[mM3[,3]>300,] # 3열에서 300보다 큰값이 있는 행 추출
mM3[mM3[,3]>300, drop=F]
mM3[mM3[,3]>300, ,drop=F]

mM3[mM3[,3]>300, 3]

mM4 <- rbind(c(101,102,103), c(201,202,203), c(301,302,303), c(306,307,308))
mM4
mM4[mM4[,2]>200,]



#생각없이 치기만 함
mM3[2]
mM3[4]
mM3[2:5]
mM3[2,]
mM3[,3]

mM3[mM3[,3]>1,1]
mM3[mM3[,3]>300,]
mM3[,3]
mM3[mM3[,3]>1,]

#p247
mX <- rbind(c(101,102,103), c(201,202,203), c(301,302,303))
mX

mIndex <- rbind(c(1,2), c(2,3), c(3,1))
mIndex
mX[mIndex]

m_diag <- matrix(1:100, ncol=10)
m_diag
diag(m_diag)

#p249
mX
mX[2]
mX[3] <- 111
mX[2:5]
mX

mX>200
mX[mX>200]
#mX[mX>200,drop=F] #소용 X
mY <- mX
mY[mY>200] <- 0
mY

mX[mX>200,,drop=F] #error. 행위치에 열위치값까지 포함되므로<- ??
mX[mX>200, drop=F]

#p251 전치행렬
mX <- matrix(10,2,3)
mX
mY <- matrix(1:6,3,2)
mY
t(mY)

mX <- matrix(0,3,3)
diag(mX) <- c(1,2,3)
mX

a <- matrix(1:9, ncol=3);a

sum(diag(a))
diag(x=rep(1:2,2), nrow=4, ncol=4)
?rep

#p253
mX3 <- matrix(seq(1,48,3), nrow=4)
mX3
diag(mX3)
diag(mX3) <- 0
mX3

