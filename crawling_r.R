#scraping. ?????? ????????????????????? ???????????? ??????

# install.packages("scrapeR")
# install.packages("RCurl")
install.packages("XML")
install.packages("bitops")
library(RCurl)
library(XML)
library(bitops)

library(scrapeR)
??scrapeR
#
install.packages("rvest")
install.packages("xml2")
library(rvest)
library(xml2)


# url= "http://lumiamitie.github.io/r_tutorial/Rtut03_crawling"
url= "http://cafe.naver.com/"
SOURCE= getURL(url)
PARSED= htmlParse(SOURCE)
xpathSApply(PARSED, "//*[@id='special-menu-0']",xmlValue)



web1= readLines('https://feedly.com/i/search/%EC%9B%B9%20%EA%B0%9C%EB%B0%9C/-/-/-/forever/-'
                # ,encoding="UTF-8"
                )
summary(web1)
