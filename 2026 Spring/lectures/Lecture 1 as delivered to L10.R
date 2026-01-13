# Lecture as delivered to L10

# Basic operations: Addition
1+1 # I am adding one plus one
2+2
3+3

# Subtraction
1-1

# Multiplication
1*1

# Division
1/1

# power
2^2

# square root
sqrt(2)

mean(c(3,4,3,1,5,6,7,7,2,1,3,4,5), na.rm = TRUE)

# Types of brackets used in differen situations
() {} []

c(3,4,3,1,5,6,7,7,2,1,3,4,5)

?mean()

hapiness.ratings <- c(3,4,3,1,5,6,7,7,2,1,3,4,5)

## Variable name
## letters, upper / lower case, _ . 
## can use numbers but not as the first element

# Can't do these for a variable name:
3happiness.ratings
happiness ratings
_ss
-nono

# Can do these as a variable name
HappinessRatings
happiness_ratings
happiness.ratings
happinessRatings
happiness3Ratings
x

## Slow, error prone, long and messy:

mean(c(3,4,3,1,5,6,7,7,2,1,3,4,5), na.rm = TRUE)

## Substitute variable name
mean(hapiness.ratings)

## Different Data Types

## Nominal: names, no identifiable difference levels
##  colours: red, yellow
## Rank ordered / Ordinal: Rankings - there is difference between values, the spacing is not set
##. medals (gold, silver, bronze)
## Interval
##  
## Ratio: defined 0
##  

## In R (and all computing languages)
## string / character: anything that's text / not computable
##   can't do math on it
## integer: whole number (an unsigned integer is even better)
##   rank ordered values
## numeric: decimal numbers (interval, ratio)
## boolean: TRUE / FALSE

class(hapiness.ratings)

hapiness.ratings <- as.integer(hapiness.ratings)

class(hapiness.ratings)








