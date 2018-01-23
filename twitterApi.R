#p120. apps.twitter.com
# file_path <- "f:/doc/myR/" #집
file_path <- "D:/github/dataAnal_R_basic/" #학원
setwd(file_path)

install.packages("ROAuth")
install.packages("twitteR")
install.packages("base64enc")

install.packages("plyr")
install.packages("stringr")
install.packages("RJSONIO")
install.packages("ggplot2")

library(ROAuth)
library(twitteR)
library(base64enc)

library(plyr)
library(stringr)
library(RJSONIO)
library(ggplot2)

# consumerKey <- '3esVC69GlJcmxL4VezZ7CdKwu' 
# consumerSecret <-  'gwtwk1oMqQvi6ZfqPphQb9uJctCDIIldGxYymU9OcCAJDbkouQ'
# accessToken <- '133360027-x7e4FuoCVA4AsEFBMjhs4kvx3HN86ajsRQmG7mwJ'
# accessSecret <- 'ak2qVw9ioIXyLmUw1UqWHNHohJRRPfWzlDtABaHRYzJIr'
consumerKey <-  "inhysBxgyQ3j2zVVKNMIxJsxO"
consumerSecret <-  "aYWfMPOKPIHYtTzo8ip91rq9KbJIcPLWu2iYPqV1ATzCjVRMj2"
accessSecret <- "CCRnikEb5XeZ7LY0d1uvRby5Vj13O1QG3uiPV6zepyUGT"
accessToken <- "817499316847669248-nSsT5c9eGsBJrM0HD4COeWIa3WNIHyr"

requestURL <- paste0("https://api.twitter.com/oauth/",consumerKey)
accessURL <- paste0("https://api.twitter.com/oauth/",accessToken)
authURL <- "https://api.twitter.com/oauth/authorize"
#
twitCred <- OAuthFactory$new(
  consumerKey= consumerKey
  , consumerSecret= consumerSecret
  , requestURL= requestURL
  , accessURL= accessURL
  , authURL= authURL
)

# 사용가능한 상태 만들기
setup_twitter_oauth(consumerKey, consumerSecret,
                    access_token=accessToken,
                    access_secret=accessSecret)
1
#p127
#https://github.com/geoffjentry/twitteR/
# install.packages("devtools")
# library(devtools)
# install_github("twitteR", username="geoffjentry", force=TRUE)
# ??install_github

# Rangers_list <- searchTwitter('#react', n=100, cainfo="cacert.pem")
# library(RCurl)
# options(RCurlOptions = list(cainfo= system.file("CurlSSL", "cacert.pem", package="RCurl")))
# error! -> 방법2

#p126 방법2
n <- 200
keyword <- 'angular'
keyword <- enc2utf8(keyword)
tweets <- searchTwitter(keyword, n)

tweet_df <- twListToDF(tweets)

#
write.csv(tweet_df, file=paste0(file_path,'result/_web_',keyword,'.csv'), row.names=F)

# download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
# registerTwitterOAuth(twitCred)
# ?setup_twitter_oauth

#인증저장. once run
# save(twitCred, file="twitter_authentication.Rdata")
# save(list="twitCred", file="twitteR_credentials")



######## 정량화
# p128. to dataFrame
df_twit <- do.call("rbind", lapply(tweets, as.data.frame))
str(df_twit)

#p129. tm package. string split
rules <- sapply(df_twit$text, strsplit, " ", USE.NAMES=F)
rules[[1]]

# once run
# install.packages("NLP")
# install.packages("tm") #VectorSource
# library(NLP)
# library(tm)

# ## no tm error
# # https://stackoverflow.com/questions/26570912/error-in-installation-a-r-packages
# # install.packages("pacman")
# # library(pacman)
# Sys.getenv("R_LIBS_USER")

# 구 단위로 쪼개야. 글자 단위 ㄴ
reV <- unlist(rules)
revec <- VectorSource(rules)
revecco <- Corpus(VectorSource(rules))

rmyTdm <-
  TermDocumentMatrix(revecco, control = list(wordLengths = c(2, Inf)))
str(rmyTdm)

#p130
indspect_rmy <- inspect(rmyTdm[1:20, 1:20])

write.csv(
  indspect_rmy
  ,file = paste0(file_path, 'result/_inspect_', keyword, '.csv')
  ,row.names = T
)
