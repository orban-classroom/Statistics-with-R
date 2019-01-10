# An R function is invoked by its name, then followed by the parenthesis, and zero or more arguments. The following applies the function c to combine three numberic values into a vector.
y = c(1,2,3)

# Vectors can contain string values too
colours = c("red","yellow","blue")


# Text after the hastag sign within the samel line is considered a comment: 
1 + 1   # this is a comment

## Data Types
# Numerics
k = 1
k
class(k)    # prints the class name of k, "numeric"
is.integer(k)  # is k an integer?

y = as.integer(1) 
y           # prints the value of y
class(y)    # prints the class name of y, "integer"

as.integer("3.45")   # will convert it to an integer, 3

as.integer("red")   # will produce an error

## Basic vector operations
employmentStatus = c(TRUE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE)
employmentStatus

# Tells you the number of elements in the list
length(employmentStatus)

# Adds up all the values in the list
sum(employmentStatus)

# you can do arithmetics with vector operations:
sum(employmentStatus)/length(employmentStatus)

# Pick out the third element from the list
employmentStatus[3]

# Pick out the third, fourth and fifth elements from the list
employmentStatus[3:5]


# Logical Operators
#
# less than <, or equal to <= 
# greater than >, or equal to >= 
# equal to ==, not != 
# not ! 
# or |
# and &

## Subsetting is sophisticated: 
employmentStatus[employmentStatus == TRUE,]


## Using comments

2 + 2 # this is a comment, not part of the calculation

# using packages
library("foreign")
exists("read.spss")
detach("package:foreign", unload=TRUE)
exists("read.spss")

install.packages("ggplot2")

setwd("/")
getwd()

## Variable classes
# numeric
# string or character

# factors
var <- c(1,2,3,4,4,4,5,5,4)
var + 2
var <- as.factor(var)
var + 2
levels(var)


## Building a data file
subjectID = c(101,102,103,104,105)
demographics = c("Surrey","Surrey","Delta","Vancouver","Langley")
employmentStatus = c(TRUE,TRUE,FALSE,FALSE,TRUE)
data = data.frame(subjectID, demographics, employmentStatus)
data

names(data)

head(data)

# Formulas

formula1 <- output ~ prediction
formula1

formula2 <-  out ~ pred1 + pred2 # more than one variable on the right
formula3 <-  out ~ pred1 * pred2 # different relationship between predictors
formula4 <-  ~ var1 + var2 # a ’one-sided’ formula

# Using help

?sum