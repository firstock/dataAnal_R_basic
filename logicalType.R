#p113
vX <- TRUE
vX

is.logical(vX)
typeof(vX)

vY <- (1<2)& (1>2)
vY

vY <- (1<2)|(1>2)
vY

is.logical(0)
as.logical(0)
as.logical(1)
as.logical(3)

!0
!100

?as.logical
?is.logical


nchar("abc")
nchar(c("NA","A","ÇÑ±Û",NA),type="chars")