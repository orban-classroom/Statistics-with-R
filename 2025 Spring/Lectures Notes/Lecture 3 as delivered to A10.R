library(lsr)

## Lecture 3 as delivered to A10

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/202510_2300_classdata.csv"
class_Data <- read.csv(data_link)

## Tasks
## Figure out this thing about central tendencies
## Get a glimpse into the data using a histogram
## Make some rough visual judgements about whether the mean, the median or the mode is going to work best for this data
## Calculation of the mean
## Calculation of the median
## Calculation of the mode

## Histogram
hist(
  class_data$hrs.work.weekly, 
  main = "Histogram of Hours of Work", 
  col = "darkgreen",
  xlab = "Amount of Work (Hours)",
  border = "white", 
  labels = T,
  ylim = c(0,40)
  )
?hist

## What is the mean of this data set?

## Method 1: The manual way where you execute each mathematical computation in the formula
## Formula: mean = sum of all scores / count of all scores

class_data$hrs.work.weekly

sum_of_scores <- sum(class_data$hrs.work.weekly)
count_of_scores <- length(class_data$hrs.work.weekly)
number_of_rows <- nrow(class_data) ## Another, slightly shorter way of obtaining your sample size

work_mean <- sum_of_scores / count_of_scores

## Method 2: Super-fast way

fast_mean <- mean(class_data$hrs.work.weekly)

## Until you complete take-home 1, you must show me the mean caluclation using the manual way
## You can still use the fast mean to validate your answer
## After take-home exam 1, you can use just the fast mean for all calculations. 

## What is the median in this data set?
## Formula: count to the half way point of the data set

class_data$hrs.work.weekly

sorted.data <- sort(class_data$hrs.work.weekly)

## Concept of subsetting or filtering the data using the [ ]

sorted.data[1] ## The value inside the square bracket filters the data according ot my needs
sorted.data[1:5] ## pick out the first 5 values in the variable

## How do we know the half way?

## If the data set is even, then we have to deal with two middle values. If the sample size is odd, it's easy to pick the middle value

count_of_scores / 2
(count_of_scores / 2) + 1

## Putting it together: 

middleValue1 <- sorted.data[count_of_scores / 2]
middleValue2 <- sorted.data[(count_of_scores / 2) + 1]

## On an even sample size, the last step is to take the mean of the middle values

mean(middleValue1, middleValue2)


## Fast Method: 
median(class_data$hrs.work.weekly)

## What is the mode?
## Most frequently occurring number

sorted.data
rle(sorted.data)
## rle: run length encoding - it counts how many times the same value occurs in a sequence

table(
  rle(
    sorted.data
    )
  )

## The mode of this data is 0 - occurring 27x


## Fast Way Mode
## mode() is not a good function - it does something entirely different
## there is no built in function for the calculation of the mode in R Base

## Step 1. Install the library (one time only step)
install.packages("lsr")

## Step 2: You need to load the library in every notebook that uses that external function
## Typicall, you load the library as the first line of your notebook

## Step 3: to use the function in your calculation
modeOf(class_data$hrs.work.weekly)
