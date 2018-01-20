#p199
vG <- c("vB","B","nor","G","vG")
vG

is.vector(vG)
typeof(vG)

fvG <- factor(vG)
fvG

fvG[7] <- "GG"
fvG

levels(fvG)
levels(fvG)[0]

#p205
gender_3 <- factor(c("f","m","f"),c("f","m"))
gender_3

length(gender_3)
nlevels(gender_3)

levels(gender_3) <- c("female","male")
gender_3

#
gender_T <- factor("f",c("m","f"))
gender_T
# 순서지정
x <- c("m","f")
as.factor(x)

factor(c("m","f"), levels=c("m","f"))

#가변수 화. dummy var. p218
x <- data.frame(lvl =  factor(c("A","B","A","A","C")),value= c(1,3,2,4,5))
x

#가변수 화- one hot encoding
model.matrix(~lvl, data=x)

#다른 가변수만들기
x2 <- data.frame(lvl= factor(c("핳1","캄1","참1","참2","잠1","잠1","남2","감1","감2","감3")), value=c(100,2,5,10,-20,7,4,33,9999,44444))
x2

model.matrix(~lvl, data=x2)
