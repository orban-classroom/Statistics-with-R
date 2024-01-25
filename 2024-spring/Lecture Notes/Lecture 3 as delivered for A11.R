# Lecture 3

# Load the data file
# 2300 classroom
url = "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv"
my.data.file <- read.csv(url)

## Glimpse into the data
head(my.data.file)
tail(my.data.file)
colnames(my.data.file)

# Find the sample size (how many participants contributed data here?)
n <- nrow(my.data.file)
n

## I am extracting a vector out of the dataframe
my.data.file$cups.caffeine.weekly

## Some visualizations

## Generate a scatterplot

plot(my.data.file$cups.caffeine.weekly)

## Generate a histogram

hist(my.data.file$cups.caffeine.weekly)

## Generate a boxplot

boxplot(my.data.file$cups.caffeine.weekly)

## Central Tendencies

## Mean
## Pseudocode: Mean = (Sum of Scores) / (Sample Size)

sum.coffee <- sum(my.data.file$cups.caffeine.weekly)

## Sample size has been calculated on line 14
## Do not recalculate! 
n

mean.coffee <- sum.coffee / n
mean.coffee  

## There is a super-fast, built-in, automatic way to calculated
mean(my.data.file$cups.caffeine.weekly)
## You can't use this function until after take-home exam 1
## You can only use this function to double check your work.
  
## Median
sorted.coffee <- sort(my.data.file$cups.caffeine.weekly)
sorted.coffee

# even number of observations: take the two middle values, and compute their mean
# odd number of observations: take the middle value

half.way <- sorted.coffee[n/2]   ## if you have an odd number of observations, this is your median
half.way.plus <- sorted.coffee[(n/2)+1]

## Even number of observations: Compute the mean of the middle values
median.coffee <- (half.way + half.way.plus) / 2 

## The built-in function for median
median(my.data.file$cups.caffeine.weekly)

## Mode
## Most frequently occurring value. 
## Histogram is helpful, but not decisive due to the bin size setting of the graphic

## Start off with the sorted values: 
sorted.coffee

## Run-length encoding: It counts the number of times a particular value repeats
rle(sorted.coffee)
## The mode is 7.

## This does not give you the answer you want!!
mode(my.data.file$cups.caffeine.weekly)
## This is used for something entirely different in R.

## R Base comes with a certain number of functions
## This can be extended with user generated libraries. There are 1000's of them!

## STEP 1: Install a package (you only need to do this once, while you have your R program)
install.packages("lsr")

## STEP 2: Load the library into your notebook (normally you do this in every notebook at the top of the page before using a function)
library(lsr)

## STEP 3: To use the function from the library
modeOf(my.data.file$cups.caffeine.weekly)
## The O is capitalized

## Concept of subsetting or filtering data

my.data.file[ <<row>> , <<column>> ]

## leaving it blank means no filter
my.data.file[ , ]

my.data.file[ ,"hrs.screentime.weekly"]
## equivalent to
my.data.file$hrs.screentime.weekly

colnames(my.data.file)


## this picks out the first 10 rows of screentime in a vector format
my.data.file[1:10,"hrs.screentime.weekly"]

my.data.file[my.data.file$hrs.work.weekly < 15,"cups.caffeine.weekly"]
my.data.file[my.data.file$hrs.work.weekly > 15,"cups.caffeine.weekly"]

## Light workers group
sum.light <- sum(my.data.file[my.data.file$hrs.work.weekly < 15,"cups.caffeine.weekly"])
n.light <- length(my.data.file[my.data.file$hrs.work.weekly < 15,"cups.caffeine.weekly"])
## do not use nrow if you're dealing with a vector. Use length() instead

## Heavy workers
sum.heavy <- sum(my.data.file[my.data.file$hrs.work.weekly > 15,"cups.caffeine.weekly"])
n.heavy <- length(my.data.file[my.data.file$hrs.work.weekly > 15,"cups.caffeine.weekly"])

mean.light <- sum.light / n.light
mean.heavy <- sum.heavy / n.heavy


