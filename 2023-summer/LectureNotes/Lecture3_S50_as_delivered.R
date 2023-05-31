install.packages("lsr")

# Central Tendencies

examdata <- c(95.57, 74.91, 90, 74.16, 59.02, 80.67, 81.58, 82.39, 0, 81.93, 81.84, 88.9, 0, 76.33, 66.68, 75.87, 96.96, 77.44, 69.46, 90.82, 85.87, 94.71, 84.25, 62.26, 45.84, 72.21, 67.44, 86, 90.5, 96.69, 76.17, 96.41, 37.53, 119, 97, 57.64, 89.79, 77.01, 79.62, 76.92, 71.35, 41.57, 45.95, 86.92, 46.08, 74.2, 47.31, 98, 106.76, 0, 74.31, 51.79, 0, 100.29, 108.69, 77.51, 64.62, 93.69, 62.87, 0)

# Mean
# The slow but conceptual way
sum_exam <- sum(examdata)
n <- length(examdata)
mean_exam <- sum_exam / n

# The fast way
mean(examdata)

# Median
rounded_exam <- round(examdata, 0)
sort(rounded_exam)
table(rounded_exam)
## Method 1: count manually to the half point of your data

## Method 2: Subset your data to the half way point
## Works if you have an odd number of values
rounded_exam[30]

# The fast way
median(examdata)


# Mode

# The visual way
hist(examdata)
hist(examdata, breaks = 10)

# The manual way
rounded_exam <- round(examdata, 0)
table(rounded_exam)

# The fast way
library("lsr")
modeOf(examdata)
## The problem with this specific function is that it does not "bin" the data automatically

## Feel free to construct your own function

## Variability
## How spread out is your data

# Min & Max values

min_exam <- min(examdata)
max_exam <- max(examdata)

# Range - what is the "data-span"?

range(examdata)
range_exam <- max_exam - min_exam

# Standard Deviation
# this number is representing every data point in your data file

hist(round(examdata, -1), 10)









