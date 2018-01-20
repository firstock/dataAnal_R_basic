#p147
vX <- c(1:5, 10)
mode(vX)
is.vector(vX)

v2 <- c("a",1)
v2

v_w <- c(10,20,30,40)
v_w
is.vector(v_w)
names(v_w) <- c("mouse","rabbit","dog","human")
v_w

# colnames(v_w) <- c("m","r","d","h") #error!
names(v_w) <- c("m","r","d","h")
v_w

v_w["m"]
v_w[c("m","d")]


vX <- c(1:5,10)
vX

#p157. data frame
#vector 합치기
Customer_Name <- c("Hong","Kim","Han","Kim2")
Price <- c(2300,1100000,12300000,340000)
Exchage_rate <- c(1.14,1.16,1.14,1.15)
Doller <- c(175,862,877,261)
Customer_class <- c("A","C","VIP","B")
vDf2 <- cbind(Customer_Name,Price,Exchage_rate
              ,Doller,Customer_class)
vDf2


# data frame
vDf3 <- data.frame(
  Customer_Name = c("Hong", "Kim", "Han", "Kim2")
  ,Price = c(2300, 1100000, 12300000, 340000)
  ,Exchage_rate = c(1.14, 1.16, 1.14, 1.15)
  ,Doller = c(175, 862, 877, 261)
  ,Customer_class = c("A", "C", "VIP", "B")
)
vDf3

# 깨짐
# save(vDf3,file="data/ord_fac3.txt")
# write.table(vDf3,"data/ord_fac3.txt"
#             ,row.names=T
#             ,col.names=T) 잘 안됨. 행번호 빼고 데려와야 하는데??

# excel로 직접 넣은
vDf <- read.table(
  # "data/ord_fac3.txt",
  "data/ord_fac1.txt",
  skip = 0,
  quote = "",
  sep = "",
  header = TRUE,
  stringsAsFactors = FALSE,
  colClasses = c("character", "numeric", "numeric", "numeric", "factor")
)

head(vDf)

vDf[[4]]
# vDf[[,4:5]]
vDf[,4:5]
