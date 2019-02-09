# Lecture 5 

# Exam 1 data
exam.data <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/ubcgarbage/garbage_disposal.csv"))

head(exam.data)
names(exam.data)

## subsetting
## selecting values that match an equal condition
sustainable.bldg <- exam.data[exam.data$condition == 1,]
regular.bldg <- exam.data[exam.data$condition == 2,]

## also ok
exam.data[exam.data$condition == 1,] -> sustainable.bldg

sd(sustainable.bldg$proportion_correct)
sd(exam.data[exam.data$condition == 1,]$proportion_correct)
sd(regular.bldg$proportion_correct)

exam.data[exam.data$proportion_correct <= 0.5,]

mean(sustainable.bldg$proportion_correct)
mean(regular.bldg$proportion_correct)

mean(sustainable.bldg$time_at_bin)
mean(regular.bldg$time_at_bin)

sd(sustainable.bldg$time_at_bin)
sd(regular.bldg$time_at_bin)

# compute the correlation between sustainable and regular buildings
# for both the proportion and time variables

cor(sustainable.bldg$proportion_correct,regular.bldg$proportion_correct)
cor(sustainable.bldg$time_at_bin,regular.bldg$time_at_bin)

## <- assignment operator
## <= less than or equal to
## >= greater than or equal to
## < less than
## > greater than
## == equal to 
## != not equal to

dimensionality <- dim(exam.data[exam.data$time_at_bin > 60,])  
  ## dim() spits out a vector when applied to a data frame

n <- dimensionality[1]  ## picks out the first element of a vector

slow.people <- exam.data[exam.data$time_at_bin > 60,]

# dim = dimension of the data frame
# first number is the sample size
# second number is the number of variables

## applying subsetting to a vector
dimensionality[1:2] ## pick out all the values from the first to the second in the vector
dimensionality

myvars <- dimensionality[2]
myvars
