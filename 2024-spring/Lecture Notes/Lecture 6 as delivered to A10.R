## Lecture 6


## Load Data
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv"
class.data <- read.csv(url)

## Variables to correlate
## 1. hrs.exercise.weekly
## 2. meals.eaten.weekly

colnames(class.data)

## Filter

combined.filter <- class.data[
  !is.na(class.data$meals.eaten.weekly), 
  c("hrs.exercise.weekly","meals.eaten.weekly")]

## Another way: 
combined.filter <- class.data[!is.na(class.data$meals.eaten.weekly), c(6,9)]
## specify columns by number

## optionally (turn the data frame into vectors): 
meals <- combined.filter$meals.eaten.weekly
exercise <- combined.filter$hrs.exercise.weekly

## Method 1 (as implemented last class)
## compute the variance
## standardize the variables
## compute covariance on the standardized variables

n <- nrow(combined.filter)
## If you use length() on a data frame, you will get its width, not its length. 
## In other words, you get a count of the variables, not the rows
length(combined.filter) ## this is not what you want

deg.free <- n - 1

## Calculation of means
meals.mean <- sum(combined.filter$meals.eaten.weekly) / n
exercise.mean <- sum(combined.filter$hrs.exercise.weekly) / n

## Calculation of deviation scores
meals.deviation <- combined.filter$meals.eaten.weekly - meals.mean
## Diagnostics
sum(meals.deviation)

exercise.deviation <- combined.filter$hrs.exercise.weekly - exercise.mean
## Diagnostics
sum(exercise.deviation)

## Variance
meals.ss <- sum(meals.deviation^2)
## Diagnostics
## Should be a single positive value

meals.var <- meals.ss / deg.free
## Verify
var(combined.filter$meals.eaten.weekly)

exercise.ss <- sum(exercise.deviation^2)

exercise.var <- exercise.ss / deg.free
## Verify
var(combined.filter$hrs.exercise.weekly)

## Compute standard deviation

meals.sd <- sqrt(meals.var)
exercise.sd <- sqrt(exercise.var)
## Verify
sd(combined.filter$meals.eaten.weekly)
sd(combined.filter$hrs.exercise.weekly)

## Standardize the variables

meals.z <- meals.deviation / meals.sd
## Verify
scale(combined.filter$meals.eaten.weekly)

exercise.z <- exercise.deviation / exercise.sd
## Verify
scale(combined.filter$hrs.exercise.weekly)

## Compute the correlation coefficient
## by calculating the covariance

std.covariance <- sum(meals.z * exercise.z) / deg.free
## Verify 1: 
cov(meals.z,exercise.z)

## Verify 2:
cor(combined.filter$meals.eaten.weekly, combined.filter$hrs.exercise.weekly)

## The Pearson's r correlation coefficient is -0.40
## In everyday language: Moderate inverse correlation, meaning more exercise, fewer meals

## Method 2 (new)
## compute the variance
## compute the covariance
## divide by standard deviation products
## This is described in your textbook, page 143
## Pseudocode: r = covariance / (sd1 x sd2)

unstd.covariance <- sum(meals.deviation*exercise.deviation)/deg.free
r <- unstd.covariance / (meals.sd * exercise.sd)

## Glimpse into the future: 
cor.test(combined.filter$hrs.exercise.weekly, combined.filter$meals.eaten.weekly)

## A quick problem to solve
## Open up your homework and the disgust sensitivty data file
## Compute the correlation coefficient between education + disgust sensitivty
## using any of the methods (except for the built-in functions)

url2 <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/disgustscale/Berger_and_Anaki_disgust_scale_2014_1_comma_delimited_cleaned.csv"
disgust.data <- read.csv(url2)

combined.filter2 <- disgust.data[ , c("Education", "Mean_general_ds")]

# Pre-reqs
n.dg <- nrow(combined.filter2)
deg.free.dg <- n.dg - 1
mean.edu <- sum(combined.filter2$Education) / n.dg
mean.dg <- sum(combined.filter2$Mean_general_ds) / n.dg

# Variance, standard deviation
deviation.edu <- combined.filter2$Education - mean.edu
deviation.dg <- combined.filter2$Mean_general_ds - mean.dg

variance.edu <- sum(deviation.edu^2)/deg.free.dg
variance.dg <- sum(deviation.dg^2)/deg.free.dg

sd.edu <- sqrt(variance.edu)
sd.dg <- sqrt(variance.dg)

covariation <- sum(deviation.dg*deviation.edu)/deg.free.dg

r <- covariation / (sd.edu*sd.dg)

## Interpretation: 
## Minimal relationship, nearly zero. No relationship between education level and disgust sensitivity. 

