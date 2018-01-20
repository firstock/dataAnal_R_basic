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
mXtexnume <- matrix(as.integer(tex1))
mXtexnume

data.class(mXtexnume)
