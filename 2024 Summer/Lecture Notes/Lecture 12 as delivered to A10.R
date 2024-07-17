## Lecture Week 12
## Repeated Measures t-test
##  - also known as Related-samples t-test
##  - also known as within-groups design

psych1100.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/1100_exam_data_repeated.csv"
psych1100.df <- read.csv(psych1100.url)

## Filter?
## very simple, refer to the columns
psych1100.df$exam_1_122
psych1100.df$exam_2_100

## Sanitization
## Recode 0 as NA's, and then remove the NA's
## not confirmed on my system
psych1100.df[psych1100.df == 0] <= NA
sanitized.exam <- na.omit(psych1100.df)
nrow(sanitized.exam)

## Drop the 0's
sanitized.exam <- psych1100.df[psych1100.df$exam_1_122 != 0 & psych1100.df$exam_2_100 != 0, ]
nrow(sanitized.exam)

## bring them onto a common scale

sanitized.exam$exam_1_100 <- sanitized.exam$exam_1_122 / 122 * 100

## Repeated-Measures t-test
## - Difference score
## - SEM

difference.score <- sanitized.exam2 - sanitized.exam$exam_1_100
sum(difference.score)

mean.difference.score <- mean(difference.score)
n.difference.score <- length(difference.score)
degfree.difference.score <- n.difference.score - 1
sd.difference.score <- sd(difference.score)
variance.difference.score <- var(difference.score)
sem.difference.score <- sd.difference.score / sqrt(n.difference.score)

## repeated measures t-score
t.score <- mean.difference.score / sem.difference.score

## p-value calculation

qt(
  p = 0.05/2,
  df = degfree.difference.score,
  lower.tail = FALSE
)

## We can reject the null hypothesis. The exams are significantly different from one another (t = 8.24, p < 0.05)

2 * pt(
  q = t.score,
  df = degfree.difference.score,
  lower.tail = TRUE ## because we got a negative value
)
# p = 0.000000000002093018
# new p = 0.000002766
# We can reject the null hypothesis. The exams are significantly different 
# from one another (t = 4.54, p < 0.001)

## Building the barplot is the same as for independent samples t-test

## Let's recalculate more carefully
## - drop all 0's from the dataset at sanitization
## - bring the two exams onto a common scale
##    - standardization does not work, because the m=0, sd=1

## Cohen's d Effect Size
## A reading on how likely it is that you are committing a Type I or Type II error 
## when drawing your conclusions based on the t-test and p-value.

cohens.d <- mean.difference.score / sd.difference.score
## the sign of the value does not matter, just like for t-tests
## Guidance: 
## small effect size (high chance of error) ~ 0.2
## medium effect size (medium chance of error) ~ 0.5
## large effect size (low chance of error) ~ 0.8 + 

## We have medium effect size, some medium chance of TI or TII error.

## Interpretation
## Students exam performance got worse from exam 1 to exam 2, 
## even after dropping student scores who did not write the exam, 
## and after bringing the exams onto a common scale.
