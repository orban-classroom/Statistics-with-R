## Lecture 2 as delivered to A10

measles_cases <- c(5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
## a bunch of numbers inside a c() function is a vector
## a bunch other stuff in it (like BOOLEAN, or TEXT etc), is a list of values

class(measles_cases)
?class()

# numeric -- decimal point based value. float point value
# integer -- whole numbers
# boolean -- TRUE and FALSE values
# character -- text string values

measles_as_integer <- as.integer(measles_cases)

running_time <- c(9.58, 17.34, 14.77, 18.76)
running_time_integer <- as.integer(round(running_time))

## How to load data from GitHub into R

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2024%20Summer/Data/202420_2300_classdata.csv"
stats_class_data <- read.csv(data_link)

## Get a glimpse into the data
head(stats_class_data)

## What are the variable names in this data frame?
colnames(stats_class_data)

## How many variables are there in this data frame?
length(
  colnames(
    stats_class_data
    )
)

## written in one line: 
length(colnames(stats_class_data))

## same answer using one easy function
ncol(stats_class_data)

## How many participants or observations are there in this data frame?
nrow(stats_class_data)

## Use the tail() function to output the last 3 rows of this data frame
?tail()
tail(stats_class_data)
tail(stats_class_data, 3)
tail(stats_class_data, n = 3)
tail(stats_class_data, n = 3L)
