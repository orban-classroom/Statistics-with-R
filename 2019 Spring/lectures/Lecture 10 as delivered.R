## 
examdata <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/1100examdata/1100_exam_data.csv"))

boxplot(examdata$exam_1_122, examdata$exam_2_100,
        main = "Boxplot of PSYC 1100 Exam data",
        names = c("Exam 1", "Exam 2"),
        ylab = "Score/Grade"
        )

## One-sample t-test

n <- length(examdata$exam_1_122)
df <- n - 1
s_ex2 <- sd(examdata$exam_2_100) ## assuming sample
est_sem <- s_ex2 / sqrt(n)

mu_ex1 <- mean(examdata$exam_1_122)
M_ex2 <- mean(examdata$exam_2_100)

mean_difference <- M_ex2 - mu_ex1

t <- mean_difference/est_sem
t

## Compute the p-value associated with the t-value
## also returns a one-tailed p-value, so you need to multiply by 2
2*pt(t,df) 

## Look up the critical t-value
## returns a one-tailed result. 
## So if you have a two-tailed alpha of 0.05, half it
qt(.025,df)  


## A little fun diversion
## Fabricate your data

data1 <- data.frame(
  x <- rnorm(n = 10, mean = 100, sd = 10),
  d <- rnorm(n = 10, mean = 115, sd = 10)
)
n_data1 <- length(data1$x)
s_data1 <- sd(data1$x)
sem_data1 <- s/sqrt(n)
m1_data1 <- mean(data1$x)
m2_data1 <- mean(data1$d)
t_data1 <- (m1_data1-m2_data1)/sem
t_data1

data2 <- data.frame(
  y <- rnorm(n = 100, mean=100, sd=10),
  e <- rnorm(n = 100, mean = 115, sd = 10)
)

data3 <- data.frame(
  z <- rnorm(n = 1000000, mean=100, sd=10),
  f <- rnorm(n = 1000000, mean = 115, sd = 10)
)

## Related-samples t-test

## Compute the mean difference scores for each individual
diffs <- examdata$exam_1_122 - examdata$exam_2_100
m_diffs <- mean(diffs)
s_diffs <- sd(diffs)
n_diffs <- length(diffs)
df_diffs <- n_diffs - 1
sem_diffs <- s_diffs / sqrt(n_diffs)

t <- m_diffs/sem_diffs
t


## Q-Q Plot: Check for assumption of normality

## produce a normal QQ plot of the variable
qqnorm(examdata$exam_1_122, pch = 1, frame = FALSE)

## adds the reference line
qqline(examdata$exam_1_122, col = "blue", lwd = 2)


qqnorm(examdata$exam_2_100, pch = 1, frame = FALSE)
qqline(examdata$exam_2_100, col = "red", lwd = 2)
