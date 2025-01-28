## R Homework 2

## Follow these stylistic conventions
## 1. Refine your own system of variable naming, and stick to it. I will be looking for consistency over the semester. You can still play arund now.
## 2. Use a single hashtag # for your comments. I will use ## for my comments.
## Use spaces carefully to organize your code. Make it readable. Create headings and comments in your code.  

## Look in the 2025 class folder for the latest version of the 2300 class data.
## Import it here and assign it to a data frame variable.

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/202510_2300_classdata.csv"
psyc.data <- read.csv(data_link)


## Use the colnames() to figure out the name of every column in the data set

colnames(psyc.data)
  
## Use the nrow() function to figure out how many records exist in the data set

nrow(psyc.data)

## Generate a quick peak into the data using head(). 

head(psyc.data)

## Add an argument in the head() function to change the default 6 rows to 3 rows

head(psyc.data, 3) 

## Can you find a function to output the last 6 rows instead of the first 6 rows?

tail(psyc.data)

## Generate a histogram of the "dependents" variable
## Learn to use arguments in the hist() function in order to generate a graph title, and change the y-axis and x-axis label
## Change the colours of the histogram to make it look pretty. Brownie points for good looking graphs

hist(psyc.data$dependents,
     main = "PSYC 2300 Classroom Data",
     xlab = "Number of Dependents", 
     col = "pink"
     )


## Sort the values no.courses.taken variables. What is the fewest and greatest number of courses students are taking? 
## Output the result below

sorted.psyc.data <- sort(psyc.data$no.courses.taken)

min(psyc.data$no.courses.taken)

max(psyc.data$no.courses.taken)

## Consider the following conceptual question.
## Ackerman and Goldsmith (2011) compared learning performance for students who 
## studied material printed on paper versus students who studied the same material 
## presented on a computer screen. All students were then given a test on the 
## material and the researchers recorded the number of correct answers. 

## Identify the dependent variable for this study

# learning performance

## In R, how would you encode the dependent variable? Numeric, string, or integer?

# numeric

## What scale of measurement (nominal, ordinal, interval, ratio) is used to measure the dependent variable?

# interval

## end of homework