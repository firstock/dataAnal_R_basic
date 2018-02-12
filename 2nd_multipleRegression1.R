## 다중회귀
head(iris)
str(iris)

m <- lm(Sepal.Length~ Sepal.Width+ Petal.Length+ Petal.Width, iris);m

summary(m)

install.packages("car")
library(car)

vif(m)
sqrt(vif(m))

sqrt(vif(m)) >= 2
