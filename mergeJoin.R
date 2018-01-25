#################################################################3
#Chapter. (Merge, Join)
#cafe.naver.com/dataan
#########################################################
# (1) deparse.level 옵션의 사용
# deparse.level=0 이면 컬럼명을 사용하지 않는다.
vX <- c(1,2,3)
vY <- c(5,6,7)
(xy<-cbind(vX,vY,deparse.level=0))

# deparse.level=1 로서 컬럼명을 사용
(xy<-cbind(vX,vY,deparse.level=1))

#(2) cbind(data.frame, 추가할 데이터셋)열을 병합할 때  주의사항은  새로 추가할 열의 길이가 행의 길이 만큼 생성해야된다는 것이다.
dcar<-mtcars
dim(dcar)
vNo <- 1:32
vNo
#“기존데이터셋명$새로운속성명<-입력될 데이터“형식으로 dcar 데이터셋에 추가
dcar$temp_No = vNo 
# cbind()로 temp_no_cb_no 속성명으로 컬럼 합하기
dCarNO <- cbind(dcar, temp_No_no=vNo)
dCarNO

#(3) cbind(matrix,,,,)예제
#cbind (column bind) 또는 rbind (row bind)를 이용하면 다수의 vector를 가로 또는 세로로 병합하여 matrix를 생성 할 수 있다. 
(mx<-matrix(1:6,nrow=2))
mx
# cbind() 열을 추가하므로,   c(7,8)을 생성후 열로 붙이기
my<-cbind(mx,c(7,8))
my
#(4) cbind(vector, vector,...),  한컬럼문자이고 다른한 컬럼은 숫자인경우
Day=c(1:14)
outlook=c("sunny","sunny","overcast","rainy","rainy","rainy","overcast","sunny","sunny","rainy","sunny","overcast","overcast","rainy")
Temperature=c(85,80,83,70,68,65,64,72,69,75,75,72,81,71)
# “deparse.level = 1“ 컬럼명을 사용, cbind(vector,...) 은  문자컬럼와 숫자컬럼이 둘다 존재하면 문자를 선택해서  데이터를 손실없이 보존
dTable=cbind(Day, outlook, Temperature, deparse.level = 1)#oredrdFa

#행단위로 병합
#(1) 레코드 추가하기: 컬럼의 개수가 일치해야만 된다.
dCar <- mtcars
head(dCar,2)
dNewRecord <- data.frame(mpg=11.1, cyl=1, disp=111, hp=111
                         , drat=1.11, wt=1.111, qsec=11.11,  vs=1
                         ,  am=1, gear=1, carb=1)
dNewRecord
dCar <- rbind(dCar, dNewRecord)
dCar

#(2) 새로 추가된 마지막행의 이름을 지정하는 코드,       rownames(dCar)[length(rownames(dCar))] 
# rowname 이 “1”인 행이름 -->"NewCar" 변경하는 코드
rownames(dCar)
rownames(dCar)[length(rownames(dCar))]
rownames(dCar)[length(rownames(dCar))] <- "NewCar"
tail(dCar)

##Outer 조인 : 두 테이블
#(1) Outer join은 key속성 “CustomerId“기준으로 join, 그러나 불일치 되는 “State”컬럼은 <NA>로 빈공간 채운다.
#형식은 >merge(x = df1, y = df2, by = "CustomerId", all = TRUE)이다.
df_1 = data.frame(CustomerId = c(1:6), Product = c(rep("Computer", 3), rep("Radio", 3)))
df_2 = data.frame(CustomerId = c(2, 4, 6), State = c(rep("Alabama", 2), rep("Ohio", 1)))
df_1
df_2
merge(x = df_1, y = df_2, by = "CustomerId", all = TRUE)

#full Outer 조인 : 두 데이터셋에 있는 값 모두 나타나게 두 데이터셋 합하기
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df1
df2 = data.frame(CustomerId = c(2L, 4L, 7L), State = c(rep("Alabama", 2), rep("Ohio", 1))) 
df2

library(data.table)
dt1 = as.data.table(df1)
dt1
dt2 = as.data.table(df2)
dt2

#키를 설정하지 않을 때에는 dt1[dt2, on=“키컬럼”]을 해주어야 된다.
setkey(dt1, NULL)
setkey(dt2, NULL)
# dt1
merge(dt1, dt2, by = "CustomerId", all = TRUE)

#(2) 키 값에 반복이 있는 경우, 모든 행을 Merge하는 방법, all=TRUE

(dEmp <- data.frame(DepartmentId=c(301,303,303,304,304,307)
                    ,EmpName=c("Kim","Park","Lee","An","Choi","Jeong")))
(dDepart <- data.frame(DepartmentId=c(301,303,304,305)))
                       #301은 1번반복, 303와 304는 각각 두 번 반복, 305와 307는 각 한번반복되어 모두 나타났다.
(dMerge2 <- merge(dEmp,dDepart,all=TRUE))
                       
                       
# Left outer join
df_1 = data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df_2 = data.frame(CustomerId = c(2,4,6), State= c(rep("Alabama",2), rep("Ohio",1)))

# install.packages("sqldf")
library(sqldf)
df4 <- sqldf("SELECT CustomerId, Product, State
             FROM df_1
             LEFT JOIN df_2 USING(CustomerId)")
df4

install.packages("dplyr")
library(dplyr)

df_1= data.frame(CustomerId= c(1:6)
                 , Product= c(rep("Toaster",3), rep("Radio",3)))
df_2= data.frame(CustomerId= c(2,4,6)
                 , State= c(rep("Alabama",2), rep("Ohio",1)))

df_1$CustomerId <- as.numeric(df_1$CustomerId)
df_2$CustomerId <- as.numeric(df_2$CustomerId)

left_join(df_1, df_2)
