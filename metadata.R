#p90
vX <- c(1:10)
#설명문구 달기 
vX <- structure(vX, "createdDate"="2018.01.16",
                "company"="BigDataAnal",
                "description"="1~10수열")
vX
args(attr)
#조회
attributes(vX)
#하나씩 조회
attributes(vX)$'createdDate'
attributes(vX)$'company'


#p93
sum(vv2 <- 1)
vv2
3->vv2

sum(vv3=2)
vv3

vv1 <- 1
ls(all.names=TRUE)
ls()

#p96
example(rep)
rep(1:2, 3)
rep(1:2, times=3)

rep(1:2,each=2, times=4)
r1 <- rep(1:2, each=2)
rep(r1, 4)
