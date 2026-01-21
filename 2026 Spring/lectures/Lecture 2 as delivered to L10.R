## Lecture 2

## Central Tendencies

## Find some data
some.variable <- c(240,240,240,260,280,280,290,300,300,300,
                   310,310,330,350)

some.variable.thats.even <- c(240,240,260,280,280,290,300,300,300,
                   310,310,330)

## Mean calculation
## What is the pseudocode for the mean?
## Mean = find the sum of all the data / the number of data point

## The Slow and Manual Calculation
sum.some.variable <- sum(some.variable)
sample.size <- length(some.variable)
mean.some.variable <- sum.some.variable / sample.size

## The Fast Way (Normal Way)
mean(some.variable)

## Median calculation
## We take the half way in the data: 
## We need to know the sample size, and count to half the sample size 
## and find the value at that location

## IF the sample size is odd (eg 13, 201, 1009) there is a true middle - so take the middle value
## If the sample size is even (eg, 10, 12, 200, 1010), there is NO true middle value -- take the two middle values and find its mean
sample.size

# Sort the data
sorted.some.variable <- sort(some.variable)

## Calculate based on odd number of values
sorted.some.variable[ceiling(sample.size/2)]

ceiling(sample.size/2)

sample.size/2

## Fast median is applied to the original data set as entered / messy
median(some.variable)

## What if the sample size was even?
## I need to take the two middle points and calculate their average/mean
sample.size.new <- length(some.variable.thats.even)

first_middle <- sample.size.new/2
second_middle <- sample.size.new/2+1

## Test that my two middle points are picked out correctly
some.variable.thats.even[first_middle]
some.variable.thats.even[second_middle]

## Put this middle point definition into a list
middlepoints <- c(some.variable.thats.even[first_middle], 
                  some.variable.thats.even[second_middle])

## Calculate the mean of the two middle points
mean(middlepoints)

## Fast Median
median(some.variable.thats.even)


## Mode calculation
## The most frequently occurring value in the data set
## Trick: you can more than one of them

table(
    rle(
      sort(some.variable)
    )
  )

some.variable

## The mode function does not calculate the statistical mode of the dataset
mode(some.variable)
## The mode is not implemented in R Base

## Let's learn to install libraries/packages
## lsr
install.packages("lsr")

## Then, load the library into any notebook where you want to use the functions
library(lsr)
modeOf(some.variable)
#modeOf is the name of the function, note the upper case "O" like Oooh Canada


