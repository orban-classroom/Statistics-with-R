library("lsr") 

##################
### Homework 3 ###
##################

### 1. 
# Create an empty data frame with two variables: one variable that runs numbers 
# sequentially from 1 to 10,000 and a second variable that contains 10,000 random 
# numbers between 0 and 1. 
# Functions you will use are data.frame() to create a data frame object, 
# seq() to create an increasing sequence of numbers, and runif() to create a random
# distribution of values ranging from 0 to 1.
# Name the first variable "SubjectID" and the second number "ReactionTime". 
# Name this data frame, "MyFirstDataFrame"

vec1 <- seq(from = 1, to = 10000, by = 1)
vec2 <- runif(n = 10000, min = 0, max = 1)
dataframe <- data.frame(vec1+1000, vec2)

myfirstdataframe <- data.frame(
  subjectid = seq(from = 1, to = 10000, by = 1), 
  reactiontime = runif(n = 10000, min = 0, max = 1)
  )
?seq

hist(myfirstdataframe$reactiontime)

## All of these produce the same result
1:10000
seq(from = 1, to = 10000, by 1), 
seq(10000)

runif(1)

### 2.
# Once you create a data frame, you can view the data like it's an Excel spreadsheet 
# by clicking the dataframe's name in your global environment. You can also do things 
# like head() to view the first 6 records. To view just one column of the data, you can 
# use the $ like so: MyFirstDataFrame$ReactionTime or MyFirstDataFrame$SubjectID

head(myfirstdataframe, 3)
tail(myfirstdataframe, 1)

myfirstdataframe$reactiontime
myfirstdataframe

### 3.
# Subsetting in a data frame is more complicated. Whereas in a vector you only needed to 
# specify a single number or range of numbers to make a filter, here you have 
# two coordinates: horizontal and vertical. For example, to filter your data for the 
# top-left cell, type MyFirstDataFrame[1,1]

myfirstdataframe[1,1] ## first value is row #, second value is the column number


# Consider the following problems: 
# (a) Using the subsetting method, select the entire first column.
myfirstdataframe[<< the row >>, << the column >>]
myfirstdataframe[ , 2]
myfirstdataframe[,"reactiontime"]
myfirstdataframe[1:10000,1]

# (b) Using the subsetting method, select the entire 10th row. 
myfirstdataframe[10,]
myfirstdataframe[10,1:2]

# (c) Using the subsetting method, select all rows where the random number is greater than 0.5
myfirstdataframe[myfirstdataframe$reactiontime > .5,]
## do not specify a column filter, leave all after the column empty

## does not like this notation (even though it looks legit)
myfirstdataframe["reactiontime" > .5,]
myfirstdataframe[vec2 > .5,]

myfirstdataframe[,"reactiontime"] ## at the same time, this is fine for a column filter

## ignore this (it's more advanced stuff, but fun to see)
install.packages("dplyr")
library("dplyr")
myfirstdataframe %>%
  filter(reactiontime > .5)


== # check to see if something is equal
< > # less than or greater than
!= # not equal
<= => # less than or equal, or greater than or equal 

# (d) Using the subsetting method, select the first 5,000 rows

  myfirstdataframe[1:5000,]
  myfirstdataframe[1:5000,1:2] ## also good but verbose

### 4. A new data file has been made available for you called "studentmentalhealth" inside the data folder on GitHub. 
## You will load "Sheet 1-Table 1.csv" file for the purpose of the analyses below.
## Paste the Raw GitHub URL inside the double quotations below and load the data file
raw.url = ""
mental.health.data <- read.csv(raw.url)

### 5. 
## Execute the manual mean calculation on the "WAIS_FIQ" (Full Scale IQ Score) variable.

mental.health.df <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/studentmentalhealth/Sheet%201-Table%201.csv")

## Double check your work using the built-in mean function

## Generate a histogram of this variable. 

## Type a hashtag and comment on the normality of this graph. Does it look normal to you?

### 6. Median
# Execute the median calculation using the method discussed in class. Specifically: 
## Decide on whether your sample size is odd or even
## Apply the correct code to find the middle point


## Double check your work using the built-in median function

### 7. Mode
install.packages("lsr")  ## run it once (and maybe once every 6 months)
library("lsr") ## load for every notebook
modeOf(myfirstdataframe$reactiontime)

## Execute mode the manual method discussed in class. 

table(
  rle(
    sort(mental.health.df$WAIS_FIQ)
    )
  )
## the mode is 124

## Apply the built-in modeOf function from the lsr library


## Generate a box plot of the "S_score STAI State Anxiety Score" column


## Using a hashtag, type in your comments about your discoveries relating to the shape of this distribution.