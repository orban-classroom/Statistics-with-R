## Homework 4
############

## Load the PSYC2300 class survey data here.
## You can find the raw GitHub link in the usual location.
d <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/202420_2300_classdata.csv")

## Use the exercise variable for this homework. 
d$hrs.exercise.weekly

## Create two types of filters: 
## - pick out all the winter semesters and narrow your scope to the exercise variable
## - pick out all the summer semesters and narrow your scope to the exercise variable

winter <- d[d$Semester == 201910 | d$Semester == 202310 | d$Semester == 202410,]
summer <- d[d$Semester == 201920 | d$Semester == 202020 | d$Semester == 202320 | d$Semester == 202420,]

## You will be working with the exercise variable only.

## For each of filters, complete these steps:
## Generate a histogram and make remarks on the shape of the distribution
## Use the method described in this Stack Overflow article to produce two histograms 
## blended together to show the number of dependents in each of the classes: 
## https://stackoverflow.com/questions/3541713/how-can-i-plot-two-histograms-together-in-r
## The answer of interest is posted by "Dirk is no longer here"

# Winter & Summer Histogram
winter.hist <- hist(winter$hrs.exercise.weekly, breaks = 10)
summer.hist <- hist(summer$hrs.exercise.weekly, breaks = 20)  ## need to select smaller bin size to match the first histogram
plot(winter.hist, col = rgb(0,0,1,1/4), xlim=c(0,20), ylim = c(0,30)) ## need to customize xlim and ylim to match 
plot(summer.hist, col = rgb(1,0,0,1/4), xlim=c(0,20), ylim = c(0,30), add=T) ## add=T is the argument that creates the overlay
## rgb(x,y,z,a) ## colour and opacity coordinates in the reg-green-blue + alpha system

## Compute the mean. Verify your work

## Winter
winter.n <- length(winter$hrs.exercise.weekly)
winter.mean <- sum(winter$hrs.exercise.weekly) / winter.n

## Verify
mean(winter$hrs.exercise.weekly)

## Summer
summer.n <- length(summer$hrs.exercise.weekly)
summer.mean <- sum(summer$hrs.exercise.weekly) / summer.n

## Verify
mean(summer$hrs.exercise.weekly)

## Compute the sums of squares. 
## Make diagnostic remarks as in class to gauge whether your calculations are correct

## Winter
winter.centred <- winter$hrs.exercise.weekly - winter.mean
## Diagnostics
round(sum(winter.centred))

winter.ss <- sum(winter.centred^2)

## Summer
summer.centred <- summer$hrs.exercise.weekly - summer.mean
## Diagnostics
round(sum(summer.centred))

summer.ss <- sum(summer.centred^2)

## Compute the variance. Verify your calculation

## Winter
winter.degfree <- winter.n - 1
winter.variance <- winter.ss / winter.degfree

## Verify
var(winter$hrs.exercise.weekly)

## Summer
summer.degfree <- summer.n - 1
summer.variance <- summer.ss / summer.degfree

## Verify
var(summer$hrs.exercise.weekly)

## Compute the standard deviation. Verify your calculation

## Winter
winter.sd <- sqrt(winter.variance)

## Verify
sd(winter$hrs.exercise.weekly)

## Summer
summer.sd <- sqrt(summer.variance)

## Verify
sd(summer$hrs.exercise.weekly)

## Winter Mean: 6.65, sd: 5.29
## Summer Mean: 5.88, sd: 7.15
## Summer exercise appears to be lower but the standard deviations are huge

