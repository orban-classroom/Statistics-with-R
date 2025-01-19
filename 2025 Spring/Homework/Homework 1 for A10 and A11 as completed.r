## Homework 1

## Instructions
## Download this R Script and load it in your copy of R Studio
## Enter your answers as code below each question
## Save your work and upload to Moodle by the deadline
## If asking question on Signal Messenger, 
## post screenshots of errors of the entire R Studio screen (or take a photo of it)

## Create a variable with the number 10. 

myNum <- 10

x <- 10

## for variable naming, as a standard: 
## come up with useful, descriptive names that you can remember later
## formatting possibilities: all in one word, capitalize the first letter of each
## separate words by a character such a . _ -
## cannot start a variable name with a number
## no special characters, especially no spaces or slashes or commas (and many other things)
## do not make a variable name the same as a function word
## e.g., mean() is a function. if you make your variable name mean, you set the path for confusion land
# mean <- 10
# mean
# mean(10,11,12)

## Create a second variable with the number 52 (which is the meaning of life, if you watched Hitchiker's Guide to the Galaxy)

mySecNum <- 52

## Add the two numbers together using their variable names

myNum + mySecNum

## Subtract the second variable from the first variable.

myNum - mySecNum

## Functions are built-in commands on R that do some internal computation
## For example, the function rm() deletes a variable from the global environment
## Delete the second variable from the global environment

rm(mySecNum)

## When you don't understand how a function works, you can type in
## the function's name with a question mark before it, like so ?rm()
## Type ?c() and read the help document (bottom right quadrant)

?rm()

## Create a vector using c() that contains last week's measles infections by province.
## Use this link: https://www.canada.ca/en/public-health/services/publications/diseases-conditions/measles-rubella-surveillance/2024/week-16.html

measles <- c(3,0,0,0,0,0,0) ## numberic or integer data type

favourite.colours <- c("red", "blue", "purple", "white", "black") ## a text data type

j.grades <- c(TRUE, FALSE, FALSE, FALSE, TRUE, TRUE) ## logical or boolean data type

running.time <- c(9.58, 18.43, 15.2, 16.4) ## this is also a vector as it is a list of numbers
class(running.time)
as.integer(running.time)

## Check the class of the data set. 

class(measles)
class(favourite.colours)
class(j.grades)

## Convert the data to be an integer data type

measles.integer <- as.integer(measles)
class(measles.integer)

## In R, you can create different data types. Until now you have been dealing with one type
## Using the class() function, find out what kind of data have you been dealing with
## Figure it for the first variable (the second one has been deleted), and for the vector your created.




## end of homework
##################
