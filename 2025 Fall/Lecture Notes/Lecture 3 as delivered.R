## Lecture 3 as delivered

## DESCRIPTIVE STATISTICS
## CENTRAL TENDENCIES: MEAN, MEDIAN and the MODE

exam.data <- c(95.57, 74.91, 90, 74.16, 59.02, 80.67, 81.58, 82.39, 0, 81.93, 81.84, 88.9, 0, 76.33, 66.68, 75.87, 96.96, 77.44, 69.46, 90.82, 85.87, 94.71, 84.25, 62.26, 45.84, 72.21, 67.44, 86, 90.5, 96.69, 76.17, 96.41, 37.53, 119, 97, 57.64, 89.79, 77.01, 79.62, 76.92, 71.35, 41.57, 45.95, 86.92, 46.08, 74.2, 47.31, 98, 106.76, 0, 74.31, 51.79, 0, 100.29, 108.69, 77.51, 64.62, 93.69, 62.87, 0)

class(exam.data)
head(exam.data)

## Sample Size (n)
n <- length(exam.data)

## 1. MEAN = AVERAGE
## Pseudocode: Mean = (summing up all the scores) / (sample size -- count of all the scores)

sum.exam.data <- sum(exam.data) ## (95.57 + 74.91 + 90 .... and so on and so far)

## Manually Calculation (Required for Take-Home Exam 1)
mean.exam.data <- sum.exam.data / n
mean.exam.data

## Superfast way (For Take-Home Exam 2, this is okay -- and for your life after that)
mean(exam.data)

## 2. MEDIAN
sorted.data <- sort(exam.data)
sorted.data

## How do we pick out values from a vector?

## Manually filter/picking of a value (illustration purposes, never do it this way xxxx)
sorted.data[30] ## filter, subset, picking

## How do I calculate the middle point given that I know the sample size?
## For an odd number in the sample size: 
half.way.odd <- n / 2
middle.point <- sorted.data[half.way.odd]
## Calculating it based on the code avove is wrong for this data set because n = even number of observations

## Technically correct:
half.way.even <- n / 2
## Plus the value after it :
half.way.even.plus.one <- (n / 2) + 1

middle.points <- sorted.data[
  c(half.way.even,half.way.even.plus.one)
  ]

mean.of.halves <- mean(middle.points)

## Superfast way (after Take-Home 1)
median(exam.data)

## MODE
## The Most frequently occurring value

## This is a data binning strategy (put similar values into one bucket so we can count their frequency)
table(
  cut(exam.data, breaks = 6)
  )
 ## in the cut() function, breaks creates number of bins equal the breaks argument
 ## number of bins = breaks

## Visualization
hist(exam.data, breaks = 5)
 ## in the hist() function, breaks creates number of divisions equal to the breaks argument
 ## number of bins = breaks + 1

mode() ## Do not use, it will not answer your question

## Caveat, "There is lies, damn lies and there is statitics"

hist(exam.data, breaks = 10)

hist(exam.data, breaks = 20)

## How to dress up a histogram properly: 

hist(exam.data, 
     breaks = 10,
     main = "PSYC 1100 Exam Performance", 
     sub = "Student Performance out of 120", 
     xlab = "Exam Score Bins", 
     ylim = c(0,15), 
     col = "blue", 
     border = "white")
