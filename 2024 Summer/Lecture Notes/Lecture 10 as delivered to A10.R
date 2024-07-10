## Lecture Week 11

## Research Question: Is there a difference in Heart-Rate Variability between stressed and non-stressed participants?
## Statistical Hypothesis: HRV values will be significantly different between stressed and non-stresed participants
## Mathematically: M_HRV(stressed) != M_HRV(non-stressed)

## Load the data: 
stress.data.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/stressdata.csv"
stress.data.df <- read.csv(stress.data.url)

## OUR TASKS
## ##########
## Load relevant libraries
library(moments) ## for skewness and kurtosis calculatiosn

## Filter the data
## I know that I need to split by stress and only need the HRV data

analysis.stress <- stress.data.df[stress.data.df$stress == 1, 4]
analysis.no.stress <- stress.data.df[stress.data.df$stress == 0, 4]
## note that specifying a single column converted the object into a vector - equivalent to a c()

## Sanitize the data
## To remove NA values and impossible values
sanitized.stress <- na.omit(analysis.stress)
sanitized.no.stress <- na.omit(analysis.no.stress)

stress.n <- length(sanitized.stress)
no.stress.n <- length(sanitized.no.stress)

## Check assumptions
## ## Normality: distribution shape, assisted skewness and kurtosis measures + boxplot

hist(
    sanitized.stress, 
    col = rgb(0.1, .5, .5, 0.5), 
    breaks = 20, 
    xlim = c(0,200),
    ylim = c(0,80)
    )
hist(sanitized.no.stress, col = rgb(.5, 0, .5, 0.5), breaks = 20, add = T)

## you can see the shocking difference sample size
## both graphs are positively skewed, possibly both might a little leptokurtic

skewness(sanitized.stress)
## lovely, just a bit positively skewed, 1.09 (relative to 0)

kurtosis(sanitized.stress)
## mesokurtic, quite ideal at 3.31 (relative to 3.0)

skewness(sanitized.no.stress)
## good skew, a little positive, 1.34 (relative to 0)

kurtosis(sanitized.no.stress)
## that is somewhat leptokurtic at 5.09, relative to 3.0

boxplot(sanitized.no.stress, sanitized.stress, names = c("No Stress", "Stress"))
## The no stresse data has a lot more outliers
## Stress condition median appears to be offset

## ## Homogeneity of variance
## F Max test: dividing the larger variance with the smaller variance
## If the F Max value is less than 2.0, you conclude that you have homogeneity of variance
## Beyond 2.0, you have heterogeneity of variance, and your assumption is not met

variances <- c(var(sanitized.no.stress), var(sanitized.stress))
F_max <- max(variances) / min(variances)
F_max
## We have homogenetiy of variance
## Large sample size differences can foreshadow issues here. 

## Central Tendencies
stress.mean <- mean(sanitized.stress)
no.stress.mean <- mean(sanitized.no.stress)

## Variability

stress.variance <- var(sanitized.stress)
no.stress.variance <- var(sanitized.no.stress)

## ## Pooled Variance
## ## Finding the average variance across the two groups
## Here is a simple but wrong way to do it
(stress.variance + no.stress.variance) / 2

## Need to take into account the sample size of each group
stress.ss <- sum((sanitized.stress - stress.mean)^2)
no.stress.ss <- sum((sanitized.no.stress - no.stress.mean)^2)
pooled.variance <- (stress.ss + no.stress.ss) / ((stress.n - 1) + (no.stress.n - 1))

## Standard Error of the Mean
pooled.sem <- sqrt(pooled.variance / stress.n + pooled.variance / no.stress.n)

## Independent samples t-test
independent.t.test <- (stress.mean - no.stress.mean) / pooled.sem
## sign of the result does not matter. Only its magnitude
## a t-score can only be interpreted alongside a corresponding p-value

combined_df <- (stress.n - 1) + (no.stress.n - 1)

## p-value calculation
## 1. the old school textbook method
## Use the lookup table to find the critical t value
## critical t-value: 1.660
## the critical t-value represents the t-score at which the p-value is 0.05
## Compare the actual t-value with the critical t-value: 
## If the actual t-value exceeds the critical t-value, your alternative hypothesis is confirmed. 
## -1.39 is less than 1.66: 
## conclusion: I fail to reject the null hypothesis
## The results indicate that we have no effect of stress on HRV (t = 1.39, p > 0.05)

## 2. a new method to do the old school way here in R

qt(
  p = 0.05 / 2, ## alpha of 0.05 divided by two because it's a two-tailed test
  df = combined_df, 
  lower.tail = FALSE ## tells are to look on both sides
)

## The precise critical t-value: 1.9630
## conclusion: I fail to reject the null hypothesis
## The results indicate that we have no effect of stress on HRV (t = 1.39, p > 0.05)


## 3. a way to actually get the p-value
## If the t-score is negative, either take the absolute value of the t score to remove the negative sign using abs()
## or set the lower.tail parameter to be TRUE

2 * pt(
  q = abs(independent.t.test), 
  df = combined_df, 
  lower.tail = FALSE
)
## multiply by two for a two-tailed test
## conclusion: I fail to reject the null hypothesis
## The results indicate that we have no effect of stress on HRV (t = 1.39, p = 0.163)

## Built-in function to do all of this in one line: 

t.test(sanitized.no.stress, sanitized.stress,
       var.equal = TRUE
       )


## Barplot with error bars

stress.sem <- sd(sanitized.stress) / sqrt(stress.n)
no.stress.sem <- sd(sanitized.no.stress) / sqrt(no.stress.n)

sems <- c(stress.sem, no.stress.sem)
means <- c(stress.mean, no.stress.mean)

midpoints <- barplot(
  means,
  ylim = c(0,50), 
  names.arg = c("Stress", "No Stress")
)

arrows(
  midpoints, means+sems,
  midpoints, means-sems,
  angle = 90, 
  code = 3, 
  length = 0.1
)



