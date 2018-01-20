#crawling
install.packages("RCurl")
# install.packages("rvest")
library(RCurl)

# url= "http://lumiamitie.github.io/r_tutorial/Rtut03_crawling"
url= "http://cafe.naver.com/dataan#"
SOURCE= getURL(url)
PARSED= htmlParse(SOURCE)
xpathSApply(PARSED, "//*[@id='special-menu-0']",xmlValue)


