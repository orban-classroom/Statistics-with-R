# Lecture 5

# PSYC 2300 Stats Data

class.data <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-summer/Data/2300data.csv")

# sleep + coffee
# predicting a inverse relationship (as one goes up, the other goes down)

# Option 1
class.data$hrs.sleep.weekly # measurement in hours
class.data$cups.caffeine.weekly # measurement in cups

# Option 2
sleep <- class.data[ ,"hrs.sleep.weekly"]
caffeine <- class.data[ ,"cups.caffeine.weekly"]

## Variance for each of the variables

# Sleep
n <- nrow(class.data)
sleep.mean <- sum(sleep) / n

sleep.centered <- sleep - sleep.mean
sleep.ss <- sum(sleep.centered*sleep.centered)
sleep.variance <- sleep.ss / (n-1)
sleep.s <- sqrt(sleep.variance)

# Caffeine
caffeine.mean <- sum(caffeine) / n

caffeine.centered <- caffeine - caffeine.mean
caffeine.ss <- sum(caffeine.centered*caffeine.centered)
caffeine.variance <- caffeine.ss / (n-1)
caffeine.s <- sqrt(caffeine.variance)

# Covariance of Sleep x Caffeine

cross.product <- caffeine.centered*sleep.centered
covariance <- sum(cross.product) / (n-1)
# Unstandardized metric
# The magnitude cannot be judge
# You can judge the direction of the relationship

# Scatterplot


## Standardization
## 1: making the mean equal to zero
## 2: making the standard deviation equal to one


sleep.standardized <- sleep.centered / sleep.s

caffeine.centered <- caffeine.centered / caffeine.s

plot(caffeine.centered, sleep.standardized)
plot(caffeine, sleep)

# Built-in function
scale(sleep)
scale(caffeine)

