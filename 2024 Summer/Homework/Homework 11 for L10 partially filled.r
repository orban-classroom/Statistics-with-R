## Homework, Week 11
## Data Set: 1100_exam_data_independent

## Research Question: Are PSYC 1100 students' performance significantly different between exam 1 and exam 2?

examdata.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/1100_exam_data_independent.csv"
examdata.df <- read.csv(examdata.url)

## 1. Load relevant libraries
library(moments)

## 2. Filter the data
exam1 <- examdata.df[examdata.df$exam_num == 1,]
exam2 <- examdata.df[examdata.df$exam_num == 2,]

## 3. Sanitize the data
sanitized.exam1 <- na.omit(exam1)
sanitized.exam2 <- na.omit(exam2)

## 3. Conduct assumptions checking
## 3. a) Normality
## 3. b) Homogeneity of variance
## 4. Compute variances, including pooled variance

ss.exam1 <- sum((sanitized.exam1$score - mean(sanitized.exam1$score))^2)
ss.exam2 <- sum((sanitized.exam2$score - mean(sanitized.exam2$score))^2)

## pooled variance is weighted average of the two variances (weighted by the sample size)
pooled.variance <- (ss.exam1 + ss.exam2) / 
  ((nrow(sanitized.exam1) - 1) + (nrow(sanitized.exam2) -1))


## Because the sample sizes are the same between the two groups, 
## a simple average will yield the same result
var(sanitized.exam1$score)
var(sanitized.exam2$score)

simple.averaged.variance <- (var(sanitized.exam1$score) + var(sanitized.exam2$score)) / 2


## 5. Compute pooled standard error of mean## 5. Compute poolescored standard error of mean
## 6. Conduct independent samples t-test
## 7. Compute critical t-value, and exact p-value

exam1.degfree <- nrow(sanitized.exam1)
exam2.degfree <- nrow(sanitized.exam2)

combined_df <- (exam1.degfree - 1) + (exam2.degfree - 1)

qt(
  p = 0.05 / 2,
  df = combined_df,
  lower.tail = FALSE
)

2 * pt(
  q = 4.47,
  df = combined_df,
  lower.tail = FALSE ## if t-score is positive, if negative, use set TRUE
)

## 8. Interpret results
## 9. Create a bar chart showing means, and add error bars indicating standard errof of the mean (not pooled)
