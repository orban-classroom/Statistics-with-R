## Lecture 3

## Load the data
## 

class.data <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv")

head(class.data, n=1)
tail(class.data, n=1)

colnames(class.data)

## Get the sample size
n <- nrow(class.data)
n

class.data$cups.caffeine.weekly

## Various ways to visualize the data

## Generate scatterplot

plot(class.data$cups.caffeine.weekly)

## Generate a histogram

hist(class.data$cups.caffeine.weekly)

## Generate a boxplot

boxplot(class.data$cups.caffeine.weekly)

## Central Tendencies

## Mean
## Pseudocode: Mean = TotalSum / SampleSize

# Note that I already calculated the sample size on line 14
# Always smart to reuse calculations done earlier

total.sum <- sum(class.data$cups.caffeine.weekly)

mean.caffeine <- total.sum / n

## There is a built-in, superfast way in R to get this number
## Caution: Do not use this function until after take-home exam 1
mean(class.data$cups.caffeine.weekly)

## You can use this function to double check your work.

## Median
## Conceptually: The half-way point of the data
## Pseudo code: Median = Sorted data / sample size (approximately)
## The median is different depending on whether you have an even or an odd number of observations
## Even: You end up with 2 possible values. You need to take both middle values, and compute their mean
## Odd: Easy, take the middle value

sorted.caffeine <- sort(class.data$cups.caffeine.weekly)
half.way <- n/2
half.way.plus <- (n/2)+1

## Concept "subsetting" or "filtering" the data
## Using a square bracket after a variable name, I can 
## request a certain value or a certain range of values inside that data set

## Partial calculations for convenience
sorted.caffeine[half.way]  ## for odd number of observations, this is your median
sorted.caffeine[half.way.plus]

## The actual answer
median.caffeine <- (sorted.caffeine[half.way] + sorted.caffeine[half.way.plus]) / 2

## There is a built-in superfast automatic way to do this: 
median(class.data$cups.caffeine.weekly)
## Caution: Do not use this function until after take-home exam 1

## Mode
## The most frequently occurring value in the data set. 

## Lean on the sorted data variable, that was calculated earlier on Line 57
## rle = run length encoding - counts each value that occurs in a data set
rle(sorted.caffeine)
# we can conclude that there are 30x 0 values, and it's the most commonly occurring value

## R Base does not have any functions that output the mode
mode(class.data$cups.caffeine.weekly)
## mode() is not the function you're looking for

## R is wonderfully extendible. You can install any library to extend functions of R Base
## There are thousands of libraries, you can even make your own 
## The mode function can be found in many different libraries
## Couple of things to learn: 
## 1. How to install a new package/library in R Base
## 2. How to load a library for use in a notebook
## 3. How to use the function loaded from a library

## You will run it once. You do not need to run it for each new notebook
install.packages("lsr")

## Load the library into this notebook
## This has to be done every time you start a new notebook, and you want to use this function
library(lsr)

## Use the function. The Superfast, built-in "after-market" way of computing the mode
modeOf(class.data$cups.caffeine.weekly)
## the O is capital case

## Subsetting or Filtering the data

class.data[<<specify row based rule >>, <<specify column base rule>>]

## this gives you all data. nothing to be filtered
class.data[ , ]

class.data[ ,"hrs.work.weekly"]
## this selects just the hours of work column
## equivalent to using the dollar sign: 
class.data$hrs.work.weekly

low.work.students <- class.data[class.data$hrs.work.weekly < 15,"hrs.screentime.weekly"]
high.work.students <- class.data[class.data$hrs.work.weekly > 15,"hrs.screentime.weekly"]

## Calcualte the mean for each group

low.work.mean <- sum(low.work.students) / length(low.work.students)
high.work.mean <- sum(high.work.students) / length(high.work.students)

## When dealing with a vector, you need to calculate the sample size using length()
## nrow() can only be applied to a data frame






