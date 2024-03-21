## Week 12 Lecture


## 1. Standard Error of the Mean (SEM): measure of the discrepancy between your sample mean and the estimated population mean
## It is a measure of uncertainty. 
## It is going to be used in two ways: 
    ## to compute the t-test
    ## also to draw it as an error bar on a bar plot

## 2. Bar plots with error bars

## 3. Cohen's d - effect size

######

## Let's load data: 

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv"
psyc.2300.data <- read.csv(url)

## Filter
## You need a filter that generates a data frame of people who work <15 hours, and those who work >=15 hours per week

high.work <- psyc.2300.data[psyc.2300.data$hrs.work.weekly >= 15,]
low.work <- psyc.2300.data[psyc.2300.data$hrs.work.weekly < 15,]

## Assumption Checking
## Anytime you do t-tests, you need to be mindful of the pre-requisites/assumptions for this test

## Normality

par(mfrow = c(1,2))
  hist(high.work$hrs.exercise.weekly,
       main = "Histogram of Exercise",
       sub = "High Work Condition",
       xlab = "Exercise hours per week",
       breaks = 10
       )
  hist(low.work$hrs.exercise.weekly,
       main = "Histogram of Exercise",
       sub = "Low Work Condition",
       xlab = "Exercise hours per week",
       breaks = 10
       )

## Normality: skewness + kurtosis
library(psych)
skew(high.work$hrs.exercise.weekly)  ## somewhat problematic
skew(low.work$hrs.exercise.weekly) ## <2 is fine

kurtosi(high.work$hrs.exercise.weekly) ## 3 is mesokurtic, 9 is problematic
kurtosi(low.work$hrs.exercise.weekly) ## ideal

par(mfrow = c(1,2))
  boxplot(low.work$hrs.exercise.weekly)
  boxplot(high.work$hrs.exercise.weekly)



## Independence of sampling
## A methodological issue. You can't put a statistical measure on this
## If "Levente's stats students is the population" - then we have population level data. 
## If the population is "all stats students" or "KPU students" or "all Canadians" or "all humans", then the samlpe is not independently sampled

## Homogeneity of variance
## how much dispersion difference is there between the two groups
## we will look at it in week 13

## Sample size difference is within bounds
nrow(high.work)
nrow(low.work)
## The more conservative scientists say a sample size diff of <2x is problematic
## The more liberal scientists say a sample size diff of <10x is problematic

samplesizediff <- nrow(high.work) / nrow(low.work)

## SEM
## standard deviation - measure of dispersion around the mean
## sample size
## Pseudocode: sem = standard deviation / square root of the sample size

high.work.sd <- sd(high.work$hrs.exercise.weekly)
high.work.sqrt.n <- sqrt(nrow(high.work))

high.work.sem <- high.work.sd / high.work.sqrt.n

low.work.sd <- sd(low.work$hrs.exercise.weekly)
low.work.sqrt.n <- sqrt(nrow(low.work))

low.work.sem <- low.work.sd / low.work.sqrt.n

sems <- c(low.work.sem, high.work.sem)

## Generate a bar plot
## 

low.work.mean <- mean(low.work$hrs.exercise.weekly)
high.work.mean <- mean(high.work$hrs.exercise.weekly)

## Make a vector means
means <- c(low.work.mean, high.work.mean)

par(mfrow = c(1,1))
midpoints <- barplot(means,
        main = "Bar plot of weekly exercise hours",
        ylim = c(0,10),
        names.arg = c("Low Work","High Work")
        )

arrows(
  midpoints,means+sems,
  midpoints,means-sems,
  angle = 90,
  length = .1,
  code = 3
)



## Re-running the results with no outliers
low.work.trimmed <- low.work[low.work$hrs.exercise.weekly < 12,]
high.work.trimmed <- high.work[high.work$hrs.exercise.weekly < 20,]

par(mfrow = c(1,2))
  boxplot(low.work.trimmed$hrs.exercise.weekly)
  boxplot(high.work.trimmed$hrs.exercise.weekly)

lw.trimmed.sem <- sd(low.work.trimmed$hrs.exercise.weekly) / sqrt(nrow(low.work.trimmed))  
hw.trimmed.sem <- sd(high.work.trimmed$hrs.exercise.weekly / sqrt(nrow(high.work.trimmed)))
trimmed.sems <- c(lw.trimmed.sem, hw.trimmed.sem)
  
lw.trimmed.mean <- mean(low.work.trimmed$hrs.exercise.weekly)
hw.trimmed.mean <- mean(high.work.trimmed$hrs.exercise.weekly)
trimmed.means <- c(lw.trimmed.mean, hw.trimmed.mean)

par(mfrow = c(1,1))
trimmed.midpoints <- barplot(trimmed.means,
                             main = "Bar plot of weekly exercise hours",
                             ylim = c(0,8),
                             names.arg = c("Low Work","High Work")
                             )

arrows(
  trimmed.midpoints,trimmed.means+trimmed.sems,
  trimmed.midpoints,trimmed.means-trimmed.sems,
  angle = 90,
  length = .1,
  code = 3
)

## Effect size (Cohen's d)
## gauge the chance of committing a Type I or Type II error

## Pseudocode: (mean differences) / average standard deviation

## If the sample sizes are different, this technique is inaccurate
mean(low.work.sd,high.work.sd)

## Pooled standard deviation calculation that accounts for
## sample size differences

pooled.sd <- sqrt(
                (var(low.work$hrs.exercise.weekly)/nrow(low.work)) +
                (var(high.work$hrs.exercise.weekly/nrow(high.work)))
                )

d <- (mean(low.work$hrs.exercise.weekly) - mean(high.work$hrs.exercise.weekly)) / pooled.sd
## large effect size







