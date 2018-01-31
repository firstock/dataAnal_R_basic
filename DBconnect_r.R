##### setting  #######
# 
# 설치/리스너/생성/접속
# 
# 다운로드
# http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html
# 
# 설치
# admin123
# admin123
# 
# 확인
# CMD>
#   cd c:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN
# notepad tnsnames.ora
# SERVICE_NAME= XE 확인
# 
# 리스너
# CMD>
#   lsnrctl start
# 
# 리스너 작동 확인
# CMD>
#   services.msc
# 
# 관리자로 접속
# CMD>
#   sqlplus "/as sysdba"
# 
# SQL>
#   alter database open;
# 
# 계정생성
# SQL>
#   create user scott
# identified by tiger;
# 
# 권한부여
# SQL>
#   grant dba to scott;
# 
# 방금만든 계정으로 접속
# SQL>
#   exit
# C:\…>
#   sqlplus scott/tiger@XE
# 
# ######## ######## #######

## odbcad32.exe
install.packages(c("DBI","RODBC"))
library(DBI)
library(RODBC) #odbcConnect, sqlsave 등

## DB 접속
# 사용자 DNS에 설정한 ID로
# db.connect <- odbcConnect(dsn="R_Oracle", uid="scott", pwd="tiger")
db.connect <- odbcConnect(dsn="R_Oracle", uid="scott", pwd="tiger", believeNRows=F)


#데이터 가져오기. select
sql.x <- "select * from TEST_TABLE"
(import.tb.list <- sqlQuery(db.connect, sql.x, stringsAsFactors=F))

is.data.frame(import.tb.list)

## 접속정보 해제
# 다른 쿼리 실행하기전에 한번씩 꼭 해줘야, warning 뜨지 않음
odbcClose(db.connect)


##다시 접속& 딴 테이블서 데이터 가져오기
db.connect <- odbcConnect(dsn="R_Oracle", uid="scott", pwd="tiger", believeNRows=F)

sql.x2 <- "select * from TESTT"
(import.tb.list2s <- sqlQuery(db.connect, sql.x2, stringsAsFactors=F))




### 데이터 넣기- insert
## 넣::sqlSave
hdb <- odbcConnect(dsn= "R_Oracle", uid= "scott", pwd="tiger", believeNRows=F)
sqlSave(hdb, import.tb.list, "COMP_MST", append= T, rownames= F)
test.df <- sqlQuery(hdb, "select * from COMP_MST")
# args(sqlSave) #channel, data, tablename, append, rownames
odbcClose(hdb) #끄고

#켜기& insert
hdb <- odbcConnect(dsn= "R_Oracle", uid= "scott", pwd="tiger", believeNRows=F)
query.x <-
  "insert into COMP_MST(COMPANY, COMP_GROUP, NAMES, AGE, PHONE_NUM)
    values('Begas', 'Group1', 'jangeunhi', 28, '01099990000')"
sqlQuery(hdb, query.x) #channel, query, ...

odbcClose(hdb) #끄고

## 넣::sqlQuery
hdb <- odbcConnect(dsn="R_Oracle", uid= "scott", pwd= "tiger", believeNRows= F)
query.x <-
  "insert into COMP_MST(COMPANY, COMP_GROUP, NAMES, AGE, PHONE_NUM)
      values('Begas', 'Group1', 'jangeunhi', 28, '01099990000')"
sqlQuery(hdb, query.x)

odbcClose(hdb)


hdb <- odbcConnect(dsn= "R_Oracle", uid= "scott", pwd = "tiger", believeNRows= F)
test.df <- sqlQuery(hdb, "select * from COMP_MST")
odbcClose(hdb)


