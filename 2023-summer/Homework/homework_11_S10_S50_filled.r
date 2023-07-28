## Optional Homework, Week 11
## Data Set: https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2019%20Spring/data/1100examdata/1100_exam_data.csv


## 1. Conduct assumptions checking
## 2. Make a decision on the type of t-test required
## 3. Implement the appropriate t-test using the manual method
## (Concepts prior to Take-Home Exam 1 can be automatized.)

## Research Question: Are PSYC 1100 students' performance signiciantly different between exam 1 (first column) and exam 2 (second column?
## Note: Each row represents an individual student's performance on two exams. 

exam.data.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2019%20Spring/data/1100examdata/1100_exam_data.csv"
exam.data.df <- read.csv(exam.data.url)

## Sinking your teeth into the program
mean(exam.data.df$exam_1_122/122*100)
mean(exam.data.df$exam_2_100)
## You're looking at the mean of the two exams based on the same scale (normalized)

# Assumptions check for a t-test
# Normality (kurtosis, skewness, means) 

par(mfrow = c(2,1))
  hist(exam.data.df$exam_1_122)
  hist(exam.data.df$exam_2_100)

par(mfrow = c(1,1))
  boxplot(exam.data.df$exam_1_122, exam.data.df$exam_2_100)

library(psych)
skew(exam.data.df$exam_1_122)
skew(exam.data.df$exam_2_100)
  
kurtosi(exam.data.df$exam_1_122)
kurtosi(exam.data.df$exam_2_100)

# Statements: negative skew due to the outliers (students who did not write the exam). Might be justified to drop those data points
# Platykurtic. Generally quite normal

# Homogeneity of variance
# F max test: 
## 1. Compute the variance of each group's data
## 2. Divide the larger variance with the smaller variance
## 3. Rule of thumb: If the value is greater than 3.0, you conclude that the data is not homogeneous. It is heterogenous. 
## 4. If >3.0, the test needs to assume unequal variances

# Option 1: Eyeball the numbers and put the bigger on in the numerator
F_max <- var(exam.data.df$exam_1_122) / var(exam.data.df$exam_2_100)

# Option 2: More sophisticated, let R decide: 

variances <- c(var(exam.data.df$exam_1_122), var(exam.data.df$exam_2_100))

F_max <- max(variances) / min(variances)

# Conclusion: Value is less than 3.0, therefore equality of variances is assumed (homogeneity is true)

# When conducting a t-test with unequal variances
## t.test( var.equal = FALSE)
## Specificy as an argument that the data is heterogenous
## There is no manual calculation to use for heterogenous data

# Independence of observations
## You can't comment on this. You can ask the researcher.

##
##
##

## Decision about t-test: Repeated Measures t-test

## Conduct the t-test
## One difference, you need to a "D" score: Difference score
## Pseudocode: t = D / sem

## D or "Difference" score is a vector
d <- exam.data.df$exam_1_122 - exam.data.df$exam_2_100
mean.d <- mean(d) ## this goes into the numerator of the t-test

## pseudocode: sem <- sqrt(variance / n)

## Built-in variance function to do this: 
var.d <- var(d)
n <- nrow(exam.data.df)
df.total <- n-1

sem.d <- sqrt(var.d / n)

t <- mean.d / sem.d

# Find the critical t-test
qt(p = 0.05/2,
   df = df.total,
   lower.tail = FALSE)

## Statistical Conclusion: The t-test is significant (t = 8.25, p < 0.05). We reject the null hypothesis.
## Research Conclusion: Students performances on the two exams are significant different.
## Note: You cannot come to a conclusion about the direction of the difference. For example, can't say that students performance got better or worse.
## In order come to a conclusion about direction: generate a bar graph with error bars

## Prep the data for a barplot
means <- c(mean(exam.data.df$exam_1_122), mean(exam.data.df$exam_2_100))

midpoints <- barplot(means, ylim = c(0,80), 
                     main = "Student Performance", 
                     names.arg = c("Exam 1","Exam 2")
                     )
# Tell the difference. This is not publishable becaues thie bar plot does not indicate the uncertainty in your result. 
# Basic fact of life: All data has some level of uncertainty. 

## define the error bar upper and lower bounds based on SEM
lower_bounds <- means - sem.d
upper_bounds <- means + sem.d

# midpoints: is the x-coordinate of the two bars on the barplot
arrows(
  midpoints,lower_bounds,
  midpoints,upper_bounds,
  length = 0.05, angle = 90, code =3
)

# When the error bar indicates the SEM, it means that the actual real population mean could be anywhere in that zone.


t.test(exam.data.df$exam_1_122, exam.data.df$exam_2_100, 
       var.equal = TRUE, 
       paired = TRUE)

# Statistical conclusion: This t-test is significant (t = 8.25, p < 0.001). We reject the null hypothesis. 

