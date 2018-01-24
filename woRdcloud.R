getwd()
setwd("D:/github/dataAnal_R_basic/result")

#english - tm
install.packages("KoNLP") #extractNoun. 설치할렴 jdk필요
install.packages("RColorBrewer") #brewer.pal
install.packages("wordcloud") #wordcloud
library(KoNLP)
library(RColorBrewer)
library(wordcloud)

text_jb51_homepage <- readLines("jb51_Eng_utf8.txt")
txtjb2 <- sapply(text_jb51_homepage, extractNoun, USE.NAMES=F)
txtjb3 <- unlist(txtjb2)
head(txtjb3,10)
# gsub
txt <- readLines("w_gsub.txt")
txt[5]
cnt_txt <- length(txt)
for(i in 1:cnt_txt){
  txtjb3 <- gsub((txt[i]),"",txtjb3)
}

txtjb3 <- Filter(function(x) {
  nchar(x)>=2
}, txtjb3)

# save- I need
write(unlist(txtjb3),"jb15.net_homepage_text.txt")

# wordcloud- for viewing
data4 <- read.table("jb15.net_homepage_text.txt")
wordcount <- table(data4)

#정렬 후 20개만
head(sort(wordcount, decreasing=T), 20)

palete <- brewer.pal(8,"Set2")
wordcloud(names(wordcount), freq= wordcount, scale=c(5,1)
          ,rot.per=0, min.freq=1, random.order=F
          ,random.color=T, colors=palete)

# ??brewer.pal
# ??wordcloud
# RSiteSearch(wordcloud)
