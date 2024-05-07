
exams1100 <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2019%20Spring/data/1100examdata/1100_exam_data.csv")

exam1_mean <- mean(exams1100$exam_1_122)
exam2_mean <- mean(exams1100$exam_2_100)

exam1_sd <- sd(exams1100$exam_1_122)
exam2_sd <- sd(exams1100$exam_2_100)

## z-score calculation
## compare the performance of student 7 and their friend student 25
## on a dataframe: [ <<row>>  , <<column>> ]

student7 <- exams1100[7,]
student25 <- exams1100[25,]

## z = (rawscore - mean) / sd

## student 7, exam 1
(student7$exam_1_122 - exam1_mean) / exam1_sd

## student 7, exam 2
(student7$exam_2_100 - exam2_mean) / exam2_sd

## student 25, exam 1
(student25$exam_1_122 - exam1_mean) / exam1_sd

## student 25, exam 2
(student25$exam_2_100 - exam2_mean) / exam2_sd

## Standardize the entire data set with a single function
scale(exams1100)


## Standard Error of the Mean

n_exam <- nrow(exams1100)

sem_exam1 <- exam1_sd / sqrt(n_exam)

sem_exam2 <- exam2_sd / sqrt(n_exam)
