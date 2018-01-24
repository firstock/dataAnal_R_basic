# fail
#p98. read xlsx
setwd("D:/github/dataAnal_R_basic")

#perl. 이미설치> Unable to install Perl XLSX support libraries
# installXLSXsupport(perl="C:\\Strawberry\\perl\\bin\\perl5.26.1.exe",verbose=FALSE)

# install.packages("gdata")
library(gdata)
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre-9.0.4')


# error!
# dExcel <- read.xls("data/ihwaFavor15-16.xlsx", sheet=1)
dExcel2 <- read.xlsx("data/ihwaFavor15-16_no.xlsx",sheetIndex=1) #한글깨지면 ㄱ
dExcel <- read.xlsx("data/hamp.xlsx", skip=1,sheetIndex=1)
hamp<-read.xlsx("data/hamp.xlsx",
                sheetIndex =1,
                colNames=TRUE,
                startRow = 2)

.libPaths()

####
install.packages("xlsx")
library(xlsx)

#~p286