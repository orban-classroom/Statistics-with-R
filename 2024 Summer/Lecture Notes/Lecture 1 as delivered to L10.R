1 + 1
1 - 1
1 * 1
1 / 1

myvariable <- 1

myvariable

mylist <- c(5,3,76,43,3,56)
mylistofvalues <- c("red",4,TRUE,.667)

## c() - a function that assembles values into a list

## "red" - character value (also known as string) 
## 4 - integer, whole number
## TRUE / FALSE - boolean values (psychologists don't know about it)
## .667 - decimal point value, float point value, numeric

## In Psychology
## Nominal measurement type >> in R >> character values
## Rank order >> in R > character value
## Interval >> in R >> numeric
## Ratio >> in R >> numeric

## Functions

langleytosurrey <- 30
langleytorichmond <- 55


langleytosurrey

sum(langleytorichmond, langleytorichmond, na.rm = TRUE)

sum(mylistofvalues)
## won't work because there is a character element inside mylistofvalues

class(mylistofvalues)
class(mylist)

mylist <- as.integer(mylist)

<-
