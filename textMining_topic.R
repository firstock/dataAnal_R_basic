getwd()
setwd("E:/github/dataAnal_R_basic")
### 자료설명
### 분석목적
### 텍스트 마이닝을 통한 워드 클라우드 생성
##https://eungdapso.seoul.go.kr/


##텍스트마이닝 준비
#java 로딩했으면 OK> "rJava"
install.packages(c("rJava", "KoNLP", "wordcloud"))
install.packages("tm")
install.packages("SnowballC","RColorBrewer")
install.packages("stringr")
library(rJava)
library(KoNLP)
library(wordcloud)
library(tm)
library(SnowballC)
library(RColorBrewer) #brewer.pal
library(stringr) #str_replace_all


## 세종 딕셔너리 확인 및 딕셔너리 단어 추가
useSejongDic()
#mergeUserDic(data.frame("하나씩추가할","품사")) #단어


## 파일 읽기
data <- readLines("data2nd/teraMmanner_180219_some_ANSI.txt")
# data <- readLines("data2nd/seoul_new.txt")
head(data)
tail(data)

## 인코딩 깨질경우, 파일 다른이름으로 저장> utf-8 or ANSI

## 출력제외 내용 걸러내기
#gsub 반환값도 vector. http://lightblog.tistory.com/27
# data_clean <- gsub("\\d+", "", data_vector)
# w_ignore에 regex 넣을 땐 \d+ 로 넣어야 한다
ignore_path <- "data2nd/w_ignore_manner.txt"
rmDupli_path <- "data2nd/w_rm_duplicate.txt"

# ??gsub
#gsub > option: perl=T 해야 look ahead 사용가능
gsub_txt <- function(ignore_path, data){
  txt <- readLines(ignore_path) #맨 마지막 엔터 꼭
  cnt_txt <- length(txt)
  for(i in 1:cnt_txt){
    data <- gsub((txt[i]), "", data, perl= T)
  }
  return(data)
}

# 아니면 중복제거로만 따로 함수를 만들까
rmDuplicate_txt <- function(rmDupli_path, data){
  txt <- readLines(rmDupli_path) #맨 마지막 엔터 꼭
  cnt_txt <- length(txt)
  for(i in 1:cnt_txt){
    data <- gsub(txt[i], '\\1', data, perl= T)
    #print(txt[i])
  }
  return(data)
}

data <- rmDuplicate_txt(rmDupli_path, data)
head(data)
tail(data)

data <- gsub_txt(ignore_path, data)
head(data)
tail(data)
# 카톡엔 별로 안 좋은듯?
# str_replace_all(data, "[^[:alpha:]]",""); #한글 영어 빼고 나머지



## 명사만 추출
# USE.NAMES= F: 각 명사 칼럼에 대한 이름을 보고 싶지X
# 1.5MB 1분 이내
data_noun <- sapply(data, extractNoun, USE.NAMES= F)
head(data_noun)


## 리스트=> 벡터
data_vector <- unlist(data_noun)
head(data_vector, 30)

data_vector <- Filter(function(x) {nchar(x)>= 2}, data_vector)

## 출력제외 내용 걸러내기
data_clean <- gsub_txt(ignore_path, data_vector)
str_replace_all(data_clean, "[^[:alpha:]]","")

## 공백제거를 위해, 테이블로 저장
write(unlist(data_clean), "data2nd/manner_clean1.txt")
data_table <- read.table("data2nd/manner_clean1.txt")
head(data_table)
nrow(data_table)


## 단어 빈도수 확인
wordcount <- table(data_table)
head(sort(wordcount, decreasing= T), 20)


## head 본뒤에 여전히 불필요 해보이는거 제거하고 위 순서 반복
data_table <- gsub_txt(ignore_path, data_table)


## wordcloud 생성
# 색지정. Set3팔레트에서 9색 추출
palete <- brewer.pal(4, "Set2") 
# 좀 오래 걸림
wordcloud(names(wordcount), freq= wordcount, scale= c(5,1)
          , rot.per= 0, min.freq= 3
          , random.order= F, random.color= T, colors= palete)


title <- "서울시 응답소 요청사항 분석"
title <- "길매"
legend(0.3, 1, title
       , cex= 0.8, fill= NA, border= NA, bg= "white"
       , text.col= "red", text.font= 2, box.col= "red")
