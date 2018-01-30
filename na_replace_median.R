폴더위치("E:\github\dataAnal_R_basic")

val <- data.frame()
replacement <- data.frame(val =  c(1,2,3,4,NA,5,NA)); replacement

replacement <- within(replacement, {
  val <- ifelse(is.na(val), median(val, na.rm=TRUE), val)
}); replacement
