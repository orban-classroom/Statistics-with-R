examdata <- data.frame(
  exam1 = c(95.57, 74.91, 90, 74.16, 59.02, 80.67, 81.58, 82.39, 0, 81.93, 81.84, 88.9, 0, 76.33, 66.68, 75.87, 96.96, 77.44, 69.46, 90.82, 85.87, 94.71, 84.25, 62.26, 45.84, 72.21, 67.44, 86, 90.5, 96.69, 76.17, 96.41, 37.53, 119, 97, 57.64, 89.79, 77.01, 79.62, 76.92, 71.35, 41.57, 45.95, 86.92, 46.08, 74.2, 47.31, 98, 106.76, 0, 74.31, 51.79, 0, 100.29, 108.69, 77.51, 64.62, 93.69, 62.87, 0),
  exam2 = c(56.88, 44.95, 59.63, 58.63, 0, 52.29, 56.97, 62.39, 51.38, 56.88, 60.1, 68.81, 0, 55.96, 39.45, 52.29, 83.49, 61.47, 60.55, 77.62, 46.79, 56.88, 61.47, 42.2, 65.14, 66.06, 63.3, 70.64, 60.55, 54.13, 76.15, 72.48, 43.12, 90.83, 72.48, 48.62, 62.39, 43.12, 56.88, 51.38, 50.46, 0, 30.28, 68.81, 28.44, 60.55, 60.55, 84.54, 72.48, 0, 41.28, 38.53, 0, 64.22, 86.24, 0, 0, 56.88, 0, 0)
)

boxplot(examdata$exam1,examdata$exam2, names = c("exam 1", "exam 2"))

# calculate the mean

sum.exam1 <- sum(examdata$exam1)
n <- length(examdata$exam1)
mean.exam1 <- sum.exam1 / n
## double check work: 
mean(examdata$exam1)

# centered data: calculate each deviation scores from the mean
cc.exam1 <- examdata$exam1 - mean.exam1
# double check work: 
# should be: list of values
# should be: positive and negative values
# sum should be zero or a very small value
sum(cc.exam1)

# square each deviation score
sscores.exam1 <- cc.exam1^2
# double check: 
# should be: all positive
# should be: a list of values

# SS: sums of squares: sum the squared deviation scores
ss.exam1 <- sum(sscores.exam1)
# double-check
# should be: a single value
# should be: positive


# variance; divide the sum of deviation scores by the degrees of freedom
df <- n - 1

var.exam1 <- ss.exam1/df

## double check 
var(examdata$exam1)

# standard deviation: take the square root

std.dev.exam1 <- sqrt(var.exam1)

## doublecheck: 
sd(examdata$exam1)
