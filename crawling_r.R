#scraping. ?????? ????????????????????? ???????????? ??????
getwd()
setwd("d:/")
# 1 rvest
install.packages("xml2")
install.packages("rvest")
library(xml2)
library(rvest)

#hyper-link
url1 <- "http://news.naver.com/"
sc_url1 <- url1 %>% read_html %>% html_nodes("a") %>% xml_attr("href")

head(sc_url1,8)

#table. https://brunch.co.kr/@dugi/12
url2 <- "https://en.wikipedia.org/wiki/Student%27s_t-distribution"
sc_url2 <- url2 %>% read_html %>% html_nodes(".wikitable") %>% html_table()
head(sc_url2)

#text. http://www.jb51.net/
url3 <- "http://www.jb51.net/"
sc_url3 <- url3 %>% read_html %>% html_nodes("a") %>% html_text()
sc_url4 <- url3 %>% read_html %>% html_nodes("div") %>% html_text()
head(sc_url3,20)
summary(sc_url4)

Encoding(sc_url4)
# sc_url4_gs <- gsub("\\<U\\+[0-9A-Z]{4}\\>","",sc_url4) #?????? ??????& ??????
writeLines(sc_url4_gs,"data/jb51_4.txt")

# install.packages("scrapeR")
# install.packages("RCurl")
# install.packages("XML")
# install.packages("bitops")
# library(RCurl)
# library(XML)
# library(bitops)
# 
# library(scrapeR)
# ??scrapeR



# # url= "http://lumiamitie.github.io/r_tutorial/Rtut03_crawling"
# url= "http://cafe.naver.com/"
# SOURCE= getURL(url)
# PARSED= htmlParse(SOURCE)
# xpathSApply(PARSED, "//*[@id='special-menu-0']",xmlValue)
# 
# 
# 
# web1= readLines('https://feedly.com/i/search/%EC%9B%B9%20%EA%B0%9C%EB%B0%9C/-/-/-/forever/-'
#                 # ,encoding="UTF-8"
#                 )
# summary(web1)
