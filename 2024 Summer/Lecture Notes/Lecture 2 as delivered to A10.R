## Lecture 2 as delivered to A10

## Today: 
## Learn about importing data from the web
## Learn about data frames
## Gather a bit more data for a stats survey

## Cleaner
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/202420_2300_classdata.csv"
stats.data.frame <- read.csv(url)

## Simpler
data.stats <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/202420_2300_classdata.csv")

## Vectors: lists of items (numbers, characters, booleans etc)
## Data frame: a list of lists (each column is technicaly a vector)

## To identify and work with a single column of data: 
stats.data.frame$hrs.screentime.weekly

## What is the total number of hours that stats students committed to screentime across all classes?
sum(stats.data.frame$hrs.screentime.weekly)

## Glimpse into the data
head(stats.data.frame) ## first 6 values
tail(stats.data.frame) ## last 6 values

colnames(stats.data.frame)

# Histograms: a special kind of barplot
# the y-axis always indicates the number of times a particular value in the data set appears
hist(stats.data.frame$cups.caffeine.weekly)

stats.data.frame$cups.caffeine.weekly


hist(stats.data.frame$cups.caffeine.weekly, breaks = 20)
hist(stats.data.frame$cups.caffeine.weekly, breaks = 3)
hist(stats.data.frame$cups.caffeine.weekly, breaks = 200)
?hist

sort(stats.data.frame$hrs.sleep.weekly)

