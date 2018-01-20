#p120. apps.twitter.com
# install.packages("base64enc")
# install.packages("ROAuth")
# install.packages("twitteR")
# 
# install.packages("plyr")
# install.packages("stringr")
# install.packages("RJSONIO")
# install.packages("RCurl")
# install.packages("ggplot2")

library(twitteR)
library(ROAuth)
# library(RCurl)
library(base64enc)

library(plyr)
library(stringr)
library(RJSONIO)
library(RCurl)
library(ggplot2)

consumerKey <-  "inhysBxgyQ3j2zVVKNMIxJsxO"
consumerSecret <-  "aYWfMPOKPIHYtTzo8ip91rq9KbJIcPLWu2iYPqV1ATzCjVRMj2"
accessSecret <- "CCRnikEb5XeZ7LY0d1uvRby5Vj13O1QG3uiPV6zepyUGT"

requestURL <- "https://api.twitter.com/oauth/request_token"
authorizeURL <- "https://api.twitter.com/oauth/authorize"
accessURL <- "https://api.twitter.com/oauth/access_token"

accessToken <- "817499316847669248-nSsT5c9eGsBJrM0HD4COeWIa3WNIHyr"

requestURL <- "https://api.twitter.com/oauth/inhysBxgyQ3j2zVVKNMIxJsxO"
accessURL <-  "https://api.twitter.com/oauth/817499316847669248-nSsT5c9eGsBJrM0HD4COeWIa3WNIHyr"
authURL <-  "https://api.twitter.com/oauth/"
#
twitCred <- OAuthFactory$new(
  consumerKey= consumerKey,
  consumerSecret= consumerSecret,
  requestURL= requestURL,
  accessURL= accessTokenURL
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
tweets2 <- searchTwitter(keyword, n)

Rangers_df <- twListToDF(tweets2)

#
write.csv(Rangers_df, file='_RangersTweets.csv', row.names=F)

#인증저장
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
registerTwitterOAuth(twitCred)
?setup_twitter_oauth

save(twitCred, file="twitter_authentication.Rdata")
save(list="twitCred", file="twitteR_credentials")
