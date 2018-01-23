#p120. apps.twitter.com
file_path <- "f:/doc/myR/"
setwd(file_path)

install.packages("base64enc")
install.packages("ROAuth")
install.packages("twitteR")

install.packages("plyr")
install.packages("stringr")
install.packages("RJSONIO")
install.packages("ggplot2")

library(twitteR)
library(ROAuth)
library(base64enc)

library(plyr)
library(stringr)
library(RJSONIO)
library(ggplot2)

consumerKey <- '3esVC69GlJcmxL4VezZ7CdKwu' 
consumerSecret <-  'gwtwk1oMqQvi6ZfqPphQb9uJctCDIIldGxYymU9OcCAJDbkouQ'
accessToken <- '133360027-x7e4FuoCVA4AsEFBMjhs4kvx3HN86ajsRQmG7mwJ'
accessSecret <- 'ak2qVw9ioIXyLmUw1UqWHNHohJRRPfWzlDtABaHRYzJIr'

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

#https://github.com/geoffjentry/twitteR/
install.packages("devtools")
library(devtools)
install_github("twitteR", username="geoffjentry", force=TRUE)
# ??install_github

# Rangers_list <- searchTwitter('#react', n=100, cainfo="cacert.pem")
# library(RCurl)
# options(RCurlOptions = list(cainfo= system.file("CurlSSL", "cacert.pem", package="RCurl")))
# error! -> 방법2

#p126 방법2
n <- 200
keyword <- 'react'
keyword <- enc2utf8(keyword)
tweets <- searchTwitter(keyword, n)

tweet_df <- twListToDF(tweets)

#
write.csv(tweet_df, file=paste0(file_path,'result/_web_',keyword,'.csv'), row.names=F)

#인증저장
# download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
# registerTwitterOAuth(twitCred)
# ?setup_twitter_oauth

save(twitCred, file="twitter_authentication.Rdata")
save(list="twitCred", file="twitteR_credentials")

