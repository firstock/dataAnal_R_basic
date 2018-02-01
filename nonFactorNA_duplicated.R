## 성별이 1or2가 아닌 경우는 NA로
#step3, p48
dD <- data.frame(id=c("a","b","d","e","f","g"),gender= c(1,2,2,1,9,NA)); dD
dD$gender[!(dD$gender==1 | dD$gender==2)] <- NA; dD

## 중복 데이터 체크
# p57
set.seed(123)
ss <-  round(rnorm(n=20,mean=10,sd=5)); ss

duplicated(ss)
ss[duplicated(ss)]

#하나만 남기고 제거
unique(ss)
ss[!duplicated(ss)]
