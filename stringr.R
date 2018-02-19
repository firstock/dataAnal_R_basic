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

