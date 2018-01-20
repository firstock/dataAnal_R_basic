# p.14~
# sessionInfo()
# options("devices")

getOption("digits")
options(digits= 22)

# install.packages("openxlsx")
library(openxlsx)

getwd()
#프로그램에서 1번째 줄부터 읽기시
done2<- read.xlsx("publicData/serial30digit2.xlsx", sheet=1, colNames= TRUE, startRow=1)
str(done2)

# http://127.0.0.1:13263/doc/html/index.html
# localhost:portNo. my pc webserver_main page
help.start()

# site에서 ref
RSiteSearch("lm")

# 둘이 같은거. 잘모르는 명령어
??plo
help.search("plot")

# install.packages("graphics")
library(graphics)
plot()

args(plot)
args(tapply)

# 카테고리 데이터/ 범주형 Levels- ex. A B AB O 형
# 를 시각화
install.packages("vcd")
library(vcd)
example(Arthritis)
??vcd

# 단층신경망
??nnet
help(nnet, package= "nnet")
help(package= "vcd")
# enter, enter
example(plot)

# p.22
install.packages("nnet")
library(nnet)
example(nnet)