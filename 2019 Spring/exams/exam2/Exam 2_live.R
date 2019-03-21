# Clear your environment
rm(list=ls())

### 
### EXAM 2
### 50 points
### 

### Instructions
### 
### BE CONCISE. There are penalties to overly verbose code. This means that you save relevant part 
###     calculations to variables and reuse them wherever needed, throughout the exam. 
### BE ORGANIZED. Annotate your code, create headings and use spacing smartly to make your code readable.
### CLOSED BOOK. This is a closed book exam. Only the cheat sheet and R Studio help may be consulted.
### 
###

# PART 1: Analysis - 40 points
# Load the following data set: 
# DATA ABSTRACT: To study the fitness effects of individual variation in cognitive traits, it is 
# paramount to understand whether traits such as personality and physiological stress influence 
# cognitive performance. We first tested whether budgerigars (a type of parrot in Australia) showed 
# both consistent personalities and cognitive performance across time and tasks. 
# Budgerigars showed consistency in their neophobic (i.e., fear of anything new) tendencies and 
# these tendencies were associated with their exploratory behaviour. Birds were also consistent 
# in how they performed in most of the cognitive tasks (temporal consistency), but were not 
# consistent in their performance across tasks (context consistency). Neophobic and exploratory tendencies 
# determined the willingness of birds to engage only in the seed discrimination task. 

# Data URL: https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/exams/exam2/Exam%202_live.R

## PART A
## 5 pt | What is the concept of the standard error of the mean? Define.
##        Add your answer as a hashtag comment below.

## 1 pt | Load the data into a dataframe

## 5 pt | Compute the standard error of the mean for the "Sociability.2" and "Age.soc..Hab.months." variables. Assign part calculations to variables.

## 6 pt | Produce a bar plot of each variable side by side with SEM. Assign part calculations to variables.

## 4 pt | Compute Cohen's d (effect size) between the following two variables: "Expl..Fam..Envir." (exploration of familiar environments) 
##        and "Expl..Nov..Envir." (exploration of novel environments)

## 5 pt | What does this effect size value mean? Define the concept and the concrete meaning of the above result.
##        Add your answer as a hashtag comment below.

## PART B
## 5 pt | Standardize the "Sociability.2" and "Age.soc..Hab.months." variables. Assign part calculations to variables.

## 2 pt | Assuming a normal distribution, Take the third value in the standardized Sociability.2 and compute the chance level of the observation. 

## 2 pt | Assuming a normal distribution, Take the fifth value in the standardized Age.soc..Hab.months. and compute the chance level of the observation. 

## 5 pt | BONUS - Create a for loop computing the product of the "Sociability.2" and "Age.soc..Hab.months." variables and saving
##        the values in a new variable. 

## PART 2: Correct the mistakes. This is pseudocode, not designed to run. 10 points

# 2 pt | Loading data
exam.data <- read.csv(url(https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/ubcgarbage/garbage_disposal.csv)))
                          
# correct: 

# 2 pt | Computing the mean for proportion correct
prop.corr.sum <- length(exam.data$proportion_correct)
n <- length(exam.data$time_at_bin)
prop.corr.mean <- prop.corr.sum/n
                          
# correct: 

# 2 pt | Produce a histogram of the time at bin variable
hist(exam.data$time_at_bin,
main = "Histogram of time at bin",
xlab= "time at bin (in minutes)"
ylab = "frequency of time at bin"
)
                          
# correct: 

# 2 pt | Centering a variable
prop.corr.centered <- (data$proportion_correct - prop.corr.mean)^2
                          
#correct

# 2 pt | Computing sums of squares
ss <- length(prop.corr.centered)^2
