## R Lab Homework 3

## Follow these stylistic conventions
## 1. Have your own system of variable naming, and stick to it. I will be looking for consistency.
## 2. Use a single hashtag # for your comments. I will use ## for my comments.
## Use spaces carefully to organize your code. Make it readable. You can use hashtags to add headings and comments to your code.  


## Deadline May 30th, 2019, 11:55 pm

examdata <- data.frame(
  exam1 = c(95.57, 74.91, 90, 74.16, 59.02, 80.67, 81.58, 82.39, 0, 81.93, 81.84, 88.9, 0, 76.33, 66.68, 75.87, 96.96, 77.44, 69.46, 90.82, 85.87, 94.71, 84.25, 62.26, 45.84, 72.21, 67.44, 86, 90.5, 96.69, 76.17, 96.41, 37.53, 119, 97, 57.64, 89.79, 77.01, 79.62, 76.92, 71.35, 41.57, 45.95, 86.92, 46.08, 74.2, 47.31, 98, 106.76, 0, 74.31, 51.79, 0, 100.29, 108.69, 77.51, 64.62, 93.69, 62.87, 0),
  exam2 = c(56.88, 44.95, 59.63, 58.63, 0, 52.29, 56.97, 62.39, 51.38, 56.88, 60.1, 68.81, 0, 55.96, 39.45, 52.29, 83.49, 61.47, 60.55, 77.62, 46.79, 56.88, 61.47, 42.2, 65.14, 66.06, 63.3, 70.64, 60.55, 54.13, 76.15, 72.48, 43.12, 90.83, 72.48, 48.62, 62.39, 43.12, 56.88, 51.38, 50.46, 0, 30.28, 68.81, 28.44, 60.55, 60.55, 84.54, 72.48, 0, 41.28, 38.53, 0, 64.22, 86.24, 0, 0, 56.88, 0, 0)
)

examdata$exam1


## Compute the mean of each variable using the "slow way."

sum.of.scores <- sum(examdata$exam1)
n <- length(examdata$exam1)
n
mean.scores <- sum.of.scores/n
mean.scores



# do the other mean too

## Compute the mean of each variable either using the super fast or the extra super fast ways.

mean(examdata$exam1)
mean(examdata$exam2)

# extra super
apply(examdata, 2, mean)

## Compute the median of each of the two variables in the data frame using "slow way."

sorted.values.1 <- sort(examdata$exam1)
sorted.values.1
median1.slow <- sorted.values.1[n/2]
median1.slow

## Compute the median of each of the two variables in the data frame using "fast way."

median(examdata$exam1)

## Compute the mode of each of the two variables in the data frame using the only way we learned.

table(rle(sort(examdata$exam1)))
# mode is 0

## Generate a histogram for each of the variables, and describe their shape using concept from Chapter 5 (skewness, kurtosis, normality). 
## Add your comments as hashtags

hist(examdata$exam1, 
     breaks = 15,
     main = "My pretty title",
     xlab = "Exam 1 Scores",
     ylab = "FREQUENCY")

# In terms of skewness, mildly negative, or you could say it's roughly normal
# In terms of kurtosis, mildly leptokurtic
# somewhat normal bell curve

hist(examdata$exam2,
     breaks = 15,
     main = "Exam 2 data",
     xlab = "Exam 2 scores")


## Generate a boxplot for each of the variables

boxplot(examdata$exam1, examdata$exam2,
        main = "Boxplot of exam data",
        ylab = "Exam Scores")


Q1 <- quantile(examdata$exam1, .25)
Q2 <- quantile(examdata$exam1, .50)
Q3 <- quantile(examdata$exam1, .75)

Q3 - Q1
IQR(examdata$exam1)

sort(examdata$exam1)

Q2
median(examdata$exam1)


## Save your work as an R script file, and upload it to Moodle. 
