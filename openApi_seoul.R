getwd()
#openAPI
#고용보험 피보험자
# http://data.seoul.go.kr/dataList/datasetView.do?infId=10643&srvType=S&serviceKind=2&currentPageNo=1&searchValue=&searchKey=null
url1= "http://openapi.seoul.go.kr:8088/504247774f6f70743430624574717a/xml/octastatapi10643/1/5/"

# install.packages("chardet") - error no pckg
# library(Runchardet)

# install.packages("XML")
library(XML)
library(xml2)
seoulJob <- xmlToDataFrame(url1)
headSJ <- head(seoulJob,1)

#data frame 만 가능
write_xml(headSJ,"data/myR/result/seoulJob_head1.xml")

args(write_xml)
??write_xml
example(write_xml)

##
