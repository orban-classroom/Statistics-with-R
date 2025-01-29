## Lecture 4 as delivered to A11

## Load the data
data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/202510_2300_classdata.csv"
psyc.data <- read.csv(data_link)

colnames(psyc.data)

psyc.data$hrs.sleep.weekly

## 6 steps as described in the slides
## Calculate the Mean

sum.of.sleep <- sum(psyc.data$hrs.sleep.weekly)
## diagnostic: a single value (not a list); it should proportionally representing a larger value than what's in your data

sample.size <- length(psyc.data$hrs.sleep.weekly)

## second method for sample size: 
sample.size.method2 <- nrow(psyc.data)

mean.sleep <- sum.of.sleep / sample.size

## Validation
mean(psyc.data$hrs.sleep.weekly)


## 2. Center the scores (calculate a deviation score from the mean)
## Another way to say it: find the distance measurement

centred.sleep.scores <- psyc.data$hrs.sleep.weekly - mean.sleep

## Verification: 
sum(centred.sleep.scores)
## this is effectively 0. 0.00000000000002557954

## Visualizing what we did: 

plot(psyc.data$hrs.sleep.weekly)
plot(centred.sleep.scores)
## Critically, the relationship of each score to one another does not change
## Only the scale - the y axis - shifted over to be centred around 0. 

## 3. Square the centred scores (i.e., square all deviation scores)

squared.scores <- centred.sleep.scores^2
## A vector containing only positive values

## 4. Sum the centred (aka deviation) & squared scores

sums.of.squares <- sum(squared.scores)

## 5. Divide the sum of centred (deviation) scores by sample size

variance <- sums.of.squares / sample.size

## Verification

var(psyc.data$hrs.sleep.weekly)
## why is this value slightly off????

## We invoke the concept of degrees of freedom: 
## - When sample sizes are small, the consequence of a mistake in your data is big
## df = n - 1 (sample size minus 1)
df <- sample.size - 1

the.real.variance <- sums.of.squares / df

## Take its square root

sd.sleep <- sqrt(the.real.variance)

## Verification
sd(psyc.data$hrs.sleep.weekly)


## Repeat these 6 steps for exercise
psyc.data$hrs.exercise.weekly

sum.ex <- sum(psyc.data$hrs.exercise.weekly)
sample.ex <- length(psyc.data$hrs.exercise.weekly)
mean.ex <- sum.ex / sample.ex
mean(psyc.data$hrs.exercise.weekly)

centred.ex <- psyc.data$hrs.exercise.weekly - mean.ex
sq.ex <- (centred.ex)^2
ss.ex <- sum(sq.ex)
df.ex <- sample.ex - 1

var.ex <- ss.ex / df.ex
var(psyc.data$hrs.exercise.weekly)

sd.ex <- sqrt(var.ex)
sd(psyc.data$hrs.exercise.weekly)  
  
  