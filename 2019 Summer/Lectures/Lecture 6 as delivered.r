
rm(list = ls(c()))

## Let's find the z-scores

examdata <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/1100examdata/1100_exam_data.csv"))

# Produce a variable that contains the mean for both exams

n <- length(examdata$exam_1_122)
df <- n - 1

mymean.exam1 <- sum(examdata$exam_1_122) / n
mymean.exam2 <- sum(examdata$exam_2_100) / n
mymean.exam1
mean(examdata$exam_1_122)
mymean.exam2
mean(examdata$exam_2_100)

# Produce another variable that contains the standard deviation for both exams

sd.exam1 <- sqrt(sum((examdata$exam_1_122 - mymean.exam1)^2)/df)
sd.exam1
sd(examdata$exam_1_122)
sd.exam2 <- sqrt(sum((examdata$exam_2_100 - mymean.exam2)^2)/df)
sd.exam2
sd(examdata$exam_2_100)

# z-score
# pseudocode: 
# z = rawscore - mean / stdev

# picked out the first value
examdata$exam_1_122[1]  ## subsetting the data
examdata$exam_1_122

z1 <- (examdata$exam_1_122[1] - mymean.exam1) / sd.exam1
z1_wrong <- examdata$exam_1_122[1] - mymean.exam1 / sd.exam1 ## division

# compute the z score of the second exam for the same student

z2 <- (examdata$exam_2_100[1] - mymean.exam2) / sd.exam2

## convert all scores to z-scores, fast way
zscores <- scale(examdata$exam_1_122)

## pick out the highest z-scores
max(zscores)

### What is the chance level associated with the first student's first exam

pnorm(z1)
pnorm(zscores[9]) ## lower.tail = TRUE by default
pnorm(max(zscores), lower.tail = FALSE)


### Take a chance level, and convert it to a z-score
qnorm(0.00000001)
qnorm(.95)


## Load another data set

data <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/2300classdata/data.csv"))
## look at exercise weekly

## mean 
n <- length(data$hrs.exercise.weekly)
exmean <- sum(data$hrs.exercise.weekly)/n



## compute the z-score of the 5th value



## comptue the zscore of all values at once

## find the chance level associated with the minimum and maximum values


