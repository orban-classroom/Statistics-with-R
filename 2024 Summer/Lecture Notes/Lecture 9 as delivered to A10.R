## Lecture Week 9 
## 
library("moments")
examdata_url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023%20Summer/Data/2300exam.csv"
examdata_df <- read.csv(examdata_url)

## Research Question: Is there a correlation between homework and exam results?

## Tasks
########
## Filter the relevant variables

analysis_df <- examdata_df

## Sanitize the data
## Drop students who did not produce either a homework or a exam score
## Keep students who produced a homework score but not an exam score
## Drop any potential NA values
sanitized_df <- na.omit(analysis_df[analysis_df$hwk != 0 | analysis_df$ex1 != 0,])

## Normality Check

hist(sanitized_df$hwk)
skewness(sanitized_df$hwk)
# no skew = 0; -1.54 is somewhat negatively skewed
kurtosis(sanitized_df$hwk)
# mesokurtic = 3.00; 5.36 is platykurtic

hist(sanitized_df$ex1)
skewness(sanitized_df$ex1)
# no skew = 0; -1.26 is mild negative skew
kurtosis(sanitized_df$ex1)
# mesokurtic is 3.0; this close to mesokurtic

boxplot(sanitized_df$hwk, sanitized_df$ex1, names = c("Homework", "Exam"))

## Compute the covariance
## Ingredients: n, mean, degrees of freedom, deviation scores
examdata_n <- nrow(sanitized_df)
homework_mean <- mean(sanitized_df$hwk)
exam_mean <- mean(sanitized_df$ex1)

deviation_hwk <- sanitized_df$hwk - homework_mean
round(sum(deviation_hwk)) ## Diagnostics
deviation_ex <- sanitized_df$ex1 - exam_mean
round(sum(deviation_ex)) ## Diagnostics

cov.hwk.ex <- sum(deviation_hwk * deviation_ex) / (examdata_n - 1)
## Verify
cov(sanitized_df$hwk, sanitized_df$ex1)
## There appears to be a positive relationship, but can't judge its magnitude

## Standardize the data
## Ingredients: standard deviation, deviation scores

z.hwk <- deviation_hwk / sd(sanitized_df$hwk)
## Mean = 0, Standard Deviation = 1
## Diagnostics
round(sum(z.hwk))
sd(z.hwk)
## Built-in function
scale(sanitized_df$hwk)

z.ex <- deviation_ex / sd(sanitized_df$ex1)
## Diagnostics
round(sum(z.ex))
sd(z.ex)

## We have the option now to plot the data together: 

hist(z.hwk, col = rgb(0, 0, 1, 0.5), xlim = c(-4,4), ylim = c(0, 20))
hist(z.ex, col = rgb(0, 1, 0, 0.5), add = T)

boxplot(z.hwk, z.ex, names = c("Homework", "Exam"))

plot(z.hwk, z.ex)

## Compute the correlation
## Ingredients: repeat the covariance calculation on the standardized vectors

cor.hwk.ex <- sum(z.hwk * z.ex) / (examdata_n - 1)

## Verify
cor(sanitized_df$hwk, sanitized_df$ex1)

## r = +0.41
## Moderate positive association between homework and exercise even
## after dropping data points where both homework and exam scores were 0.

## Let's re-run the correlation with pairs of 0's retained. 

cor(examdata_df$hwk, examdata_df$ex1)
## r = +0.64

## Standard Error of Mean - S.E.M.
## A measure of uncertainty in your sample data

## 1. Let's generate a barplot

hwk.mean <- mean(sanitized_df$hwk)
ex.mean <- mean(sanitized_df$ex1)
means <- c(hwk.mean, ex.mean)

midpoints <- barplot(means, 
        main = "Mean Homework and Exam Scores",
        names.arg = c("Homework", "Exam"),
        ylim = c(0,80)
        )

midpoints
## SEM: standard deviation, sample size
hwk.sem <- sd(sanitized_df$hwk) / sqrt(examdata_n)
ex.sem <- sd(sanitized_df$ex1) / sqrt(examdata_n)
sems <- c(hwk.sem, ex.sem)

arrows(midpoints, means - sems,
       midpoints, means + sems, 
       angle = 90, 
       length = 0.1, 
       code = 3
       )


