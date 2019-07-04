mydata <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/1100examdata/1100_exam_data.csv"))

## you can use the ultra fast functions for: 
## mean, sd, var, cov, cor, scale, 

## Step 1: standardize the exam scores, and save each in a new column within the existing dataframe.

mydata$exam1 <- scale(mydata$exam_1_122)
mydata$exam2 <- scale(mydata$exam_2_100)  
  
## Step 2: Assume exam 1 is the population data, and exam 2 is the sample
## Is exam 2 significantly different from exam 1?

# sem <- standard deviation / squareroot of the sample size
sem_exam1 <- sd(mydata$exam1)/sqrt(length(mydata$exam2))
z <- (mean(mydata$exam1) - mean(mydata$exam2)) / sem_exam1  
round(z, 3) ### if you find scientific notation... crappy

## Step 2: What is the effect size

cohens.d <- (mean(mydata$exam1) - mean(mydata$exam2)) / sd(mydata$exam1)


