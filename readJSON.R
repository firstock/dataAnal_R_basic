#step2
#p24. JSON-> dataFrame. http://cafe.naver.com/dataan/416
# install.packages("jsonlite")
library(jsonlite)

life <- fromJSON("data_ex/life.json",flatten=TRUE)
str(life$body$region)

df <- lapply(life$body$region$jisu, function(play){
  #convert each group to a data frame
  #this assumes you have 6 elements each time
  data.frame(matrix(unlist(play), ncol=5))
})

df <- do.call(rbind, df)
df_life27 <- cbind(rep(life$body$region$rgnNm, each=14),df)

df
df_life27

###########P32
# data 요청 URL
getwd()
install.packages("jsonlite")
library(jsonlite)
url2= "http://taas.koroad.or.kr/data/rest/frequentzone/oldman?authKey=Y5%2FIAuW2XKTel4UNWQZS7j7wbw23vCfrCaA%2B%2BWy%2Bp9TshOzxGpHjpH%2BKxrCezkIg&searchYearCd=2017029&sido=47&gugun=130&DEATH=Y"

raw.data <- readLines(url2, warn="F", encoding="UTF-8")
dat <-  fromJSON(raw.data)
str(dat)
# ??fromJSON
#열이름 읽기
str(dat$searchResult$accidentDeath$dt_006)

#list형식ㄱ의 데이터 data.framee obj로 변형후 저장
data.frame2 <- data.frame(dat$searchResult$accidentDeath)
dim(data.frame2)
head(data.frame2,1)

#저장
write.csv(data.frame2, "d:/result_json/0_dataFrame2.csv")
