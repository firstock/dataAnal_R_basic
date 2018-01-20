#p.82
attributes(iris)
str(iris)

iris$Sepal.Length

install.packages("e1071")
library(e1071)

fit <- lm(mpg~wt, data=mtcars)
str(fit)
summary(fit)

?lm

#p83
erup <- faithful$eruptions
hist(erup, freq= FALSE)
lines(density(erup))
abline(v=mean(erup), lty="dotted", col="green")
abline(v=median(erup), col="red", lty="dashed")
#abline(v=quantile(erup, c(0.25, 0.75), col="green")
abline(v=quantile(erup, c(0.95)), col="red", lwd=2)

# ?lines
# example(lines)
# example(abline)
