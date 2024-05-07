## Lecture 5
## #########

## Pick a dataset: 
df <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2019%20Spring/data/ubcgarbage/garbage_disposal.csv")

head(df)

## Conceptually
## 1 Calculate a deviation score for the time_at_bin variable
## 2 Calcualte a deviation score for the proportion_correct variable
## 3 Sum them up separately
## 4 Multiply together
## 5 Divide them by the df

## Actually
## Pre-requisites

# filtered vectors
time_at_bin <- df$time_at_bin ## one simple way
time_at_bin <- df[,4] ## another simple way
time_at_bin <- df[,"time_at_bin"] ## another simple way
proportion_correct <- df$proportion_correct

# sample size & degrees of freedom
n <- length(df$subject_id) ## option 1, calculate one of the columns
n <- nrow(df) ## option 2, calculate the number of rows in the data frame
deg.freedom <- n - 1

  
# The mean, manually

## Time at Bin
sum.time_at_bin <- sum(time_at_bin)
mean.time_at_bin <- sum.time_at_bin / n

## verification
mean(time_at_bin)

## Proportion Correct
sum.proportion_correct <- sum(proportion_correct)
mean.proportion_correct <- sum.proportion_correct / n

## verification
mean(proportion_correct)

## Deviation scores

deviation.time_at_bin <- (time_at_bin - mean.time_at_bin)

## veritification, that it sums to 0
sum(deviation.time_at_bin)

deviation.proportion_correct <- (proportion_correct - mean.proportion_correct)

## verification that is sums to 0
sum(deviation.proportion_correct)

deviation.product <- sum(deviation.time_at_bin * deviation.proportion_correct)

covariance <- deviation.product / deg.freedom


