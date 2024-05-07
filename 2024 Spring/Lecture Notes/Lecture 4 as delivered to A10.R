## Lecture 4

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv"
class.data <- read.csv(url)

## To Do
## 1. Compute the Sums of Squares: SS
## 2. Compute the variance: var
## 3. Compute the Standard Deviation: s

## We will work with number of courses taken: "no.courses.taken"

## Sums of Squares
## Filter the data, drop NA's
filtered.data <- class.data[!is.na(class.data$no.courses.taken),"no.courses.taken"]

## The Mean
n <- length(filtered.data)
deg.free <- n-1
sum.filtered.data <- sum(filtered.data)

mean.courses.taken <- sum.filtered.data / n

## Verification using the built-in function
mean(class.data$no.courses.taken, na.rm = TRUE)

## Deviation scores (Centred scores)
## Need access to the filtered raw scores, and the mean we calculated
deviation.scores <- filtered.data -  mean.courses.taken
## this vector contains a bunch positive and negative vectors
## How do you know whether or not this is accurate, or whether you've made a mistake?
sum(deviation.scores)
## The sum should add up to 0 (or something very close)

## Square of deviation of scores

squared.deviation.scores <- deviation.scores^2
## This is still a vector of values (not a single value)
## All of these values are positive
## Values that were originally 1.0 or greater should be even bigger 

## Sum of the squared deviation scores

ss <- sum(squared.deviation.scores)

## Possible to do in one line
sum.squares <- sum((filtered.data - mean.courses.taken)^2)

## This should be a single positive large number
## Not a vector
## Never negative
## The scale of values is much bigger than the original scores

## Find the variance
## SS divide it by the degrees of freedom

var.courses.taken <- ss / deg.free

## Verify using the built-in function
var(class.data$no.courses.taken, na.rm = TRUE)
# It is some positive value
# On its own, it is *not* meaningful - meaning that you can't make any judgements about the data by looking

## Standard Deviation
## Bringing the scale of measurement back from its squared form, into the original scale of measurement

s.courses.taken <- sqrt(var.courses.taken)
# This in the original scale of measurement
# It's useful especially when you compare multiple groups of data

## Verify using the built-in function
sd(class.data$no.courses.taken, na.rm = TRUE)


## Filter the data for A10 and separately for A11
## Compute the standard deviation for each section
## Which section has the greater standard deviation?
## What does that even mean?


## A10
filtered.a10.data <- class.data[
  !is.na(class.data$no.courses.taken) & 
    class.data$Section == "A10",
  "no.courses.taken"
  ]

#mean, sample size, degrees of freedom, ss, var, s
n.a10 <- length(filtered.a10.data)
sum.a10 <- sum(filtered.a10.data)
mean.a10 <- sum.a10/n.a10
deg.free.a10 <- n.a10 - 1
ss.a10 <- sum((filtered.a10.data - mean.a10)^2)
var.a10 <- ss.a10/deg.free.a10
s.a10 <- sqrt(var.a10)

## A11
filtered.a11.data <- class.data[
  !is.na(class.data$no.courses.taken) &
    class.data$Section == "A11",
  "no.courses.taken"
]

#mean, sample size, degrees of freedom, ss, var, s
n.a11 <- length(filtered.a11.data)
sum.a11 <- sum(filtered.a11.data)
mean.a11 <- sum.a11 / n.a11
deg.free.a11 <- n.a11 - 1
ss.a11 <- sum((filtered.a11.data-mean.a11)^2)
var.a11 <- ss.a11 / deg.free.a11
s.a11 <- sqrt(var.a11)

# A10 Mean: 3.66, s = 0.97
# A11 Mean: 3.2, s = 1.13

## Let's imagine, using sample size instead of degrees of freedom
## We are imagining that our calculations are not biased
var.population.a10 <- ss.a10 / n.a10
var.population.a11 <- ss.a11 / n.a11

s.pop.a10 <- sqrt(var.population.a10)
s.pop.a11 <- sqrt(var.population.a11)


## Very rudimentary measures of variability
## The range: max - min value in a data set

minimum.courses.taken <- min(class.data$no.courses.taken, na.rm = TRUE)
maximum.courses.taken <- max(class.data$no.courses.taken, na.rm = TRUE)

range.courses.taken <- maximum.courses.taken - minimum.courses.taken

## built-in function: 
range(class.data$no.courses.taken, na.rm = TRUE)
