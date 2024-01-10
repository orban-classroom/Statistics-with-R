#
# LECTURE 1 NOTES 
#
happiness.rating

# Basic Arithmetics 
1+1
2+2
2-2
2^2
2/2
6*9
5-3

# If you use Windows, type Ctrl + Enter to activate the code
# If you use Mac, type command + return to activate the code
# Pressing Enter(Win) / Return(Mac) in a script starts a new line

# Operators

1 == 1 # double equal signs check to see if entities on each side are equal
1.01 == 1
2 == 1

1 != 1 # same as asking the question "is it not equal to..."
2 != 1

2 < 1
2 > 1

# Concept of a variable

# it's an object that changes (can change)

# to create a variable
# Step 1: Name the variable
# Step 2: Assign a value to it ("less than" sign and a dash put together )
happiness.rating <- 5

# Conventions to variable naming (it's a bit like an APA style thing)
happinessRating
happinessrating
hapiness_rating

# Can't do: 
## start a variable name with a number
999hapiness.rating
### start a variable name with an underscore or any symbol
_hapiness.rating
### can't use various characters in a variable name, e.g., dash
hapiness-rating
hapiness&rating
hapiness@rating

## Functions
## Functions are built-in processes that are part of R

## sum() function
sum(4,5,4)

# same as
4 + 5 + 4

sum(34,3,4,45,2,53,54,65,7,65,54,32564,256, na.rm = TRUE)

sum(1:5)
# same as
1 + 2 + 3 + 4 + 5

# variables and functions

happiness.rating <- sum(4:10)

happiness.rating

## be mindful about the order in which you activate code
## be mindful not to overwrite the same variable with new contents of information

# data types
# integers: whole numbers
# float values: decimal numbers
# booleam values: TRUE or FALSE
# character values: text

# You can R to tell you what it thinks about your variable
is.integer(happiness.rating)
is.numeric(happiness.rating)
is.character(happiness.rating)
is.logical(happiness.rating)

# Tell R to make it into a certain data type

happiness.rating <- as.integer(happiness.rating)

