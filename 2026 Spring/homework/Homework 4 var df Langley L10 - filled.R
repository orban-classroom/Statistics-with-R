## Homework 4
############

## Load the PSYC2300 class survey data here.
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/202610_2300_data.csv"
stats.data <- read.csv(url)
alternate.stats.data <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/202610_2300_data.csv")

## Use the exercise var 
## Use the exercise variable for this homework. Develop your filter below.

## "Main" method - start off with a data frame
## stats.data[<< the rows that I want>> , << the columns that I want >>]

## First method: stats.data$Semester %in% c(201910,202310,202410,202510,202610)
colnames(stats.data)

## optional, if you see any NA values:
clean.winter.exercise <- winter.exercise[!is.na(winter.exercise)]


## Second method: Semester == 201910
## stats.data$Semester == 201910 | stats.data$Semester == 202310 | stats.data$Semester == 202410 | stats.data$Semester == 202510,202610)

## Third method: substr(stats.data$Semester, 5, 6) == 10
stats.data[substr(stats.data$Semester, 5, 6) == 10,]


## Alternate method - start off with a vector
stats.data$hrs.exercise.weekly[]


## Create two types of filters: 
## Pick out all the winter semester classes (while looking at exercise only). 
## Develop your filter below.
winter.exercise <- stats.data[stats.data$Semester %in% c(201910,202310,202410,202510,202610), "hrs.exercise.weekly"]


## Pick out all the summer semesters (while looking at exercise only). 
summer.exercise <- stats.data[stats.data$Semester %in% c(201920,202320,202420), "hrs.exercise.weekly"]


## For each of filters, complete these steps:
## Generate a histogram for each (exercise winter, exercise summer). 
## Add hashtag comments on the shape of the distribution
## Use the method described in this Stack Overflow article to produce two histograms 
## blended together to show the number of dependents in each of the classes: 
## https://stackoverflow.com/questions/3541713/how-can-i-plot-two-histograms-together-in-r
## Look at the answer posted by the user named "Dirk is no longer here"

## The Skeleton (100% on Homework)
hist(winter.exercise)
hist(summer.exercise, add = TRUE)

## The Fluff/Herbs
hist(winter.exercise,
     col = rgb(.2,.8,.1,.25),
     ylim = c(0,70)
     )
hist(summer.exercise, 
     col = rgb(0,.2,0.8,0.25),
     ylim = c(0,70),
     add = TRUE)



## Compute the mean for summer exercise, winter exercise manually. Verify your work using the built-in function

summer.exercise
sum.summer <- sum(summer.exercise)
n.summer <- length(summer.exercise) ## sample size of filtered summer data
nrow(stats.data) ## sample size of the entire data frame unfiltered
                  ## for reference

mean.summer <- sum.summer / n.summer

## Always double-check
mean(summer.exercise)

## Repeat...
winter.exercise

## Compute the sums of squares for summer exercise, winter exercise manually. 

deviation.scores.summer <- summer.exercise - mean.summer
squared.deviation.scores.summer <- deviation.scores.summer^2
sum.squares.summer <- sum(squared.deviation.scores.summer) ## SS

## Make diagnostic remarks as in class to gauge whether your calculations are correct
round(sum(deviation.scores.summer))
## you should get 0

squared.deviation.scores.summer ## a list of positive values

sum.squares.summer ## single positive number

## Compute the variance manually. Verify your calculation using the built-in function

df.summer <- n.summer - 1
var.summer <- sum.squares.summer / df.summer

## Double check
var(summer.exercise)

## Compute the standard deviation manually. Verify your calculation using the built-in function

s.summer <- sqrt(var.summer)

## Double check
sd(summer.exercise)

## Do the summer exercise and winter exercise numbers look different?

## Look at the mean of each, and their standard deviations




