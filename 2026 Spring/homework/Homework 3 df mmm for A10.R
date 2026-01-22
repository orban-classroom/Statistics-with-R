####################################
### Homework 3 A10 Online Course ###
####################################

### 1. 
## Create an empty data frame with two variables: one variable that runs numbers 
## sequentially from 1 to 10,000 and a second variable that contains 10,000 random 
## numbers between 0 and 1. 
## Functions you will use are data.frame() to create a data frame object, 
## seq() to create an increasing sequence of numbers, and runif() to create a random
## distribution of values ranging from 0 to 1.
## Name the first variable "SubjectID" and the second number "ReactionTime". 
## Name this data frame, "MyFirstDataFrame"


### 2.
## Once you create a data frame, you can view the data like it's an Excel spreadsheet 
## by clicking on the dataframe's name in your global environment. 
## You can also use functions like head() to view the first few (6 by default) records 
## or check the class() of the data. 
## View just one column of the data by using the dollar sign: 
## Like so: MyFirstDataFrame$ReactionTime or MyFirstDataFrame$SubjectID


### 3.
## Subsetting in a data frame is a little more involved because you need to think about rows and columns.
## In a vector c(), you only needed to specify a single number or range of numbers to make a filter
## with a data frame here you have two coordinates: horizontal(rows) and vertical(columns). 
## For example, to filter your data for the top-left cell, type MyFirstDataFrame[1,1]

## Consider the following problems: 
## (a) Using the subsetting method, select the entire first column.

## (b) Using the subsetting method, select the entire 10th row. 

## (c) Using the subsetting method, select all rows where the random number is greater than 0.5

## (d) Using the subsetting method, select the first 5,000 rows


### 4. A new data file has been made available for you called "studentmentalhealth" inside the data folder on GitHub. 
## Paste the Raw GitHub URL inside the double quotations below and load the data file.
## The data folder contains a readme.md file which describes how to generate the raw link.
raw.url = ""
mental.health.data <- read.csv(raw.url)

### 5. Execute the manual mean calculation on the "WAIS_FIQ" (Full Scale IQ Score) variable.


## Double check your work using the built-in mean function


## Generate a histogram of this variable. 


## Type a hashtag and comment on the normality of this graph. Does it look normal to you?


### 6. Median
# Execute the median calculation using the method discussed in class. Specifically: 
## Decide on whether your sample size is odd or even
## Apply the correct code to find the middle point


## Double check your work using the built-in median function


### 7. Mode
## Execute mode the manual method discussed in class. 


## Apply the built-in modeOf function from the lsr library



## Using a hashtag, type in your comments about your discoveries relating to the shape of this distribution.



## end of homework