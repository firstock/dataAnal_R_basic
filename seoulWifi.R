#p68. data 어디? 실행안해봄
filePath <- "D:/github/dataAnal_R_basic" #학원
setwd(filePath)

options(digits = 10)
wifi_data <- read.csv("seoul_wifi2.csv", header = T, sep = "")

head(wif_data)
str(wifi_data)
table(wifi_data$설치위치.X좌표.)

#
a1 <- read.table("readtable.txt",header=TRUE)
a2 <- read.table("readtable_2.txt",header=TRUE)


