## Lecture 11 L10

## Repeated sample

rep_examdata.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/1100_exam_data_repeated.csv"
rep_examdata.df <- read.csv(rep_examdata.url)

## This removes all students who have not written either test
rep_examdata.df <- rep_examdata.df[
    rep_examdata.df$exam_1_122 > 0 & 
    rep_examdata.df$exam_2_100 > 0, 
    ]

## Filter

exam1 <- rep_examdata.df$exam_1_122
exam2 <- rep_examdata.df$exam_2_100
## Need to bring the two columns onto the same scale
## Let's bring exam1 onto the scale of 100 (for sanity)

exam1_100 <- exam1 / 122 * 100
  ## divide by the max exam score
  ## multiply by the max score

## leave exam2 as is

## Sanitization
sanitized.exam1 <- na.omit(exam1_100)
sanitized.exam2 <- na.omit(exam2)

## Variances

difference.score <- sanitized.exam1 - sanitized.exam2

## (Optional fun) Attach this score back into the data frame
rep_examdata.df$difference <- difference.score

ss.difference.score <- sum((difference.score - mean(difference.score))^2)

variance.difference.score <- 
  ss.difference.score / 
  (length(difference.score) - 1)

#verify
var(difference.score) ## just a plain variance calculation

stddev.difference.score <- sqrt(variance.difference.score)

#verify
sd(difference.score)

#sem
sem <- stddev.difference.score / sqrt(length(difference.score))

## t-test

t_rep <- mean(difference.score) / sem

t.test(exam1_100, exam2, 
       paired = TRUE, 
       var.equal = TRUE)

## p-value
qt(
  p = 0.05/2,
  df = length(difference.score)-1,
  lower.tail = FALSE
)

2 * pt(
  q = t_rep,
  df = length(difference.score)-1,
  lower.tail = FALSE
)

## Cohen's d
## mean difference divided by standard deviation
cohen.d <- mean(difference.score) / sd(difference.score)
## ranges from 0 - infinity
## 0.2 ~ small effect size
## 0.5 ~ medium effect size
## 0.8+ ~ large effect size

## Interpretation
## Reject the null hypothesis. Significant differences between exam 1 and exam 2 scores are detected in students' progress

## barplot with error

means <- c(mean(sanitized.exam1), mean(sanitized.exam2))
midpoints <- barplot(means,
                     main = "Exam Scores in PSYC 1100",
                     names.arg = c("Exam 1", "Exam 2"),
                     ylim = c(0,85))

sem.1 <- sd(sanitized.exam1) / sqrt(length(sanitized.exam1))
sem.2 <- sd(sanitized.exam2) / sqrt(length(sanitized.exam2))
sem.12 <- c(sem.1, sem.2)

arrows(
  midpoints, means-sem.12,
  midpoints, means+sem.12,
  length = 0.01,
  angle = 90,
  code = 3
)

