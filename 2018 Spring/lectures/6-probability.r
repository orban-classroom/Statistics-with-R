
## In-class Exercise for Lecture 6
## Probabilities

# Let's start with a simple dataset:
data = c(1,1,2,3,3,4,4,4,5,6)

# There are ways to extract different values from the data
# Let's say, I would like to know the value in the 5th position in the list:

data[5]

# will output 3. Note that a square bracket is used here in stead of a regular one.
# Let's say I want to find values from 2 through 10:

data[2:9]

# will output 1,2,3,3,4,4,4,5

# Similarly to how we calculated sample size, it is also possible to count the 
# number of values in the output of these sub-selects:

length(data[2:9])

# will output 8
# It is also possible use other operators to select a sub-set of values based on a rule:
# For example, I'd like to see all values greater than 4

data[data>4]

# These are all the operators that you can use
# <  	>   <=    >=    !=    ==
# smaller than; greater than; smaller than and equal to; greater than and equal to; not equal; equal
# Note the double equal sign when checking for values that match a criterion. Single equal symbols are used to assign variables

# Total number of outcomes classified as A
classifiedA = length(data[data>4])

# Total number of possible outcomes
totalOutcomes = length(data)

# probability of A, in proportion format
A = numerator/totalOutcomes

# probability of A, in percentage
A*100

# Quiz 1: what is the probability of picking a 4 from this dataset?
length(data[data==4])/length(data)*100

# Quiz 2: what is the probability of picking a non-4 (anything but 4) from this dataset?
length(data[data!=4])/length(data)*100

# What is the tenth value in the data set?
data[10]

# I want to see values 2nd through the 10th
data[2:10]

## Normal curves
# Lookup the proportion for particular z-scores. 
# Look up the proportion under the body "lower tail" for z = 0.00 (i.e., the mean)
pnorm(0)

# Look up the lower tail proportion for z = 0.34
pnorm(0.34)

# Look up the proportion in the upper tail for z = 0.34
# Method 1
1-pnorm(0.34)

# Method 2
pnorm(0.34, lower.tail=FALSE)

# *** Do not use both methods in labs and on exams. Pick one! ***

# Look up the proportion between the mean and the z-score for z = 0.34
pnorm(0.34)-pnorm(0)

# Sometimes we will deal with standardized scores that do not have a mean of 0 and a sd of 1.
# Example: SAT score, with a mean of 500 and sd of 100. 
# What is the area under the lower tail (body) for score 700?
pnorm(700, mean=500, sd=100)

# What is th earea under the upper tail for score 700?
# Method 1
1-pnorm(700, mean=500, sd=100)

# Method 2
pnorm(700, mean=500, sd=100, lower.tail=FALSE)

# Observation
# The proportion under the upper tail of z = +1.00 is identical to the proportion under the lower tail of z = -1.00
pnorm(-1)
1-pnorm(1)
