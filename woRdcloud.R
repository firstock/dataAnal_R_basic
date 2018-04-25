getwd()
<<<<<<< HEAD
setwd("E:/github/proj_sponge_bicycle/data")
=======
setwd("d:/github/dataAnal_R_basic/data2nd")
>>>>>>> 0ba2fd33d7959b0ff18caf698ede12771393a128

#english - tm
install.packages("KoNLP") #extractNoun. ??ġ?ҷ? jdk?ʿ?
install.packages("RColorBrewer") #brewer.pal
install.packages("wordcloud") #wordcloud
library(KoNLP)
library(RColorBrewer)
library(wordcloud)

<<<<<<< HEAD
text_jb51_homepage <- readLines("cpNaverNewsContent.txt")
=======
text_jb51_homepage <- readLines("bistel_reply.txt")
>>>>>>> 0ba2fd33d7959b0ff18caf698ede12771393a128
txtjb2 <- sapply(text_jb51_homepage, extractNoun, USE.NAMES=F)
txtjb3 <- unlist(txtjb2)
head(txtjb3,10)
# gsub
<<<<<<< HEAD


txt <- readLines("w_ignore.txt")
=======
txt <- readLines("w_ignore_jobplanet.txt")
>>>>>>> 0ba2fd33d7959b0ff18caf698ede12771393a128
txt[5]
cnt_txt <- length(txt)
for(i in 1:cnt_txt){
  txtjb3 <- gsub((txt[i]),"",txtjb3)
}

txtjb3 <- Filter(function(x) {
  nchar(x)>=2
}, txtjb3)

# save- I need
write(unlist(txtjb3),"wordCloud_before.txt")

# wordcloud- for viewing
data4 <- read.table("wordCloud_before.txt")
wordcount <- table(data4)

#��?? ?? 20????
head(sort(wordcount, decreasing=T), 50)

palete <- brewer.pal(8,"Set2")
wordcloud(names(wordcount), freq= wordcount, scale=c(5,1)
          ,rot.per=0, min.freq=1, random.order=F
          ,random.color=T, colors=palete)

# ??brewer.pal
# ??wordcloud
# RSiteSearch(wordcloud)
