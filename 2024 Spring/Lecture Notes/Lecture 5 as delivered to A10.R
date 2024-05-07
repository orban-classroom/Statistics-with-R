## Lecture 5

## Plan
## Figure out covariance
## Figure out standardization

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv"
class.data <- read.csv(url)

head(class.data)

## Sleep & Screentime

sleep.data <- class.data[,"hrs.sleep.weekly"]
screen.data <- class.data[,"hrs.screentime.weekly"]

## Pseudocode for covariance
## covariance = ( deviation scores of sleep ) * (deviation scores of screentime) / (degrees of freedom)

sleep.n <- length(sleep.data)
sleep.deg.free <- sleep.n - 1
sleep.mean <- sum(sleep.data) / sleep.n
sleep.deviation <- sleep.data - sleep.mean

# Diagnostics
sum(sleep.deviation)
# checks out

screen.n <- length(screen.data)
screen.deg.free <- screen.n - 1
screen.mean <- sum(screen.data) / screen.n
screen.deviation <- screen.data - screen.mean

# Diagnostics
sum(screen.deviation)
# Checks out

covariance <- sum(sleep.deviation * screen.deviation) / sleep.deg.free
## Diagnostics
## The result should be a single value. If it's a vector, maybe you forgot to sum the deviation product

## Verification
cov(sleep.data, screen.data)

## What can you conclude?
## If it's a negative value, it's indicative of a negative relationship
## Magnitude cannot be judged because neither of the variables are standardized

## Standardize the values
## z-score = deviation scores / standard deviation

## Already have deviation scores. We are missing the standard deviation

## Let's compute the standard deviation for each of the variables

sleep.ss <- sum(sleep.deviation^2)
sleep.var <- sleep.ss / sleep.deg.free
sleep.sd <- sqrt(sleep.var)
# Diagnostics
sd(sleep.data)

screen.ss <- sum(screen.deviation^2)
screen.var <- screen.ss / screen.deg.free
screen.sd <- sqrt(screen.var)
# Diagnostics
sd(screen.data)

## Standard scores
sleep.z <- sleep.deviation / sleep.sd
# Diagnostics
# The output should be a vector containing positive and negative values that are small (mostly <3)


screen.z <- screen.deviation / screen.sd

# Verification of a z-score
mean(screen.z)
sd(screen.z)

# If I calculate the covariance of the z-scores, what do I get?
cov(sleep.z,screen.z)

# Correlation coefficient
cor(class.data$hrs.sleep.weekly, class.data$hrs.screentime.weekly)



