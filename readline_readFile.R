library(googleVis)
head(fruit)
fr_t <- as.data.frame(fruit)
head(fr_t)
head(fr_t$fruit,3)
fr_t$fruit[2]

testFct <- function(fr_t){
  in1 <- readline()
  if(fr_t$fruit[2]== in1){
    print(paste0(in1," is sweet"))
  }
  else{
    print("nope")
  }
}
testFct(fr_t)

append(1:5, 0:1, after= 3)
append(1:5, 0:1)

appText <- function(data){
  print("data뒤에 붙일거 더 넣어봐")
  in1 <- readline()
  append(data,in1)
}
appText(head(fr_t,2))


getwd()
setwd("E:/github/dataAnal_R_basic")

fr_t10 <- head(fruit, 10)
fr_t10 <- as.data.frame(fr_t10); fr_t10
write.csv(fr_t30,"data2nd/fruit30.txt")

read1 <- readLines("data2nd/fruit30.txt"); read1
read2 <- read.table("data2nd/fruit30.txt"
                    ,header= T
                    ,sep=","
                    ,row.names= "X"
                    )
read2

read10 <- read.table("data2nd/fruit30.txt"
                     ,nrows= 4
                     ,header= T
                     ,sep=","
                     ,row.names= "X"
                     )
read10
