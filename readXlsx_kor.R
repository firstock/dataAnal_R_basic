#readXlsx_many
setwd("D:/github/dataAnal_R_basic")
# options(encoding="UTF-8")


crimi <- read.xlsx("data/criminal.xlsx",sheetIndex=1,encoding="utf-8")
head(crimi)
