## Lecutre on t-tests
library(moments)

## Load Disgust Sensitivity Data
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Fall/Data/disgust%20scale/Berger_and_Anaki_disgust_scale_2014_1_comma_delimited_cleaned.csv"
dg_sensitivity <- read.csv(url)

## Variables: 
## "IV" (subject variable) - Political position (0: centre, 2: right wing; ignore 1)
## DV: Disgust sensitivty

## Hypothesis: 
## H_0: There are no differences between the two groups on disgust sensitivity
## H_Maddy: Right wing people in general have higher disgust sensitivity relative to centred ones
## H_Levente: Right wing people in general have lower disgust sensitivity than centred ones

## Work plan
## Check for assumptions
## Is the data normal? (skew, kurtosis, and a histogram) check it on dg filtered by political position
## Are the variances equal (homogeneity)? F_max test to check for that

dg_rightwing <- dg_sensitivity[dg_sensitivity$Political == 2,]
dg_centre <- dg_sensitivity[dg_sensitivity$Political == 0,]

hist(dg_rightwing$Mean_general_ds)

skewness(dg_rightwing$Mean_general_ds) ## very low skewness, definitely <1 so not skewed at all
kurtosis(dg_rightwing$Mean_general_ds) ## 0.10 over mesokurtic (which perfect)

hist(dg_centre$Mean_general_ds)
skewness(dg_centre$Mean_general_ds) ## near perfect skew
kurtosis(dg_centre$Mean_general_ds) ## More leptokurtic than we'd like, but deviation of 1.22 away from 3.0 is not terrible. 

par(mfrow = c(1,2)) ## In R base, a way to create a grid of graphs or any drawings
hist(dg_rightwing$Mean_general_ds, 
     breaks = 10, 
     xlim = c(0,5), 
     ylim = c(0,200), 
     main = "Right Wing",
     xlab = "Disgust Sensitivity")
hist(dg_centre$Mean_general_ds, 
     breaks = 10, 
     xlim = c(0,5), 
     ylim = c(0,200), 
     main = "Centre Block",
     xlab = "Disgust Sensitivity")


## Homogeneity of variance test
sd_right <- sd(dg_rightwing$Mean_general_ds) ## Standard Deviation -- sd()
sd_centre <- sd(dg_centre$Mean_general_ds)

F_max <- sd_centre / sd_right


## Perfect value, very close to 1, way below the threshold of 2.0

## I think the textbook states that +/- 2.0 is quite reasonable

## We can conclude here that this data set and this particular comparison is compatible with a t-test. We can proceed.

## Decide which kind of t-test to conduct?
## Independent samples t-test

## Conduct the t-test
## a) compute means
mean_rightwing <- mean(dg_rightwing$Mean_general_ds)
mean_centre <- mean(dg_centre$Mean_general_ds)

## b) compute variances
## skip this part, it's not needed for the t-test

## c) compute pooled variance (only needed for independent samples t-test)
## A pre-requisite is the sums of squares for each group
deviationscores_right <- dg_rightwing$Mean_general_ds - mean_rightwing
ss_right <- sum(deviationscores_right^2)
n_right <- nrow(dg_rightwing) ## with nrow() no need to specify a column name
df_right <- n_right - 1

deviationscores_centre <- dg_centre$Mean_general_ds - mean_centre
ss_centre <- sum(deviationscores_centre^2)
n_centre <- nrow(dg_centre)
df_centre <- n_centre - 1

pooled_variance <- (ss_centre + ss_right) / (df_right + df_centre)
## The sign of this value must be positive

## d) compute the pooled estimated standard error (s_M we can also use SEM)
## Pseudo code: square root of (pooled variance / sample size1) + (pooled variance / sample size2)
sem <- sqrt( (pooled_variance / n_right) + (pooled_variance / n_centre) )

## e) compute the t-test (mean differences, pooled SEM)

t_value <- (mean_rightwing - mean_centre) / sem
## We have obtained a t-value, but we still don't know how to interpret this number
## ????

## f) we will look up the critical t-value and compare our obtained t-test to the critical t-test in order

## For educational purposes, you want to know the critical t-value so you can make a manual decision
## Critical t-value
critical_t <- qt(p = 0.975, lower.tail = TRUE, df = sum(df_right, df_centre))
## parameter p is the probability value / alpha level but ONE TAIL ONLY: 2.5% 1-2.5% = 0.975
## lower.tail = TRUE means to look at the left side of the distribution
## df = degrees of freedom as calculated in our data


## Our critical t-value is 1.96. Therefore, if our obtained t-value is greater than this value
## we can reject the null hypothesis. 
## In actuality, 3.13 (the sign does not matter), is greater than 1.96. Therefore we reject the null hypothesis. 
## H_0 is rejected, but we don't yet know whether H_Maddy or H_Levente is supported

## In order to see the direction of the effect, we need to create a bar plot

means <- c(mean_rightwing, mean_centre)

sems <- c(
        sd(dg_rightwing$Mean_general_ds) / sqrt(n_right),
        sd(dg_centre$Mean_general_ds) / sqrt(n_centre)
        )

par(mfrow = c(1,1))
midpoints <- barplot(means,
        ylab = "Disgust Sensitivity",
        ylim = c(0,2.5),
        names.arg = c("Right Wing","Centre")) ## Feed the two mean values in here

arrows(midpoints, means-sems,
       midpoints, means+sems,
       code = 3,
       angle = 90,
       length = .05)

## The fact that the error bars are not overlapping highlights the significant differences
## in a visual way. 

## H_Levente is supported.
## H_Maddy is not supported.

## Later, still semi-manual, you can calculate the exact p-value so no manual comparison is needed
t.test(
  dg_centre$Mean_general_ds, 
  dg_rightwing$Mean_general_ds
  )
?t.test

## decide whether or not our means are significant different or not. 
## Our conclusion can be: 
##      Fail to reject the null hypothesis - there is insufficient evidence to conclude that there are differences
##      Reject the null hypothesis: If dg higher for right wing, then H_Maddy support is found
##      Reject the null hypothesis: If dg is lower for rtight wing, then H_Levente support is found






