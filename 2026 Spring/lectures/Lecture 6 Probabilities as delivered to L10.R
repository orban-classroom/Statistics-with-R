## Lecture 6: Probabilities



vect <- c(1,2,3,3,3,4,5,6,6,7,8,15)

## What is the chance of picking out a 3?
countingValues <- length(vect[vect == 3])
totalValues <- length(vect)
countingValues / totalValues * 100 ## x100 converts it to a percentage
# 27%

## What is the chance of picking out a value that's less than 5?
lessThan5 <- length(vect[vect < 5])
lessThan5 / totalValues * 100
## 54%

## What is the chance of picking out a value that's less than or equal to 5?
lessThanEqual5 <- length(vect[vect <= 5])
lessThanEqual5 / totalValues * 100
## 63%

## Practical matters

hist(vect)

## skewness and kurtosis functions are found in many libraries
## it's in lsr, and moments
install.packages("moments")
library("lsr")
skewness() # norma = 0; +/- 2 is fine
kurtosi() # mesokurtic = - (+/-2 is fine)

library(moments)
skewness(vect) # normal = 0; +/- 2
kurtosis(vect) # mesokurtic = 3 (acceptable range +/-2)

boxplot(vect,
        xlab = c("vect"),
        ylab = c("Range of scores"))


