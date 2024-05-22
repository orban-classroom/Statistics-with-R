## Lecture 3 as delivered for A10 and L10

## Agenda: 
## Mean calculation
## Median calculation
## Mode calculation

## Mean
## n: sample size - how many observations are there in the data set?
## sum: total sum of all the scores within the data set

## 1: Manual way, as described by equations in the textbook
## 2: Super-fast way: using built-in R functions
## *note: up until the first take-home exam, you will need to use the manual way for all calculations
## but you can use the built-in function to verify your manual calculations

## Load some data: 

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Spring/Data/studentmentalhealth/Sheet%201-Table%201.csv"
mental.health.data <- read.csv(url)

head(mental.health.data)

## Filter the data frame for the variable of interest
## We want the T-score of the STAI instrument

## Guidelines: STAI scores are commonly classified as 
## “no or low anxiety” (20-37), 
## “moderate anxiety” (38-44), 
## and “high anxiety” (45-80)
mental.health.data$T_score.STAI.Trail.Anxiety.Score

## what is the mean anxiety score for this set of participants?
## Pseudocode (not calculable but conceptual correct code)
## T STAI Mean = sum of all scores / sample size

## The Manual Way Required During Take-Home Exam
t.stai.sum <- sum(mental.health.data$T_score.STAI.Trail.Anxiety.Score)
n <- length(mental.health.data$T_score.STAI.Trail.Anxiety.Score)
t.stai.mean <- t.stai.sum / n

## The Fast Way (which you can use AFTER the take-home exam)
mean(mental.health.data$T_score.STAI.Trail.Anxiety.Score)

## Median
## Pseudocode
## T STAI Median = Find the half-way point
## Another way to say it: 
## T STAI Median = total number of values (1/2)

## Filtering Data or Subsetting data
mental.health.data$T_score.STAI.Trail.Anxiety.Score[]
## the use of square brackets after a variable allows you to 
## restrict your view of that data in various ways
## It could a smaller span of data, or a single value

## A single data point that restricts your view to the first value: 
mental.health.data$T_score.STAI.Trail.Anxiety.Score[1]


## A span of data that restricts your view to the first 5 values: 
mental.health.data$T_score.STAI.Trail.Anxiety.Score[1:5]

## Introduce to the ideal of filtering or subsetting variables
half.way <- ceiling(n/2) ## ceiling means round-up
sorted.data <- sort(mental.health.data$T_score.STAI.Trail.Anxiety.Score)
## Pick out the median: 
manual.t.stai.median <- sorted.data[half.way]

## Verification 
median(mental.health.data$T_score.STAI.Trail.Anxiety.Score)

## Mode 
## Definition: Most frequently occurring value
## Psuedocode: Mode = pick out the most common score

sorted.data
## run length encoding: count the occurrence of the same values if they occur more than once
## rle()

## Read this graph and figure out the most frequently occurring values
table(rle(sorted.data))
## The answer must be given in a hashtag comment style because the table is big
## Reading the table, I can see that scores 42 and 43 occur the most, 7x

## Is there a built-in function to calculate the mode?
## No
mode() ## but this does not yield the mode calcualtion from statistics. do not use

## The concept of libraries
## By default you have been using R Base: R with its own built in functions and libraries
## You can extend the functions and libraries but installing user-made libraries.
## How do you install and load these libraries?

## Install a library:
install.packages("lsr") ## this is a library provided with your textbook
## You only do once. Do not keep redoing it in every notebook later on.

## Load the library: Needs to be done in every notebook
library("lsr")

## Built-in function for verification
modeOf(mental.health.data$T_score.STAI.Trail.Anxiety.Score)
# Two modes: 42, 43

## A Bimodal distribution

## Visualize this in at least ways today
## scatter plot + histogram

hist(mental.health.data$T_score.STAI.Trail.Anxiety.Score,
     main = "Histogram of Anxiety T Scores",
     sub = "T-Score of the STAI Instrument", 
     xlab = "Scores of STAI-T",
     ylab = "Frequency of Scores"
     )

## Convert to the language of the research question on mental health
## What can we see here?
## The data indicates that students on average are moderately anxious


plot(mental.health.data$T_score.STAI.Trail.Anxiety.Score,
     main = "University Student Anxiety Scores",
     ylab = "STAI-T Scores")
## index in the x-axis refers to the count of the score in the data set - an arbitrary value

