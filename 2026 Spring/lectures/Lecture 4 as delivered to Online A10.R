## Lecture 4 as delivered to A10 (Online)

data.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/studentmentalhealth.csv"
mental.health.data <- read.csv(data.url)

## What is the variability of BMI variable?
mental.health.data$BMI
head(mental.health.data$BMI)
colnames(mental.health.data)

## Mean
## Sum of BMI scores
sum.bmi <- sum(mental.health.data$BMI)

## Sample size
length(mental.health.data) ## looks like a legitimate number but it's wrong
  ## this answers the question of how many variables you have in your data frame

n.bmi <- length(mental.health.data$BMI) ## You need to specify a colum name if you want to use the length() for calculating sample size

n.bmi <- nrow(mental.health.data) ## counts the number of rows in your data frame

mean.bmi <- sum.bmi / n.bmi

## Let's verify the mean calculation
mean(mental.health.data$BMI)

## Deviation scores
## Pseudocode: deviation score = each raw score minus the mean

deviation.scores.bmi <- mental.health.data$BMI - mean.bmi
## Gauge whether or not you're on the right track: 
## You should see a list / vector of values. Some values should be positive, some negative
round(sum(deviation.scores.bmi)) ## one way to prove that deviation scores add up to 0 and this is why they are useless
## 9.663381e-13 = 0.00000000000009663381 >>> essentially 0

## Square of the deviation scores
squared.deviation.scores.bmi <- deviation.scores.bmi^2
## Gauge: still a list/vector of values and they are all positive values

## Sum of the deviation csores ** Sums of Squares SS
ss.bmi <- sum(squared.deviation.scores.bmi)
## it needs to be one positive value (not a list of values, not a negative value, and relatively large)

## Variance 
## variance divided by degrees of freedom
df.bmi <- n.bmi - 1
var.bmi <- ss.bmi / df.bmi

## Can be doublechecked: 
var(mental.health.data$BMI)

## Standard Deviation
## Square root of variance
s.bmi <- sqrt(var.bmi)

sd(mental.health.data$BMI)

## Rudimentary measures of variability
min(mental.health.data$BMI)
max(mental.health.data$BMI)
range(mental.health.data$BMI)
max(mental.health.data$BMI) - min(mental.health.data$BMI)
