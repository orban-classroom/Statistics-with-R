## Lecture 4
## Variability

data.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/202610_2300_data.csv"
stats.data <- read.csv(data.url)

head(stats.data)
colnames(stats.data)
mean(stats.data$no.pets, na.rm = T)

## 1. Calculation of the mean (manually, just like it will be on the take-home exam)
## Hours of Sleep per week
## Sum of sleep hours
sum.sleep <- sum(stats.data$hrs.sleep.weekly)

## Sample size
## Option 1 using the familiar length()
length(stats.data) ## this tells me the width of the data frame - aka number of variables
length(stats.data$hrs.sleep.weekly)

## Option 2 a slightly short/easier/faster way
n.sleep <- nrow(stats.data)

## Mean, manually
mean.sleep <- sum.sleep / n.sleep

## Objective 2: Centre the scores (compute the deviation scores)
deviation.score.sleep <- stats.data$hrs.sleep.weekly - mean.sleep

## Prove that adding up raw deviation scores lands you with a 0
round(sum(deviation.score.sleep))

squared.deviation.score.sleep <- deviation.score.sleep^2
## All positive values, it's a list/vector of values

ss.sleep <- sum(squared.deviation.score.sleep)
## This should be a single, kinda large, positive value

## Imagine this is a population data
variance.sleep <- ss.sleep / n.sleep

## In reality, we have to think about this as a sample: 
df.sleep <- n.sleep - 1
variance.sample.sleep <- ss.sleep / df.sleep

## Fast Way (use only as verification)
var(stats.data$hrs.sleep.weekly)

## Standard Deviation
s.sleep <- sqrt(variance.sample.sleep)

## Fast Way (use only as verification)
sd(stats.data$hrs.sleep.weekly)
