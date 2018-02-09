getwd()
setwd("E:/github/dataAnal_R_basic")

install.packages("googleVis")
install.packages("sqldf")
library(googleVis)
library(sqldf)

t_emp <- read.csv.sql("data_table/emp_ansi.csv", sql="select * from file"); t_emp
