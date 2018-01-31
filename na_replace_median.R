폴더위치("E:\github\dataAnal_R_basic")

# val <- data.frame()
replacement <- data.frame(val =  c(1,2,3,4,NA,5,NA)); replacement

replacement <- within(replacement, {
  val <- ifelse(is.na(val), median(val, na.rm=TRUE), val)
}); replacement

# rm(val)
#scope 안에만 있는 변수를 다른데서 데려옴 ㅋㅋㅋ 개신기

