## Lecture 4

# Let's load our data
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv"
class.data <- read.csv(url)

## Tasks
## 1. Compute the Sums of Squares
## 2. Compute the Variance
## 3. Compute the Standard Deviation

colnames(class.data)
## "hrs.screentime.weekly"

head(class.data)

## If you have to deal with NA (or blank) values, you need filter the data
## Some functions like the mean() median() or others have the na.rm = TRUE argument
## But many of the manual calculations do not. 
## For that case, prepare a filtered data frame

filtered.screentime <- class.data[!is.na(class.data$hrs.screentime.weekly), "hrs.screentime.weekly"]
## This filtered object is a vector (smells and tastes like a vector) -- you have to use length() rather nrow() for example
## contains no blank values

## Sums of Squares
## Find the Mean
sum.screentime <- sum(filtered.screentime)
n.screentime <- length(filtered.screentime)
mean.screentime <- sum.screentime / n.screentime  

## Verify my calculation using the built-in function
mean(class.data$hrs.screentime.weekly, na.rm = TRUE)

## Deviation scores
deviation.screentime <- filtered.screentime - mean.screentime
## Verification / diagnostics
## It should sum to zero
sum(deviation.screentime)
## -5.258016e-13 >> heard of scientific notation?
## essentially 0. R just wants to be super anal

## Squared the deviation scores
squared.deviation.screentime <- deviation.screentime^2
## we have a vector of values (not a single number)
## all positive values

## Compute the Sums of Squares
ss.screentime <- sum(squared.deviation.screentime)
## one big positive number

## Faster method, without interim variables
ss.scr <- sum((filtered.screentime - mean.screentime)^2)

## Variance
## SS / df (deg.free)
## df can be confused with data frame

deg.free <- n.screentime - 1
var.screentime <- ss.screentime / deg.free

## Verify using the built-in function
var(class.data$hrs.screentime.weekly, na.rm = TRUE)

## Standard Deviation
## s: standard deviation for a sample
s.screentime <- sqrt(var.screentime)

## Verify using the built-in function
sd(class.data$hrs.screentime.weekly, na.rm = TRUE)

## Exercise
## Research Question: How was screentime different 5 years ago versus now?

## filtered variables for each of the groups of data

filtered.2019 <- class.data[!is.na(class.data$hrs.screentime.weekly) & class.data$Semester == 201910, "hrs.screentime.weekly"]
filtered.2024 <- class.data[!is.na(class.data$hrs.screentime.weekly) & class.data$Semester == 202410, "hrs.screentime.weekly"]

head(filtered.2019)
head(filtered.2024)

## 2019

n.2019 <- length(filtered.2019)
mean.2019 <- sum(filtered.2019) / n.2019
ss.2019 <- sum((filtered.2019 - mean.2019)^2)
deg.free.2019 <- n.2019-1
var.2019 <- ss.2019 / deg.free.2019
sd.2019 <- sqrt(var.2019)

## 2024

n.2024 <- length(filtered.2024)
mean.2024 <- sum(filtered.2024) / n.2024
ss.2024 <- sum((filtered.2024 - mean.2024)^2)
deg.free.2024 <- n.2024 - 1
var.2024 <- ss.2024 / deg.free.2024
sd.2024 <- sqrt(var.2024)

## In 2019, the mean hours of screentime was 27.22 hours with a standard deviation of 16.78
## In 2024, the mean hours of screentime was 35.03 hours with a standard deviation of 24.78


