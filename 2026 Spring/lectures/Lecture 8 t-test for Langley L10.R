## Lecture 8 t-tests
## 
##
library(moments)

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/Rawlings_et_al_chimp_LT_personality_data.csv"
chimp.data <- read.csv(url)

## RQ: Do chimps change in extraversion from Time 1 to Time 2?
## Statistical Hypothesis: I hypothesize a significant difference in extraversion as a function of Time.
## H_1: M_T1extraversion != M_T2extraversion
## H_0: M_T1extraversion = M_T2extraversion

## FILTER + SANITATION
chimp.data$T1.exterversion
chimp.data$T2.extraversion

## ASSUMPTIONS + VISUALS
#### Normality Metrics
skewness(chimp.data$T1.exterversion)
# negative skew that's not that bad (+/- 1.0 away from 0)
kurtosis(chimp.data$T1.exterversion)
# 3.0 perfectly mesokurtic (moments library sets mesokurtic at 3)
# +/- 2.0 is acceptable tolerance
# Slightly platykurtic but not bad

skewness(chimp.data$T2.extraversion)
# this normal (+/- 1.0 away from 0)
kurtosis(chimp.data$T2.extraversion)
# 3.0 perfectly mesokurtic (moments library sets mesokurtic at 3)
# +/- 2.0 is acceptable tolerance
# Slightly platykurtic but not bad

#### Histograms + Boxplots
hist(chimp.data$T1.exterversion,
     breaks = 10,
     xlab = "Scores on Extraversion",
     main = "Personality Characteristics between Time 1 and 2",
     col = rgb(0,0,1,1/2))
hist(chimp.data$T2.extraversion, 
     col = rgb(1,0,0,1/2),
     add=TRUE)

boxplot(chimp.data$T1.exterversion,
        chimp.data$T2.extraversion,
        names = c("T1","T2"),
        main = "Chimp Extraversion as a Function of Time")

#### Homogeneity of Variance Metric
## Pseudocode: F_max <- Greater variance / Smaller variance
max(c(var(chimp.data$T1.exterversion), var(chimp.data$T2.extraversion)))
min(c(var(chimp.data$T1.exterversion), var(chimp.data$T2.extraversion)))

F_max <- 
  max(c(var(chimp.data$T1.exterversion), var(chimp.data$T2.extraversion))) /
  min(c(var(chimp.data$T1.exterversion), var(chimp.data$T2.extraversion)))
F_max

## Automated / built-in method
var.test(chimp.data$T1.exterversion, chimp.data$T2.extraversion)

## Interpretation: If it's less than 2 (2.5), then all is ok
## Diagnostic: if your value is less than 1, you mixed up the numerator/denominator

#### Scatterplot (Detour to correlations)
plot(chimp.data$T1.exterversion,
     chimp.data$T2.extraversion)

cor.test(chimp.data$T1.exterversion,
         chimp.data$T2.extraversion)

## INTERMIEDIATE CALCULATIONS

#### n,df
n_pairs <- nrow(chimp.data) ## remember nrow() uses the data frame, no column/variable
df_pairs <- n_pairs - 1

#### Difference Scores
#### Order of means does not matter
difference_scores <- chimp.data$T1.exterversion - chimp.data$T2.extraversion
## Diagnostics:
sum(difference_scores)

M_D <- sum(difference_scores) / n_pairs
mean(difference_scores) ## same as mean of difference scores

sem <- sd(difference_scores) / sqrt(n_pairs)

#### ? pooled var (s2), pooled sem (s_M)
## Not needed because no such concept in related samples setups

## t-test
#### Decision: independent or related samples?
## Related Samples / repeated measures / within-groups design
## One chimp provides both data points

#### Implementation
#### Pseudocode: t_related <- M_D / sem

t_related <- M_D / sem
#### The sign of the t-test does not matter (it can be positive or negative)
#### Magnitude matters, but you need to calculate the p-value that accompanies this t-test

## this gives the critical t-value
qt(p = 0.025, lower.tail = TRUE, df = df_pairs)
## ignore the sign
## Critical t value = 2.01
## My actual t-value does not exceed the critical t-value
## I fail to reject the null hypothesis
## Using this scheme, I do not know the exact p-value. All I know is that p > 0.05

## We can calculate the exact p-value instead of looking for a proxy critical t
1-pt(t_related, df_pairs, 0.025, lower.tail = TRUE)
## Results Section: 
## t = 1.36, p = 0.08. I fail to reject the null hypothesis: 
## there is no support that chimp extraversion changes from Time 1 to Time 2.
## (What you want to say but can't: Null hypothesis is accepted)

## Effect size
#### Cohen's d

## Barplot + error bars

## Means

## SEM's (ok to use pooled SEM but more accurate with individual SEM)

## CI

## 

