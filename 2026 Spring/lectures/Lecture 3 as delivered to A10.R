# Lecture 2

## We need a data set: 
hours.of.screentime.per.week <- c(20, 14, 30, 35, 25, 30, 12, 14, 98, 55, 25, 30, 14, 21, 20, 10.5, 20, 28, 30, 14, 20, 14, 12, 25, 30, 42, 38, 30, 35, 25, 40, 50, 50, 55, 35, 42, 40, 20, 40, 40, 28, 28, 48, 20, 28, 30, 32, 89, 28, 30, 40, 50, 42, 25, 84, 28, 35, 45, 6, 30, 40, 42, 30, 15, 30, 21, 25, 42, 10, 28, 70, 21, 70, 20, 24, 77, 30, 20, 35, 70, 30, 25, 17, 6, 40, 20, 56, 21, 37, 28, 11, 25, 18, 30, 60, 28, 28, 13, 10, 35, 24, 29, 15, 20, 15, 25, 28, 50, 7, 40, 40, 30, 25, 22, 6, 56, 13, 28, 6, 4, 21, 50, 21, 50, 27, 5, 20, 19, 42, 50, 21, 30, 42, 126, 28, 10, 14, 30, 48, 20, 30, 14, 85, 40, 55, 21, 56, 50, 6, 35, 14, 42, 28, 25, 35, 105, 20, 42, 35, 45.5, 56, 50, 40, 35, 42, 56, 35, 42, 15, 35, 20, 30, 30, 15, 10, 20, 20, 90, 40, 35, 70, 50, 47, 30, 25, 70, 45, 21, 35, 15, 40, 20, 18, 15, 80, 52, 20, 20, 7.5, 21, 12, 60, 30, 28, 6)

## Mean
## Pseudocode: mean = sum of all the scores / count of all the scores
## How many scores: sample size -- n / N

## THis is the MANUAL WAY TO CALCULATE (Take-home 1)
sum.of.screentime <- sum(hours.of.screentime.per.week)
sum.of.screentime

n.screentime <- length(hours.of.screentime.per.week)
n.screentime

mean.screentime <- sum.of.screentime / n.screentime
mean.screentime

## Fast Way -- For now, use this as a double-check / verification of your manual calculation
## After Take-home 1 you can start using it as you main method of calc
mean(hours.of.screentime.per.week)

## Median
## Psuedocode: Median = the half way point in a sorted data

hours.of.screentime.per.week[2] ## Filtering data using the square bracket

sort(hours.of.screentime.per.week) ## orders it in ascending order

## Let's put these pieces together

sorted.screentime <- sort(hours.of.screentime.per.week)
sorted.screentime[1]

## We want to pick out the half way point! And I don't want to manually count out what that point is

ceiling(n.screentime/2) ## round up to the middle point

sorted.screentime[ceiling(n.screentime/2)]
## only true if your data has an **odd** number of observations
## If your sample size is **even** then you have a problem: you have two middle values

## In that case you have to pick out both middle values, and take their mean

even.screentime <- c(20, 14, 30, 35, 25, 30, 12, 14, 98, 55, 25, 30, 14, 21, 20, 10.5, 20, 28, 30, 14, 20, 14, 12, 25, 30, 42, 38, 30, 35, 25, 40, 50, 50, 55, 35, 42, 40, 20, 40, 40, 28, 28, 48, 20, 28, 30, 32, 89, 28, 30, 40, 50, 42, 25, 84, 28, 35, 45, 6, 30, 40, 42, 30, 15, 30, 21, 25, 42, 10, 28, 70, 21, 70, 20, 24, 77, 30, 20, 35, 70, 30, 25, 17, 6, 40, 20, 56, 21, 37, 28, 11, 25, 18, 30, 60, 28, 28, 13, 10, 35, 24, 29, 15, 20, 15, 25, 28, 50, 7, 40, 40, 30, 25, 22, 6, 56, 13, 28, 6, 4, 21, 50, 21, 50, 27, 5, 20, 19, 42, 50, 21, 30, 42, 126, 28, 10, 14, 30, 48, 20, 30, 14, 85, 40, 55, 21, 56, 50, 6, 35, 14, 42, 28, 25, 35, 105, 20, 42, 35, 45.5, 56, 50, 40, 35, 42, 56, 35, 42, 15, 35, 20, 30, 30, 15, 10, 20, 20, 90, 40, 35, 70, 50, 47, 30, 25, 70, 45, 21, 35, 15, 40, 20, 18, 15, 80, 52, 20, 20, 7.5, 21, 12, 60, 30, 28)
n.even.screentime <- length(even.screentime)

sorted.even.screentime <- sort(even.screentime)

## This is picking out the two middle points
sorted.even.screentime[n.even.screentime/2]
sorted.even.screentime[n.even.screentime/2+1]

## Throw the two values into a vector
middlepoints <- c(sorted.even.screentime[n.even.screentime/2], sorted.even.screentime[n.even.screentime/2+1])

mean(middlepoints) ## this is the median if you have an even sample size

## Fast Way (You can use this as a double-check in your Take-home 1, and use as primary solution after take-home 1)
median(hours.of.screentime.per.week)

## Mode
## The most frequently occurring score in the data set.
## The potential problem: you can have more than one


table(rle(sorted.screentime)) # rle: run length encoding, it counts the number of times a particular value repeats in a row

## Visual inspection of the table, I can see that the score 30 occurs 22 times, and that is the only value that occurs so many times. 
## Mode: 30

## The Mode using a extenrally loaded function

## How to install a new package inside R: 
install.packages("lsr") ## You only do this once. Do not repeat in other notebook

## You must load the library you want to use in every notebook:
library(lsr)
## inside lsr, I get access to a new function called modeOf -- upper O, not zero, but O as in Ooh Canada
modeOf(hours.of.screentime.per.week)

## There is a function called mode()
mode(hours.of.screentime.per.week)
## this is not good. does not compute the statistical mode of the data
?mode()

## Eye candy: 

hist(hours.of.screentime.per.week,
     ylim = c(0,70),
     breaks = 22
     )
## very common visualisation
## y-axis is always the count of a particular score
## bin size is different from what we used in our manual calculations
## breaks argument in hist() specifies how many pieces to break the overall data set into
## the higher the breaks, the samller the bin size

















