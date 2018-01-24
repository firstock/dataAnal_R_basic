#readXlsx_many
setwd("D:/github/dataAnal_R_basic/data/many_xlsx/")
options(encoding="UTF-8")

# crimi <- read.xlsx("data/criminal.xlsx",sheetIndex=1,encoding="utf-8")
# head(crimi)


file_list= list.files(pattern="xlsx$")
dataset= data.frame()
for(file in file_list){
  print(file)
  temp= xlsx::read.xlsx(file, sheetIndex=1, colNames=TRUE, encoding="UTF-8")
  dataset= rbind(dataset, temp)
}

# ??xlsx
