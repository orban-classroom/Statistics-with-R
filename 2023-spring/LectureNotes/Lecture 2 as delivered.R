1 + 1

my.happy.variable <- 2 #coded as an integer
my.sad.variable <- "two" #coded as a string or character
my.sour.variable <- "2" #coded as a string or character

my.vector <- c(2,1,4,3,2,1,2,4,4)

# What does the mean mean?
# We are looking for one number to capture a center of the "data cloud"
# one way is by computing the mean
# another way: Median
# third way: Mode 
# Central Tendencies - Mean, Median, Mode -- to get a sense of the shape of data

## MEAN

examdata <- c(95.57, 74.91, 90, 74.16, 59.02, 80.67, 81.58, 82.39, 0, 81.93, 81.84, 88.9, 0, 76.33, 66.68, 75.87, 96.96, 77.44, 69.46, 90.82, 85.87, 94.71, 84.25, 62.26, 45.84, 72.21, 67.44, 86, 90.5, 96.69, 76.17, 96.41, 37.53, 119, 97, 57.64, 89.79, 77.01, 79.62, 76.92, 71.35, 41.57, 45.95, 86.92, 46.08, 74.2, 47.31, 98, 106.76, 0, 74.31, 51.79, 0, 100.29, 108.69, 77.51, 64.62, 93.69, 62.87, 0)


## The slow but conceptually accurate way
## apply the formula

sumdata <- sum(examdata)
ndata <- length(examdata) # - n means sample size

meandata <- sumdata / ndata

## Super fast R way
mean(examdata)

## MEDIAN
## middle value of the dataset
## if your sample size is an odd value, then it's easy. Take the middle value
## if your sample size is even, then take the mean of the two middle values


## The Slow Way but conceptually accurate way

sort(examdata)

# when you use a square bracket aftera variable, you are "filtering" or "subselecting" from the original dataset

examdata[30] ## picks out the 30th value of the raw data set

sort(examdata)[30] ## picks out the 30th value of the sorted set

# How do we pick out the two middle values?

sort(examdata)[31]

(sort(examdata)[30] + sort(examdata)[31]) / 2

## Super fast R way

median(examdata)

## MODE
## The most frequent
## Is it possible to have more than one mode? YES

## The slow and conceptually accurate way
## Option 1: Produce a histogram
hist(examdata)
## mode is 80-100

## Decrease the bin size (or increase the breaks)
hist(examdata, breaks = 10)
## mode is 70-80

hist(examdata, breaks = 20)
## mode is 75-80

## Option 2 -- scrap this option
## generate a table using the table() function

# Next week, you'll learn how to do it with a built-in function called modeOf()
