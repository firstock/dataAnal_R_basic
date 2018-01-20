getwd()
#matrix. 행(0,4,...,20), 열(5,35,5,35,5,35,5)
?stem
example(stem)

th <- seq(0,20,4)
tm5 <- rep(5,6)
tm35 <- rep(35,6)
tbo <- data.frame(th, tm5,tm35,tm5,tm35,tm5,tm35,tm5)
stem(tbo)
#
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

total_vector1 <- c(A_vector+ B_vector)
total_vector2 <- A_vector+ B_vector # sum
total_vector3 <- c(A_vector, B_vector) # 덧붙임

total_vector1
total_vector2
total_vector3
#
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Assign to total_daily how much you won/lost on each day
total_daily <- poker_vector[days_vector]+ roulette_vector[days_vector]
total_daily
days_vector
#
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

total_poker <- sum(poker_vector[days_vector])
total_roulette <- sum(roulette_vector[days_vector])

sum(total_poker, total_roulette)
#
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

poker_wednesday <- poker_vector["Wednesday"]
poker_wednesday2 <- poker_vector[["Wednesday"]]
poker_wednesday
poker_wednesday2

#twitteR.검색 apps.twitter.com
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
#인증
consumerKey <- '3esVC69GlJcmxL4VezZ7CdKwu' 
consumerSecret <- 'gwtwk1oMqQvi6ZfqPphQb9uJctCDIIldGxYymU9OcCAJDbkouQ'
accessToken <- '133360027-x7e4FuoCVA4AsEFBMjhs4kvx3HN86ajsRQmG7mwJ'
accessSecret <- 'ak2qVw9ioIXyLmUw1UqWHNHohJRRPfWzlDtABaHRYzJIr'

requestURL <- paste0("https://api.twitter.com/oauth/",consumerKey)
accessURL <- paste0("https://api.twitter.com/oauth/",accessToken)
authURL <- "https://api.twitter.com/oauth/authorize"

twitCred <- OAuthFactory$new(
  consumerKey= consumerKey
  , consumerSecret= consumerSecret
  , requestURL= requestURL
  , accessURL= accessURL
  , authURL= authURL
)
#사용가능하게
setup_twitter_oauth(consumerKey, consumerSecret
                    , access_token= accessToken
                    , access_secret= accessSecret)
1
#검색
n <- 200
keyword <- 'react'
keyword <- enc2utf8(keyword)
tweets <- searchTwitter(keyword, n)
tweet_df <- twListToDF(tweets)
#파일 저장
write.csv(tweet_df, file=paste0(file_path,'result/_web_',keyword,'.csv'), row.names=F)

#local에 R인증 저장
save(twitCred, file=paste0(file_path,'result/twitter_authentication.Rdata'))
save(list="twitCred", file=paste0(file_path,"result/twitteR_credentials"))
