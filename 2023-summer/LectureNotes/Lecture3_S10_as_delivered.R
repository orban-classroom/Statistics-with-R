library("lsr") ## loading external library, gives you the ability to use new functions
# R has thousands of libraries for various purposes
# The lsr library was written by the textbook author to include functions used in the textbook
# before loading a library, you have to install it: install.packages("lsr")

# Lecture 3, S10

# Our data set
examdata <- c(95.57, 74.91, 90, 74.16, 59.02, 80.67, 81.58, 82.39, 0, 81.93, 81.84, 88.9, 0, 76.33, 66.68, 75.87, 96.96, 77.44, 69.46, 90.82, 85.87, 94.71, 84.25, 62.26, 45.84, 72.21, 67.44, 86, 90.5, 96.69, 76.17, 96.41, 37.53, 119, 97, 57.64, 89.79, 77.01, 79.62, 76.92, 71.35, 41.57, 45.95, 86.92, 46.08, 74.2, 47.31, 98, 106.76, 0, 74.31, 51.79, 0, 100.29, 108.69, 77.51, 64.62, 93.69, 62.87, 0)

# Mean (balance point of a fulcrum)
sumExamData <- sum(examdata)
n <- length(examdata)
meanExamData <- sumExamData / n

# Median (half-way point)
median(examdata)

# Manual method
sortedExamData <- sort(examdata)
table(sortedExamData)
sortedExamData[3]
sortedExamData[(n/2)-1] # works if you have an add number of values

# For odd sample size
sortedExamData[(n/2)]

# For even sample size
manualMedian <- (
    sortedExamData[ n / 2 ] + 
    sortedExamData[ n / 2 + 1 ]
  ) / 2

# If you have an even number of values, take the mean of the two middle values

# Mode (most frequencyt value)

# Smooth the data
roundedExamData <- round(examdata, -1)
modeExamData <- modeOf(roundedExamData)
rawModeExamData <- modeOf(examdata)

# Variability

# Minimum & Maximum values

minValue <- min(examdata)
maxValue <- max(examdata)

# Range of data

rangeMethodOne <- range(examdata)

rangeMethodOne <- maxValue - minValue

# IQR - inter-quartile range

IQR(examdata)

# Box Plot
boxplot(examdata)
# thick black line: median (half way point)
# bottom of the box: Q1
# top of the box: Q3
# the size of the box is where 50% of your data (you want the box to be small)
# bottom whisker (and dotted line): Q1 - 1.5 standard deviations)
# top whiskter and dotted line): Q3 + 1.5 standard deviations
# dots outside of the whiskers: outliers, extreme data points

