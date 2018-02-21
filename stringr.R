library(stringr)
library(googleVis)
fruits <- head(fruit,5); fruits

#str_dup. 각 문자열 n회 반복출력
str_dup(fruits, 3)
fruits

wpi <- c("windows","photoshop","illustrate")
str_c(wpi)
str_c("platform: ", wpi)
str_c(wpi, collapse= "펑")



## 시험문제 반영
mat1 <- matrix(c(1,2,3,4,5,6), nrow=2, byrow= T)
mat1


str1 <- "  a/p/c  "
typeof(str_split(str1,"/"))

str_trim(str1, "left")

str_replace_all('a??????abc???daa??',"\\?\\?","?")
str_replace_all('a??????abc???daa??',"(\\?)\\?+",'\\1')
str_replace_all('a??????abc???daa??',"\\?\\?","")
