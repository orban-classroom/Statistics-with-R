## Lecture 5

## Plan
## 1. Compute the covariance between two variables
## 2. Standardize those scores

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv"
class.data <- read.csv(url)

## Variables: hours of work and hours of study

colnames(class.data)

## Filter
## Problem to consider when filtering: we need complete pairs of observations in order to compute covariance
## If there is missing data on one variable, then the corresponding value on the other side also needs to be dropped
filtered.data <- class.data[!is.na(class.data$hrs.study.weekly),c("hrs.work.weekly","hrs.study.weekly")]

## filtered.data is still a dataframe and will act as such (using dollar sign to refer to column, using nrow() etc)

## Covariance
## Pseudocode: covariance = ((deviation score of work hours) x (deviation scores of study hours)) / (degrees of freedom)

## Deviation scores of work hours
work.n <- nrow(filtered.data)
work.mean <- sum(filtered.data$hrs.work.weekly) / work.n
work.deviation <- filtered.data$hrs.work.weekly - work.mean
## Diagnostics
## Sum to 0?
sum(work.deviation)


## Deviation scores of study hours
study.n ## we do not need to calculate this becaues it's the same as work.n... redundant
study.mean <- sum(filtered.data$hrs.study.weekly) / work.n
study.deviation <- filtered.data$hrs.study.weekly - study.mean
## Diagnostics
sum(study.deviation)

deg.free <- work.n - 1

covariance <- sum((work.deviation * study.deviation) / deg.free)
## Diagnostics
## a single value, that is positive or negative

## Interpretation
## A negative value means that it's a negative relationship
## The magnitude of the relationship cannot be judged from this number

## Verify 
cov(filtered.data$hrs.work.weekly, filtered.data$hrs.study.weekly)

## Standardization of the data
## Pseudocode: z-score = (deviation score) / (standard deviation)

## What do we need for the standard deviation??
## Sums of Squares and Variance

work.ss <- sum(work.deviation^2)
work.variance <- work.ss / deg.free
work.sd <- sqrt(work.variance)

## Verify
var(filtered.data$hrs.work.weekly)
sd(filtered.data$hrs.work.weekly)

work.z <- work.deviation / work.sd

# Verify
mean(work.z) ## does it have a mean of 0?
sd(work.z) ## does it have a standard deviation of 1?
scale(filtered.data$hrs.work.weekly)

study.ss <- sum(study.deviation^2)
study.var <- study.ss / deg.free
study.sd <- sqrt(study.var)

## Verify
var(filtered.data$hrs.study.weekly)
sd(filtered.data$hrs.study.weekly)

study.z <- study.deviation / study.sd
## Diagnostics
mean(study.z)
sd(study.z)

## Verify
scale(filtered.data$hrs.study.weekly)


## One more thing

## Let's compute the covariance of the standardized scores:
cov.standardized <- sum((work.z * study.z)) / deg.free

## Is this correlationship?
## Verify:
cor(filtered.data$hrs.work.weekly, filtered.data$hrs.study.weekly)

## Voila! Yes!!!

## Interpretation: 
## -1 - 0 is a negative correlation, -1 being a perfect inverse relationship
## 0: no relationship at all
## 0 - +1 is a positive correlation, +1 being a perfect direct relationship

## -0.18 is a moderate inverse relationship


