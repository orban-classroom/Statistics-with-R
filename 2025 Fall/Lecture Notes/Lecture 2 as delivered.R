## Lecture 2
## Variables and other interesting matters

## Variable naming conventions (a bit like APA style for R)
## Be creative, and make variable names descriptive (so you can remember what they represent when you come back to your code later)

myfavouritecolours <- c("red", "violet", "lightblue", "darkblue", "blue")
# vector: a series of values
# in Ccomputing Sciences: string (in R, it's character)
# in psycholingo: nominal
# <- assignment operator, equivalent to = in most other language
class(myfavouritecolours)
is.character(myfavouritecolours)
is.integer(myfavouritecolours)


# Basic Operations
# + (addition)
# - (subtraction), 
# / division, 
# * multiplication
# ^2 power (square, raise to the power of 2)
# sqrt() squareroot

myfirstdataframe <- data.frame(
  subjectid = c(1,2,3,4,5,6,7,8,9,10),
  reactiontime = c(5.6,3.2,10.1,8.5,5.5,5.4,6.7,9.1,8.8,1.2)
)

# To refer to a particular column of the data frame: 
myfirstdataframe$reactiontime


# Handy functions
# Display the top few elements of a vector/data frame
head(myfirstdataframe)
tail(myfirstdataframe)
colnames(myfirstdataframe)

## How many variables there are: 
length(myfirstdataframe)
## Enter just the data frame's name

## How many observations there are (also often refers to the number of participants = sample size)
length(myfirstdataframe$subjectid)
## pick any column in a data frame

## When it comes to a vector, length() of the variable name gives you the number of observations / sample size
length(myfavouritecolours)






