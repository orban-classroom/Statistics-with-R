## Lecture 4

## Find a dataset

statsclass <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-spring/data/2300data.csv")

head(statsclass)

## Select a variable(s) to work with

screentime <- statsclass$hrs.screentime.weekly
workhours <- statsclass$hrs.work.weekly

head(screentime)
head(workhours)

## Prerequisites
## Sample size
screentime.n <- length(screentime)
workhours.n <- length(workhours)

screentime.n == workhours.n

n <- length(screentime)
df <- n-1

## Mean
screentime.mean <- sum(screentime) / screentime.n

## Degrees of Freedom
screentime.df <- screentime.n - 1

## Variability calculations
## Deviation score
screentime.deviation <- screentime - screentime.mean

### Verification. Does it sum up to zero?
sum(screentime.deviation)

## Sum of Squares
## square each score and sum it
screentime.ss <- sum(screentime.deviation^2)
## to verify that you have something reasonable: 
## something that is positive
## something that is much larger than your original scores

## This is a common wrong way to do it (square term outside of the sum function)
sum(screentime.deviation)^2

## Variance

screentime.variance <- screentime.ss/screentime.df

## Standard Deviation

screentime.s <- sqrt(screentime.variance)

## Superfast ways of doing variance and standard deviation

var(screentime)
sd(screentime)
