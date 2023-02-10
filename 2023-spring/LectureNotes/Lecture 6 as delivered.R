## Lecture 5
## #########

## Pick a dataset: 
df <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2019%20Spring/data/ubcgarbage/garbage_disposal.csv")

head(df)

## Conceptually
## 1 Calculate a deviation score for the time_at_bin variable
## 2 Calcualte a deviation score for the proportion_correct variable
## 3 Sum them up separately
## 4 Multiply together
## 5 Divide them by the df

## Actually
## Pre-requisites

# filtered vectors
time_at_bin <- df$time_at_bin ## one simple way
time_at_bin <- df[,4] ## another simple way
time_at_bin <- df[,"time_at_bin"] ## another simple way
proportion_correct <- df$proportion_correct

# sample size & degrees of freedom
n <- length(df$subject_id) ## option 1, calculate one of the columns
n <- nrow(df) ## option 2, calculate the number of rows in the data frame
deg.freedom <- n - 1

  
# The mean, manually

## Time at Bin
sum.time_at_bin <- sum(time_at_bin)
mean.time_at_bin <- sum.time_at_bin / n

## verification
mean(time_at_bin)

## Proportion Correct
sum.proportion_correct <- sum(proportion_correct)
mean.proportion_correct <- sum.proportion_correct / n

## verification
mean(proportion_correct)

## COVARIANCE CALCULATION
## Deviation scores

deviation.time_at_bin <- (time_at_bin - mean.time_at_bin)

## veritification, that it sums to 0
sum(deviation.time_at_bin)

deviation.proportion_correct <- (proportion_correct - mean.proportion_correct)

## verification that is sums to 0
sum(deviation.proportion_correct)

deviation.product <- sum(deviation.time_at_bin * deviation.proportion_correct)

covariance <- deviation.product / deg.freedom

## CORRELATION COEFFICIENT
## possible numbers in a range of -1.0 to +1.0
## -1.0 = perfect inverse correlation (negative correlation)
## +1.0 = perfect positive correlation

## correlation = covariance / (std.dev1 * std.dev2)

## VARIANCE for each variable

## proportion_correct
proportion_deviation <- proportion_correct - mean.proportion_correct
## verification
sum(proportion_deviation)

proportion_ss <- sum(proportion_deviation^2)
proportion_variance <- proportion_ss/deg.freedom
## verification
var(proportion_correct)

proportion_s <- sqrt(proportion_variance)
## verification
sd(proportion_deviation)

## time_at_bin

time_at_bin_deviation <- time_at_bin - mean.time_at_bin
## verification
sum(time_at_bin_deviation)

time_at_bin_ss <- sum(time_at_bin_deviation^2)

time_at_bin_variance <- time_at_bin_ss / deg.freedom
## verification
var(time_at_bin)

time_at_bin_s <- sqrt(time_at_bin_variance)
## verification
sd(time_at_bin)

## CORRELATION (PEARSON'S R)

r <- covariance / (proportion_s * time_at_bin_s)

## Regression (this now an inferential statistical computation)

## Scatter plot
plot(time_at_bin, proportion_correct, main = "Scatter Plot between Time-at-bin and Proportion Correct variables")
abline(regression_model)

regression_model <- lm(formula = proportion_correct ~ time_at_bin, data = df)

summary(regression_model)


