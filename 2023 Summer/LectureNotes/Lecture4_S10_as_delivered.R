## Lecture 4

## PSYC 2300 Data set

classdata <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-spring/data/2300data.csv")

## What is the Standard Deviation of Sleep?

## Steps to do this: 
## Mean

classdata_sum <- sum(classdata$hrs.sleep.weekly)
classdata_n <- length(classdata$hrs.sleep.weekly)

## Common mistakes
length(classdata) # length() on a data frame reports the number of variables
nrow(classdata)

classdata_mean <- classdata_sum / classdata_n

## Centred scores (deviation scores)

classdata_centred <- classdata$hrs.sleep.weekly - classdata_mean

## verify your result buy summing up deviation scores
round(sum(classdata_centred), 2)

## Save the deviation scores back into the original data frame
## by coming up with a new column name, and making your calculation equal to it
classdata$sleep.deviation.scores <- classdata$hrs.sleep.weekly - classdata_mean

## Square the centred scores
## Why? In order to get a magnitude calculation on the amount of variation in the data

classdata$squared.sleep.deviation.scores <- classdata$sleep.deviation.scores^2

## Sum up the centred scores
## Called Sums of Squares
ss <- sum(classdata$squared.sleep.deviation.scores)

## Compute Variance

sleep.variance <- ss/(classdata_n-1)

## super fast method: 
var(classdata$hrs.sleep.weekly)

## Compute Standard Deviation

sleep.s <- sqrt(sleep.variance)

## super fast method: 
sd(classdata$sleep.deviation.scores)


