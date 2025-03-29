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

MyFirstDataFrame <- data.frame(SubjectID = seq(1:10000),
                         ReactionTime = rnorm(10000))

### 2.
# If you recall from earlier classes, once you create a data frame, you can view the data like it's an Excel spreadsheet 
# by clicking the dataframe's name in your global environment. You can also do things 
# like head() to view the first 6 records or check the class() of the data. 
# View just one column of the data by using the dollar sign.
# I.e., the $ like so: MyFirstDataFrame$ReactionTime or MyFirstDataFrame$SubjectID

head(MyFirstDataFrame)

MyFirstDataFrame$ReactionTime

MyFirstDataFrame$SubjectID

### 3.
# Subsetting in a data frame is more complicated. Whereas in a vector you only needed to 
# specify a single number or range of numbers to make a filter, here you have 
# two coordinates: horizontal and vertical. For example, to filter your data for the 
# top-left cell, type MyFirstDataFrame[1,1]

# Consider the following problems: 
# (a) Using the subsetting method, select the entire first column.

MyFirstDataFrame[MyFirstDataFrame$SubjectID == 1,]

# (b) Using the subsetting method, select the entire 10th row. 

MyFirstDataFrame[MyFirstDataFrame$SubjectID == 10,]

# (c) Using the subsetting method, select all rows where the random number is greater than 0.5

MyFirstDataFrame[MyFirstDataFrame$ReactionTime > 0.5,]

# (d) Using the subsetting method, select the first 5,000 rows

MyFirstDataFrame[1:5000,]

### 4. A new data file has been made available for you called "studentmentalhealth" inside the data folder on GitHub. 
## You will load "Sheet 1-Table 1.csv" file for the purpose of the analyses below.
## Paste the Raw GitHub URL inside the double quotations below and load the data file
data_url = "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/studentmentalhealth.csv"
mental_health_data <- read.csv(data_url)

### 5. 
## Execute the manual mean calculation on the "WAIS_FIQ" (Full Scale IQ Score) variable.

wais_sum <- sum(mental_health_data$WAIS_FIQ)
wais_n <- nrow(mental_health_data)

manual_mean <- wais_sum / wais_n

## Double check your work using the built-in mean function

mean(mental_health_data$WAIS_FIQ)

## Generate a histogram of this variable. 

hist(mental_health_data$WAIS_FIQ,
     main = "WAIS IQ data",
     breaks = 10,
     col = "red")

## Type a hashtag and comment on the normality of this graph. Does it look normal to you?

# Quite normal with peak in the middle, slightly longer tail on the left (maybe negative skew), possibly a bit too sharp of a peak (leptokurtic)

### 6. Median
# Execute the median calculation using the method discussed in class. Specifically: 
## Decide on whether your sample size is odd or even
## Apply the correct code to find the middle point

wais_n
# odd number, therefore picking out the one middle value is sufficient

sorted_wais <- sort(mental_health_data$WAIS_FIQ)
sorted_wais[wais_n/2]
## 118

## Double check your work using the built-in median function

median(mental_health_data$WAIS_FIQ)

### 7. Mode
## Execute mode the manual method discussed in class. 

table(rle(sorted_wais))

# The mode of the data, as indicated in the table is 124

## Apply the built-in modeOf function from the lsr library

library(lsr)

modeOf(mental_health_data$WAIS_FIQ)

## Generate a box plot of the "S_score STAI State Anxiety Score" column

boxplot(mental_health_data$S_score.STAI.State.Anxiety.Score)

## Using a hashtag, type in your comments about your discoveries relating to the shape of this distribution.

# 3 extreme outliers on the high end as indicated by the dots
# The fourth quadrant (upper whisker) is longer, indicating a skew in that direction (positive) 
# thick black line or the median is located approximately in the middle of the gray square

## end of homework