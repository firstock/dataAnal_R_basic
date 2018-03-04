# setwd("D:/github/dataAnal_R_basic")
install.packages("xml2")
install.packages("rvest")
library(xml2)
library(rvest)

#### example(html_attrs)
#### https://mrchypark.github.io/getWebR/#27

## 여러링크속 내용을 한번에 저장하는방법?
url <- "http://www.oreilly.com/data/free/archive.html"
url <- "http://www.oreilly.com/webops/free/"
url <- "http://www.oreilly.com/web-platform/free/"
url <- "http://www.oreilly.com/security/free/"
url <- "http://www.oreilly.com/programming/free/"
url <- "http://www.oreilly.com/iot/free/"


eBtitle <- url %>%
  read_html %>%
  html_nodes("img") %>%
  html_attr("alt")

eBtitle <- tolower(eBtitle)
eBtitle <- gsub(" ","-",eBtitle)
eBtitle <- gsub(",|(:.*$)|(o'reilly-home)|(tarsier)","",eBtitle)
eBtitle <- gsub("^(.*)$","http://www.oreilly.com/data/free/files/\\1.pdf",eBtitle)
eBtitle

## 여러 링크 내용 한 번에

eBtitle_s <- eBtitle


#저장
writeLines(eBtitle_s, "data2nd/oreiliiy_title.txt")