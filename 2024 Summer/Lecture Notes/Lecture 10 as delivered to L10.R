## Lecture Week 11

## How do we conduct a t-test?
## How do we conduct an effect size calculation?

## Data
stress.data <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/stressdata.csv"
stress.df <- read.csv(stress.data)

## Research Hypothesis: 
## The stress and no-stress conditions have significantly different cortisol levels.

## Statistical Hypothesis: 
## M_stress != M_nostress

## TASKS
## ########
## Load relevant libraries
library(moments)


## Filtering

stress <- stress.df[stress.df$stress == 1, ]
no.stress <- stress.df[stress.df$stress == 0, ]

## Sanitization
## ## Remove NA values

sanitized.stress <- na.omit(stress)
sanitized.no.stress <- na.omit(no.stress)

## Assumption Checks
## ## Normality (skewness, kurtosis, histograms, boxplots)

## Stress

hist(sanitized.stress$cortisol)
skewness(sanitized.stress$cortisol)
## There is a substantial positive skew that exceeds 1.0
kurtosis(sanitized.stress$cortisol)
## This is a strong leptokurtic distribution, exceeding 3.0

## No Stress
hist(sanitized.no.stress$cortisol)
skewness(sanitized.no.stress$cortisol)
## Roughly the same level of positive skew as the stress condition
kurtosis(sanitized.no.stress$cortisol)
## Roughly the same level of leptokurtosis as the stress condition

boxplot(sanitized.no.stress$cortisol, sanitized.stress$cortisol)
## a lot of outliers on the positive end

## ## Homogeneity of Variance (F Max)
## The F Max test divides the larger variance with the smaller variance. 
## If the result is greater than (either 2.0 or 2.5), you call the data heterogenuous
stress.variance <- sd(sanitized.stress$cortisol)
no.stress.variance <- sd(sanitized.no.stress$cortisol)
variances <- c(stress.variance, no.stress.variance)

## F MAx = (larger variance) / (smaller variance)
F_max <- max(variances) / min(variances)
F_max
## Well below the decision threshold so we can declare the data to be homogeneous.
## Similar variances between the two groups is a marker that the samples for each group
## are drawn from the same population.

## Central Tendencies
stress.n <- nrow(sanitized.stress)
stress.mean <- mean(sanitized.stress$cortisol)

no.stress.n <- nrow(sanitized.no.stress)
no.stress.mean <- mean(sanitized.no.stress$cortisol)

## Variability (+ Pooled Variance)
stress.var <- var(sanitized.stress$cortisol)
no.stress.var <- var(sanitized.no.stress$cortisol)

## Average variance calculation: 
## The simple and wrong way to do it, is to take the average: 
## (Not *that* wrong: this is correct is the sample size between the two groups is the same)
sum(stress.var, no.stress.var)/2

## (Sums of Squares stress + Sums of Squares no stress) / (degrees of freem stress + degrees of freedom no stress)
stress.ss <- sum((sanitized.stress$cortisol - stress.mean)^2)
no.stress.ss <- sum((sanitized.no.stress$cortisol - no.stress.mean)^2)

## NEW CONCEPT WARNING
pooled_variance <- (stress.ss + no.stress.ss) / ((stress.n - 1) + (no.stress.n - 1))

## Standard Error of the Mean
## based on the pooled variance
pooled.sem <- sqrt(pooled_variance / stress.n + pooled_variance / no.stress.n)
## Do not use this for the barplot. Only for the t-test

## t-test (Independent Samples)
## t.test = (mean difference) / (pooled sem)
## it doesn't matter whether the t-value is positive or negative
independent.t.test <- (stress.mean - no.stress.mean) / pooled.sem
independent.t.test
## What the heck does this mean???

## p-value calculation

## What is the p-value with which this t-value of 1.26 corresponds?

## The old school way: use the look-up table
combined_df <- (stress.n - 1) + (no.stress.n - 1)
## According to the table, the critical t-value is 1.984. This means that if my t-value exceeds this critical
## t-value, I can reject the null hypothesis (I have significance). 
## That's not the case here. t = 1.26, p > 0.05 because critical t = 1.984 is greater than actual t of 1.26.


## Using R, we can find out the exact critical t-value: 

qt(
  p = 0.05 / 2, ## because it's two-tailed, essentially 0.025
  df = combined_df, 
  lower.tail = FALSE
)

## t = 1.26, p > 0.05 because critical t = 1.963 is greater than actual t of 1.26.


## To get the exact p-value, 

2 * pt(
  q = independent.t.test, 
  df = combined_df,
  lower.tail = FALSE
)

## Multiply by two to make a one-tailed calculation applicable to two-tails

## The results are t = 1.26, p = 0.103. Fail to reject the hypothesis
## Stress does not cause an increase or a decrease in cortisol levels.

t.test(sanitized.no.stress$cortisol, sanitized.stress$cortisol,
       var.equal = TRUE)


## barplot with error bars

stress.sem <- sd(sanitized.stress$cortisol) / sqrt(stress.n)
no.stress.sem <- sd(sanitized.no.stress$cortisol) / sqrt(no.stress.n)

sems <- c(stress.sem, no.stress.sem)

 <- c(stress.mean, no.stress.mean)

midpoints <- barplot(
                  means,
                  ylim = c(-.2, .2),
                  main = "Cortisol levels in function of Stress",
                  names.arg = c("Stress", "No Stress")
              )
arrows(
  midpoints, means+sems,
  midpoints, means-sems,
  angle = 90,
  code = 3, 
  length = 0.1
)



?arrows
