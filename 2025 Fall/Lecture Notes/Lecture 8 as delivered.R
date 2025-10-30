## Lecture 6

## Covariance and Standardization

## Load a data set
## Correlate hours of sleep with hours of exercise
## Tianna's hypothesis: "The more you exercise, the better the sleep" (due to better physiological state / circadian rhythm etc)
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Fall/Data/202510_2300_classdata.csv"
class.data <- read.csv(url)

## Select the variables of interest
## mentioned here for reference:
class.data$hrs.sleep.weekly
class.data$hrs.exercise.weekly

## Standardize the variables of interest
# z-score pseudocode: z = (raw score - mean score) / standard deviation

sleep.mean <- mean(class.data$hrs.sleep.weekly)
sleep.s <- sd(class.data$hrs.sleep.weekly)
sleep.z <- (class.data$hrs.sleep.weekly - sleep.mean) / sleep.s
# diagnostic for sleep.z: it should be a vector of values; should have positive and negative values; most values should be close to 0
# The built-in function to generate z-scores: 
scale(class.data$hrs.sleep.weekly) ## for verification purpose only
## scale() converts raw scores into z-scores
## do this manually for take-home 2, but use scale() as a verification

exercise.mean <- mean(class.data$hrs.exercise.weekly)
exercise.s <- sd(class.data$hrs.exercise.weekly)
exercise.z <- (class.data$hrs.exercise.weekly - exercise.mean) / exercise.s
scale(class.data$hrs.exercise.weekly)

## Compute their covariance
## pseudocode covariance = sum((x.raw - x.mean)(y.raw - y.mean)/df)
## You can run this calculation on the raw scores ==> Covariance
## You can run this calculation on the z-scores ==> Correlation
## Correlation coefficient is simply standardized covariance

## On the z-score
deg.free <- nrow(class.data) - 1
## nrow() counts the number of rows in a data frame (do not specify a column name / variable)

deviation.sleep <- sleep.z - 0
deviation.exercise <- exercise.z - 0
z.covariance <- sum((sleep.z * exercise.z) / deg.free)

## we have an indication of no relationship between sleep and exercise, but!
## perhaps it's a nonlinear relationship?
## it's worthwhile to generate a scatterplot to see what it is like visually: 

plot(sleep.z, exercise.z)


