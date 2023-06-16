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
scale(sleep)

caffeine.standardized <- caffeine.centered / caffeine.s
scale(caffeine)

plot(caffeine.standardized, sleep.standardized)
plot(caffeine, sleep)

# Built-in function

## Lecture 6

## Lesson 1 of the day: covariance is unstandardized measure of relationship
## The sign matters: + means positive direct relationship; - means negative inverse relationship

# correlation: r

r <- covariance / (caffeine.s * sleep.s)
# it's a weak positive / direct / linear relationship


## Lesson 2 of the day: correlations are highly sensitive to outliers

boxplot(sleep, caffeine)

# Let's try to remove the caffeine outliers

filtered.class.data <- class.data[class.data$cups.caffeine.weekly < 20, ]

# Super fast way to correlations

# Removing outliers from the caffeine variable
cor(filtered.class.data$hrs.sleep.weekly, filtered.class.data$cups.caffeine.weekly)
plot(filtered.class.data$hrs.sleep.weekly, filtered.class.data$cups.caffeine.weekly)

# The original correlation coefficient
cor(class.data$hrs.sleep.weekly, class.data$cups.caffeine.weekly)


# What happens if: you take the standardized data and compute the covariance of it?

## Ingredients: 
# sleep.standardized
# caffeine.standardized

## Compute the covariance
standardized.cross.product <- sleep.standardized * caffeine.standardized
standardized.covariance <- sum(standardized.cross.product) / (n-1)

r

## Lesson 3 of the day: Standardized covariance is equal to correlation coefficient


