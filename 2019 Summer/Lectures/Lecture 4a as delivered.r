hrs.Sleep <- c(7,2,9,7,4,8,6,7,7,7,8,7,6,7,8,9,6,7,7,4,8,7,6,8,8,5,8,0,7,6,8,7,5,5)
min.to.KPU <- c(30,5,20,70,40,25,35,120,30,15,7,25,80,20,25,15,40,15,90,90,10,15,5,5,15,5,40,15,20,20,20,30,15,30)

class.data <- data.frame(
  sleepytime = hrs.Sleep,
  commuting = min.to.KPU
)

## take a peak at the data - automatically top 6
## specify another value, comma separated
head(class.data)

## calculation of the mean

## super fast: calculated the mean of all variables at once
mean(class.data$sleepytime)
mean(class.data$commuting)


## extra super fast way
apply(class.data, 2, mean)


## the slow way
## "add everything" (all the scores) divide by the sample size (number of observations)

# sleepytime
sum.of.scores <- sum(class.data$sleepytime)
sum.of.scores
n <- length(class.data$sleepytime)
n
slow.mean <- sum.of.scores / n
slow.mean

# commuting
# okay to reuse the sample size calculation from earlier

df.mean <- sum(class.data$commuting)

slowest.mean <- df.mean / n
slowest.mean

## double check your work using the super fast or extra super fast ways

## MEDIAN
# super fast way
median(class.data$sleepytime)
median(class.data$commuting)

# extra super fast way
apply(class.data, 2, median)

## slow median
sorted.values <- sort(class.data$sleepytime)
# median is 7


sorted.values[n/2] ## pick out the value that is half the sample size

sort(class.data$commuting)
# count to the 17th value
# median is 20

## mode is the most frequently occurring value
# slow way

table(rle(sort(class.data$sleepytime)))
## rle: run length encoding: counts the number times the run of 
## the same value occurs

## variability

# min
min(class.data$sleepytime)

# max
max(class.data$sleepytime)

# range
range(class.data$sleepytime)


##
IQR(class.data$sleepytime)
?IQR

boxplot(class.data$sleepytime)
boxplot(class.data$commuting)

hist(class.data$sleepytime)
hist(class.data$commuting)

## scatter plot
plot(class.data$sleepytime, class.data$commuting)
# helps visually gauge the relationship between 2 variables

# variance
# Step 1: deviation scores (or I like to call it centered data)
deviation.scores <- class.data$sleepytime - mean(class.data$sleepytime)

## conceptual check, should give you zero
sum(deviation.scores)

# Step 2: squared deviation scores
# sum of squares
ss <- sum(deviation.scores^2)

# Step 3: variance
## sums of the squared deviation scores / sample size

var <- ss / n
std <- sqrt(var)
std

# # #

# 1. Calculate the mean

# calculate the sume of all scores
sum.sleepy <- sum(class.data$sleepytime)
n <- length(class.data$sleepytime)
mean.sleepy <- sum.sleepy/n

## double check my work
mean(class.data$sleepytime)

# 2. Calculate each deviation score from the mean

deviation.scores.sleepy <- class.data$sleepytime - mean.sleepy

## double check your work
## the output should be a list of scores, containing negative and positive values

# 3. Square each deviation score

squared.deviation.scores.sleepy <- deviation.scores.sleepy^2

## double check your work
## the output should be a list of positive values

# 4. Sum the squared deviation scorse
###  Also known as: Sum of Squares

ss.sleepy <- sum(squared.deviation.scores.sleepy)

## double check my work
## A single value that is positive

# 5. Variance: Divide the sum of deviation scores by the sample size

df <- n - 1

variance <- ss.sleepy / df

## double check: super fast way to calculate
var(class.data$sleepytime)
## NOT THE SAME -- if using n. Must use df for samples

# 6. Standard deviation: Take the square root

std.dev.sleepy <- sqrt(variance)

## double check: super fast way to calculate

sd(class.data$sleepytime)
## NOT THE SAME
