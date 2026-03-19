## Lecture 8 on t-tests
library(moments)

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/Rawlings_et_al_chimp_LT_personality_data.csv"
chimp.data <- read.csv(url)

## RQ: Do chimps' reactivity (jumpy of defensive) change over time?
## Hypothesis: Reactivity measures between T1 and T2 will be significantly different.
## Statistical Hypothesis: 
## H_0 (null): T1.reactivity = T2.reactivity
## H_1: T1.reactivity != T2.reactivity

## FILTER & SANITATION
chimp.data$T1.reactivity
chimp.data$T2.reactivity

## NORMALITY -> ASSUMPTIONS CHECKING
## Normality Metrics: Skewness and kurtsosis
skewness(chimp.data$T1.reactivity)
## Normal/unskewed data is 0. Very close to 0 (< +/-1), therefore normal
kurtosis(chimp.data$T1.reactivity)
## Mesokurtic is 3.0 (< +/- 2 is fine). Mesokurtic, within tolerance

skewness(chimp.data$T2.reactivity)
## Fairly normal
kurtosis(chimp.data$T2.reactivity)
## Within mesokurtic limits

hist(chimp.data$T1.reactivity,
     col = rgb(0,0,1,1/2),
     xlab = "T1 and T2 Reactivity",
     main = "Histogram of Reactivity across T1 and T2")
hist(chimp.data$T2.reactivity,
     col = rgb(1,0,0,1/2),
     add = TRUE)


boxplot(chimp.data$T1.reactivity,
        chimp.data$T2.reactivity,
        names = c("Time 1", "Time 2"),
        main = "Boxplot of Reactivity in Chimps from T1 to T2")


## Homogeneity of Variance
## Are the variances across the two groups relatively equal?
## If they are not, then you have heterogeneity of variance: 
## it's possible that your group's samples did not come from the same population
## In related samples setting, it's impossible to find a problem with this.

## Pseudocode: F_max <- greater variance / smaller variance
var(chimp.data$T1.reactivity)
var(chimp.data$T2.reactivity)
## eyeball which is the greater value and put that one in the numerator

F_max <- var(chimp.data$T2.reactivity) / var(chimp.data$T1.reactivity)
## This number should be less than 2.5, then you're in the clear
## If the number is less than 1, then you reversed the numerator and denominator

var.test(chimp.data$T2.reactivity, chimp.data$T1.reactivity)

## Interim tests to build up to the t-test

## Decision on t-test:
## Since we have the same chimp providing multiple data points for T1 and T2,
## this is a related samples / repeated measures / within-groups design

Reactivity.Difference.Score <- chimp.data$T2.reactivity - chimp.data$T1.reactivity
## this might feel similar to deviation score, but it's not
sum(Reactivity.Difference.Score)

Mean.Difference.Score <- mean(Reactivity.Difference.Score)

n.Difference.Score <- nrow(chimp.data) ## nrow() only needs the data frame name, no column names
df.Difference.Score <- n.Difference.Score - 1

sem <- sd(Reactivity.Difference.Score) / sqrt(n.Difference.Score)

## Releated-Samples t-test

t_test <- Mean.Difference.Score / sem

## The sign of the t-test does not matter. It can be positive or negative, we don't care
## The size of the number matters - but we need to compare it either to the critical t-value
## OR calculate the exact p-value that corresponds with the t-value

## Option A: Critical t-value concept
## Find out the t-value at the location of p = 0.05
qt(0.025, df.Difference.Score, lower.tail = TRUE)

## The critical t-value is 2.01. That means that if your actual t value was 2.01, then you would have a p = 0.05 chance that your results were due to random variation.
## In this case, you actually have t value of 7.40, which greater than 2.01. Therefore, p < 0.05
## Consequently: I reject the null hypothesis, t = 7.40, p < 0.05

## Option B: Calculate the p-value exactly
2 * pt(-abs(t_test), df.Difference.Score, lower.tail = TRUE)

## 1.597248e-09 ==> 0.000000000597248 - p-value is actually tiny, way smaller than 0.05
## You wouldn't report a number to the 9th decimal
## You trim it at 3, and you report: p < 0.001
## Consequently: I reject the null hypothesis, t = 7.40, p < 0.001

## Interpret the statistics in the context of the research question: 
## Chimp's reactivity went down from T1 to T2, leading us to think that they were less jumpy and defensive between the time points. 

