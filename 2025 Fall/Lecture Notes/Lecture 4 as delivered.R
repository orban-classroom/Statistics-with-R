## Lecture 4, as delivered

## Variance, and Standard Deviation

## Conceptually: 
## 1. Load a data set
## 2. Pre-requisite 1: Calculate the mean
## 3. Pre-requisite 2: Calcualte the sample size
## 4. Sums of squares
## 5. Variance
## 6. Standard Deviation

## 1. LOAD THE DATA
data.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Fall/Data/studentmentalhealth/Sheet%201-Table%201.csv"
student.mental.health <- read.csv(data.url)

## Question: How much variability is there on the "Vocabulary" sub-scale among a student sample?

## 2. & 3. CALCULATE THE MEAN AND SAMPLE SIZE
sum.vocab <- sum(student.mental.health$Vocabulary)
n.vocab <- length(student.mental.health$Vocabulary) ## tells me the sample size for a vector/list

## CAUTIONARY NOTE
length(student.mental.health) ## When applied to the data frame (no columns specified), this calculates how many variables I have in the data
## i.e., telling me the width of the data

## THIS WORK: 
nrow(student.mental.health) ## tells me the sample size for a data frame

mean.vocab <- sum.vocab / n.vocab

## Verification using the built-in function
mean(student.mental.health$Vocabulary)
## Ensures that my manual calculation was correct

## 4. SUMS OF SQUARES

## CLEAN VERSION
## 4.a Compute deviation scores
dev.scores.vocab <- student.mental.health$Vocabulary - mean.vocab
## Indications that you did the right thing: 
## - you get a list of values (not a single)
## - some values should be positive, and some should negative
## - if you sum the scores, you should get something very very close to 0: 
sum(dev.scores.vocab)
# anytime you see a number that contains an "e" and some value after: scientific notation
# e-14 = there are 14 leading zeroes
# 0.000000000000006394885 --> for our purposes, this is a 0

squares.scores <- dev.scores.vocab^2
## Indications that you did the right thing: 
## - still have a list of values
## - all the values are positive

SS.vocab <- sum(squares.scores)
## Indications that you did the right thing: 
## - a single number (not a list)
## - it's a positive value
## - relatively large compared to your original scale

## 5. VARIANCE!

df.vocab <- n.vocab - 1

var.vocab <- SS.vocab / df.vocab
## Indications that you did the right thing: 
## - it's a single value that either positive or negative
## - should be a positive number

## Built-in function to double-check your work
var(student.mental.health$Vocabulary)

## 6. STANDARD DEVIATION

s.vocab <- sqrt(var.vocab)
## Indications that you did the right thing: 
## - should be a number that is smaller than the variance
## - should be a positive number

## Built-in function to double-check your work
sd(student.mental.health$Vocabulary)





