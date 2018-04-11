####### input: stdin

# fp=file("stdin", "r") # local에서 실행 X !
a=scan(file=fp, what=integer(0), n=1)
b=scan(file=fp, what=integer(0), n=1)
cat(a+b)

a=scan(file=file("stdin", "r"), what=integer(0), n=2)
cat(sum(a))

####
# a=scan(file("stdin","r"),integer(0),2)
cat(sum(a))

#### 
Add= function(a,b){
  c= a+b
  return(c)
}
# input= readLines("stdin",n=1)
input= readline()
data= strsplit(input[1],"")
data
data[[1]]
data[[1]][1]
data[[1]][2]
a= strtoi(data[[1]][1])
b= strtoi(data[[1]][2])

cat(Add(a,b))

####
input<-file('stdin', 'r')
row <- readLines(input, n=1)
write(sum(Map(as.numeric, strsplit(row, " "))[[1]]), "")

input