## Lecture 4 as delivered

## How to invoke the help document (in the lower right in R Studio)
?mean

## How to install a package on a KPU PC
install.packages("lsr","C://Users/firstname/My Documents")
## When you run the code above, R may prompt to about using your own personal library, click yes
## Load the library

## on your own computer
install.packages("lsr")

library(lsr)


## Load the data
var1 <- c(45,49,46,48,49,42,50,42,20,50,49,56,49,40,56,42,45,49,50,56,46,56,35,38,56,56,53,40,42,50)
var2 <- c(6,10,14,5,1,0,2,6,2,8,2,10,6,6,14,0,28,7,21,21,16,2,8,4,6,0,9,4,5,2)
var3 <- c(3, 0, 2.5, 2, 3, 15, 4, 4, 4,0, 2, 10, 3, 21, 4, 10.5, 5, 0, 10, 10, 3, 10, 10, 6, 7, 4, 3, 10, 3, 5)
var4 <- c(21, 15, 15, 22, 10, 32, 12, 6.5, 24, 40, 12, 16, 24, 4, 39, 20, 20, 40, 25, 15, 16, 24, 27, 35, 28, 17, 27, 25, 24, 25)
var5 <- c(20, 14, 30, 35, 25, 30, 12, 14, 98, 55, 25, 30, 14, 21, 20, 10.5, 20, 28, 30, 14, 20, 14, 12, 25, 30, 42, 38, 30, 35, 25)

data <- data.frame(
  hrs.sleep.weekly = var1,
  cups.caffeine.weekly = var2,
  hrs.exercise.weekly = var3,
  hrs.work.weekly = var4,
  hrs.screentime.weekly = var5
)

## use lsr version of the mode calculation
## modeOf function
modeOf(data$hrs.exercise.weekly)

## compute the mode of all other variables


n <- length(data$hrs.sleep.weekly)
mymean <- sum(data$hrs.sleep.weekly)/n

## creating a scatter plot
plot(
  data$hrs.sleep.weekly,
  data$cups.caffeine.weekly,
  main = "Relationship between caffeine and sleep",
  sub = "Data source is a class of 35 during the 2019 Spring semester",
  xlab = "Weekly Sleep (hours)",
  ylab = "Weekly Caffeine (cups)"
  )

## Minima and maxima of these variables
sleep.min <- min(data$hrs.sleep.weekly)
sleep.max <- max(data$hrs.sleep.weekly)
sleep.max
sleep.min

caffeine.min <- min(data$cups.caffeine.weekly)
caffeine.max <- max(data$cups.caffeine.weekly)
caffeine.max
caffeine.min

sleep.range <- range(data$hrs.sleep.weekly)
caffeine.range <- range(data$cups.caffeine.weekly)
sleep.range

## quantiles

## 50th quantile of the data / 50th percentile
sleep.median <- median(data$hrs.sleep.weekly)

quantile(data$hrs.sleep.weekly, probs = .30)
quantile(data$hrs.sleep.weekly, probs = .50)

## where is most of the data (body of the distribution)?
quantile(data$hrs.sleep.weekly, probs = c(0.25,0.75))

## inter quantile range
IQR(data$hrs.sleep.weekly)

##
## "centering the data"
## "removing the mean" 
## "computaton the deviation values"

work.mean <- sum(data$hrs.work.weekly)/n
work.mean ## the mean should be a single number

centered <- data$hrs.work.weekly - work.mean
centered ## should be a list of numbers

## the sum of deviation scores is 0
round(sum(centered)) ## should be 0

## squared values
sqd <- centered^2 ## list of numbers

## sums of squares
ss <- sum(sqd)  ## single number
ss

## mean squared deviations
msqd <- ss/n  ## single number

# New fashioned way
var(data$hrs.work.weekly)

# degrees of freedom
df <- n-1  ## single value

##
## VARIANCE
##
real.msqd <- ss/df    ## single number
real.msqd

##
## STANDARD DEVIATION
##
stdev.work <- sqrt(real.msqd)    ## single number

# new fasioned way
sd(data$hrs.work.weekly)

####### ANOTHER VARIABLE
mean.screen <- sum(data$hrs.screentime.weekly)/n
centered.screen <- data$hrs.screentime.weekly - mean.screen
sqd.screen <- centered.screen^2
ss.screen <- sum(sqd.screen)
variance.screen <- ss.screen/df
stdev.screen <- sqrt(variance.screen)

##
## Correlation
##

covariance <- sum(centered * centered.screen) / df
r <- covariance / (stdev.work * stdev.screen)
r

# New fashioned way
cor(data$hrs.work.weekly,data$hrs.screentime.weekly)

