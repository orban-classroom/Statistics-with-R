## Lecture 1 Notes

## Basic mathematical operations
1 + 1
4 - 10
9 * 9
543254 / 2
4 ^ 2
sqrt(16)
?sqrt() # This will bring up the help text associated with the function

## Variables

myfavouritecolours <- "green"
  
## don't call your variable after a function (e.g., sqrt)

myfavouritenumber <- 112 ## this is coded as a number - can do stats on it
myfavouritenumber <- "112" ## this is coded as a text - can't do stats on it

myfavouritenumber

## In R (& the rest computing sciences)
## string (in R, it's called character)
## integer (whole numbers)
## numeric (double, float point values -- basically decimal numbers)
## booleans (TRUE and FALSE items)
## factors (in research methods, we call them conditions)

## In Psychology
## nominal      >> character
## rank order   >> character
## interval     >> numeric
## ratio        >> numeric
## conditions   >> factor

## Making a list of values, or a "vector" of elements
myfavouritecolours <- c("blue", "green", "orange", "white", "beige")

myfavouritecolours

## count the number of items in a vector
length(myfavouritecolours)
