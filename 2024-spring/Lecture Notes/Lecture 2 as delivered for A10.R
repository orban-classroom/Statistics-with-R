## LECTURE 2 as delivered for A10

# Loading data from the web
# my.variable <- read.csv("URL goes in here")
my.2300.data <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-summer/Data/2300_2023.csv")

## Generate a quick glimpse into the data, to be shown in the console
## Gives the first 6 rows of the data
head(my.2300.data)

## Data Frames vs Vectors
## Vector: is a list of values (text, or number, or boolean, or other). And uses the "c()" function
## Data Frame is a collection of variables. uses the data.frame() function
## Any time you read.csv() a file from your computer, or the web, you create a data.frame() object

## How to make a reference to a single column
## View the entirety of one column (or one variable) or data
my.2300.data$Semester

## how can I view it in a sorted manner?
sort(my.2300.data$hrs.sleep.weekly)


class(my.2300.data)

class(my.2300.data$Semester)

class(my.2300.data$hrs.exercise.weekly)

## thinkg about changing some of the columns to a more appropriate data type (e.g., Semester as integer???)

sum(my.2300.data)
## cannot apply sum to an entire data frame, partly because there are different data types for different variables

sum(my.2300.data$no.courses.taken)
# NA? It means that there is missing data in the column somewhere
## need to give R guidance on what to do with missing data
sum(my.2300.data$no.courses.taken, na.rm = TRUE)

# Let's create one data visualization
# Histogram
hist(my.2300.data$cups.caffeine.weekly, breaks = 15)
# The y-axis is always the number of occurrences of a particular value
# The x-axis is always the range of scores for the given variable
# "breaks" argument allows you to set your level of precision in the bars



