## Lecture 2 as delivered to A11

## Importing a file from the web
## my.2300.data <- read.csv("URL goes here")

my.2300.data <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv")

## vector: list of values (most commonly numbers, but occasionally other data types)
## data frame: (essentially a series of vectors) - multiple columns of data put together into an object

## Glimpse into the data
head(my.2300.data)

## What is the data type of the "Section" column?
class(my.2300.data$Section)

## What is the data type of the "Semester" column?
## could be a nominal or a rank order variable depending on context
class(my.2300.data$Semester)
as.character(my.2300.data$Semester)

## How to sort data? For example, I can tell the minimum and maximum values easily
sort(my.2300.data$hrs.screentime.weekly)

## What is the total number of course enrolments this semester for A10 and A11?
sum(my.2300.data$no.courses.taken, na.rm = TRUE)

## Dealing with NA values: Many functions have "na.rm = " arguments where 
## you can specify what to do with missing values. Often, they are removed.

hist(my.2300.data$cups.caffeine.weekly, breaks = 10)
## histogram is a special graph where the y-axis is always the number of times a particular value is found in the data set
## the x-axis is always the range of different values you can find in that data set

## The data is binned in a histogram


