library(lsr)
## Lecture 3 as delivered to A11

## Extend the 2300 data set
## Load the extended data set
## Pick 1-2 variables of interest
## Generate a histogram of the variables of interest
## Calculate the mean, median and mode for the variables of interest
## Talk about whether the mean, median or mode are most appropriate for each of those variables

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/202510_2300_classdata.csv"
new_stats_data <- read.csv(data_link)

## Example, you can dump all values from a variable like so: 
new_stats_data$hrs.work.weekly

## Let's visualize this: 
hist(
  new_stats_data$hrs.work.weekly, 
  main = "Histogram of Weekly Work Hours", 
  sub = "Data collected from a PSYC 2300 class between 2019-2025",
  xlab = "Work (in hours)", 
  col = "#05eb87", 
  border = "white"
  )

## When you a histogram, you should think about the following: 
## Does it looks like a normal curve? (Really roughly speaking)
## If not, how does it deviate from a normal curve, visually?
## In this casE: 
## Lots of "extra" data points on the left side - seems excessive for a normal

## We can make judgements about which cetral tendency will work best: 
## A mean is very sensitive to outliers, in this case the left side scores near zero will pull the mean down
## The Median is going to be resilient against that issue
## The mode is also resilient to that issue

## The Mean
## The manual way (this is what you show during the exam and homework)

## Mean = sum of all the scores divided by the number of scores
## Pseudocode: m = sum / count

sum_of_scores <- sum(new_stats_data$hrs.work.weekly)
count_of_scores <- length(new_stats_data$hrs.work.weekly) ## remember to include the variable in this
count_of_scores_method2 <- nrow(new_stats_data) ## only the data frame is included here

mean_of_work <- sum_of_scores / count_of_scores

## in one line, without breaking out part calculations
work.mean. <- sum(new_stats_data$hrs.work.weekly) / length(new_stats_data$hrs.work.weekly)

## The super-fast built-in function method
## You can use this after exam 1. For now you should use it but only to validate your manual calcs

fast.mean <- mean(new_stats_data$hrs.work.weekly)

## Median = the half way point in the data set
new_stats_data$hrs.work.weekly

## Let's sort the data from from lowest to highest: 
sorted.data <- sort(new_stats_data$hrs.work.weekly)

## decide whether your sample size is even or odd. (1) find the mean of the two middle points if it's even or (2) find the middle point if it's odd

## The middle values for an even sample size data set are: 
count_of_scores / 2
# to display the score at the 89th position, you have to subsetting/filtering
middle_value1 <- sorted.data[count_of_scores / 2]

middle_value2 <- sorted.data[(count_of_scores / 2) + 1]

## We want to take the mean of the middle values
median_manual_way <- mean(middle_value1, middle_value2)

## A fast way to validate what you just calculated
fast_median <- median(new_stats_data$hrs.work.weekly)


## Mode: 
## Most frequent score in the data set. 
table(
  rle(
    sorted.data
    )
  )
## rle: run length encoding - counts how many times a particular occurs in a row

## Based on visual inspection of the rle table, we can see that the mode is 0

## It is possible for a data object to have more than one modes. 

## Fast way to calculate mode
# mode() does not do what you think it would do. Don't use

# There is no mode calculation built into R base
# We need to find and load an external library that has this calculation. 
# The textbook uses lsr and this library can be installed and loaded. 

## 1. You need install the library on your computer (this is a one time step)
install.packages("lsr")

## 2. I need to load the library so it's avaialble in my notebook. This has to be done in every notebook
## and you should do this as the first line of your code. 
## look on line 1

modeOf(new_stats_data$hrs.work.weekly)
