# Lecture 5
# Covariance, Standardization
install.packages("psych")
library(psych)


class.data <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-spring/data/2300data.csv")
head(class.data)
unique(class.data$Semester)

# Let's look at 2019-10 (2019 Spring semester)
spring.2019 <- class.data[class.data$Semester == 201910,]
hist(spring.2019$hrs.screentime.weekly, breaks = 10)
skew(spring.2019$hrs.screentime.weekly)
# strong positive skew
kurtosi(spring.2019$hrs.screentime.weekly)
# we want to see something around 3.0
# platykurtic

# Variance
spring.2019.sum <- sum(spring.2019$hrs.screentime.weekly)
spring.2019.n <- nrow(spring.2019)
spring.2019.mean <- spring.2019.sum / spring.2019.n
spring.2019.df <- spring.2019.n - 1

spring.2019.centered <- spring.2019$hrs.screentime.weekly - spring.2019.mean
spring.2019.ss <- sum(spring.2019.centered^2)
spring.2019.variance <- spring.2019.ss / spring.2019.df

# Let's look at 2023-10 (2023 Spring semester)
spring.2023 <- class.data[class.data$Semester == 202310,]
hist(spring.2023$hrs.screentime.weekly, breaks = 10)
skew(spring.2023$hrs.screentime.weekly)
# mild negative skew
kurtosi(spring.2023$hrs.screentime.weekly)
# we want to see something around 3.0
# leptokurtic

# Graph panel
par(mfrow = c(1,2))
  hist(spring.2019$hrs.screentime.weekly, breaks = 10)
  hist(spring.2023$hrs.screentime.weekly, breaks = 10)

# Variance
spring.2023.sum <- sum(spring.2023$hrs.screentime.weekly)
spring.2023.n <- nrow(spring.2023)
spring.2023.mean <- spring.2023.sum / spring.2023.n
spring.2023.df <- spring.2023.n - 1
  
spring.2023.centered <- spring.2023$hrs.screentime.weekly - spring.2023.mean
spring.2023.ss <- sum(spring.2023.centered^2)
spring.2023.variance <- spring.2023.ss / spring.2023.df

c(spring.2019.variance, spring.2023.variance)

# Covariance
# Are the two variable related to each other?
# Do they covary?

# Reuse part calculations as much as possible (because we want to be lazy)

# instead os Sums of Squares, we do a cross-product
cross.product <- spring.2019.centered*spring.2023.centered
# Lesson: the sample size must be the same across the two variables

# Question: How is work and screentime related to each other?

screentime <- class.data[ , "hrs.screentime.weekly"]
screentime.sum <- sum(screentime)
screentime.n <- length(screentime)
screentime.mean <- screentime.sum / screentime.n

work <- class.data[ , "hrs.work.weekly"]
work.sum <- sum(work)
work.n <- length(work)
work.mean <- work.sum / work.n

df <- work.n - 1

screentime.centered <- screentime - screentime.mean
work.centered <- work - work.mean

cross.product <- screentime.centered * work.centered

covariance <- sum(cross.product) / df
# kind of like an unstandardized correlation coefficient
# you can tell the direction of the relationship, but can't judge its magnitude


# Standardize the data
# centering + dividing by the standard deviation

par(mfrow = c(1,2))
  hist(screentime, breaks = 10)
  hist(work, breaks = 10)

# Screentime
screentime.centered

screentime.ss <- sum(screentime.centered^2)
screentime.var <- screentime.ss / df
screentime.s <- sqrt(screentime.var)

# Work
work.centered

work.ss <- sum(work.centered^2)
work.var <- work.ss / df
work.s <- sqrt(work.var)

standardized.screentime <- screentime.centered / screentime.s

# built-in function standardizes your data
scale(screentime)


standardized.work <- work.centered / work.s

par(mfrow = c(2,2))
    hist(screentime, breaks = 10)
    hist(standardized.screentime, breaks = 10, xlim = c(-2,4), ylim = c(0,25))
    hist(work, breaks = 10)
    hist(standardized.work, breaks = 10, xlim = c(-2,4), ylim = c(0,25))


