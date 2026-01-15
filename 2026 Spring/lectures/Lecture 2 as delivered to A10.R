## Lecture 2


## Basic Operators
1+1 # Addition -- + symbol
1-1 # Subtraction -- dash
1*1 # Multiplication -- star
1/1 # Division -- slash
2^3 # Power -- hat
sqrt(2) # Squareroot

## Distinction of different kinds of brackets in R
() # curvy/regular backets: often used with functions. e.g., word()
[] # square bracket: e.g., when we want to select or filter for a certain subset of data
{} # curly bracket used in conjunction with certain programming concepts (e.g., define a brand new function; or you do soemthing a loop)

## Functions
## something that does a set of robotic number crunching 
mean(2, na.rm = TRUE)

## Variables
## ... is an object that holds different kinds of values
my.variable <- 10

## Variable naming
ertyu # this a valid variable. name, but not particularly helpful one
x
y
z
# make sure your variable names are descriptive and help you understand what you're calcualting

## Don't's
my variable ## can't have spaces in a variable name
3myvariable ## can't start with a number
my-variable ## Can't have a dash in the variable 
# also other things you cant' have: /^%$#@()[]{};:

## Do's
MyVariables ## Mix upper case and lower case letters to legibility
my_variables ## underscore is ok
my.variable ## period is ok
My3Variable ## number is okay if not the first character
myVariableStoredHere

## Data Types
## In Psychology: 
## Nominal: differences between levels of the variable are not quantifiable: colours(red, blue, purple, etc)
##  Most crude / rudimentary data type
## Rank ordered / Ordinal: there is a magnitude difference between levels, but we don't what or how much medallists(gold, silver, bronze)
##  we can do a little more stats than nominal data types
## Interval: continuous variable which has no true 0. e.g., Happineess on a scale of 1-7
## Ratio: continuous variable with a true 0 (e.g., temperature)

## Computing Sciences
## integer: whole number (e.g., 1, 50, 1,000,000, -20, etc)
##    probably would map interval data atype to an integer
## numeric / float: any number with a decimal point
##    ratio would map onto here. possibly interval as well
## character / string: 
##     gibberish characters - any text that you can't compute with
##     maps onto nominal variables and ordinal
## boolean: TRUE / FALSE
##     no clear mapping but there may specific variable that have two options
## and some others...

## How do make sense of psychological lingo in a programming application?


## Vectors -- or list of values
mean(4,5,6,2,2,7,7,7,5,6,4,3) ## This doesn't work

## c()
c(4,5,6,2,2,7,7,7,5,6,4,3)

mean(c(4,5,6,2,2,7,7,7,5,6,4,3))

happiness.ratings <- c(4,5,6,2,2,7,7,7,5,6,4,3)

mean(happiness.ratings)

## find out & convert between data types

class(happiness.ratings)
happiness.ratings.int <- as.integer(happiness.ratings) ## overwriting the original variable with this modification
## as.numeric, as.character to convert it to other data types
class(happiness.ratings)

happiness.ratings <- 50
