library(stringr)
a <- "¾ç³ä°¨ÀÚ\nÀž\n"
str_dup(a,10)


a <- "abcdefASFGASDF12345"
str_replace_all(a,'[A-z]','')
str_replace_all(a,'[a-Z]','')

# ÀÌ°Å ¾ÈµÊ a2 <- 'apple'+'/'+'is'
a2 <- str_c('   apple','/','is','/','a   '); a2
a3 <- str_split(a2,'/')
a2
a3
str_sub(a2, start=10, end= 13)
str_sub(a3, start=1, end= 13)


library(googleVis)
Fruits
aggregate(Sales~Year, Fruits, mean)
aggregate(Sales~Fruit, Fruits, median)
cbind(aggregate(Sales~Fruit+Year, Fruits, mean)
      ,aggregate(Sales~Fruit+Year, Fruits, median)
)
cbind(aggregate(Sales~Year, Fruits, mean)
      ,aggregate(Sales~Fruit, Fruits, median)
)
cbind(aggregate(Sales~Fruit, Fruits, mean)
      ,aggregate(Sales~Fruit, Fruits, median)$Sales
)
