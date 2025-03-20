## Lecture 10 for A10
##
library(psych)

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/studentmentalhealth.csv"
mentalhealth <- read.csv(data_link)


## Research Question: Is there a difference in anxiety between low and high social skilled individuals?
## Hypothesis: 
## H0: Social skill scores will not have any impact on anxiety ratings
## H1: Social skill scores of 5 or lower will have significantly different anxiety ratings compared to those with social skill scores of greater than 5.

## We need first confirm H1, and then we can visualize using a barplot and error bars to confirm H1b or H1c
## H1b: Participants with a social skill score of 5 or lower will have higher anxiety ratings
## H1c: Participants with a social skill score of greater than 5 will have lower anxiety ratings

low_social <- mentalhealth[mentalhealth$AQ_1.social.skill <= 5,]
high_social <- mentalhealth[mentalhealth$AQ_1.social.skill > 5,]


## Check assumptions

## 1. Normality

hist(low_social$T_score.STAI.Trail.Anxiety.Score)
skew(low_social$T_score.STAI.Trail.Anxiety.Score)
## very mild, not an issue
kurtosi(low_social$T_score.STAI.Trail.Anxiety.Score)
## quite platykurtic

hist(high_social$T_score.STAI.Trail.Anxiety.Score)
skew(high_social$T_score.STAI.Trail.Anxiety.Score)
## very mild, positive skew, not an issue
kurtosi(high_social$T_score.STAI.Trail.Anxiety.Score)
## quite platykurtic


## 2. Homogeneity
## Will show you next week


## t-test 
## Pseudocode: Mean difference / pooled SEM
## Requires: Means
## Requires: pooled SEM
## Requires: pooled variance
## Requires: Sums of Squares and degrees of freedom

ls_mean <- mean(low_social$T_score.STAI.Trail.Anxiety.Score)
hs_mean <- mean(high_social$T_score.STAI.Trail.Anxiety.Score)

ls_n <- nrow(low_social)
hs_n <- nrow(high_social)

ls_df <- ls_n - 1
hs_df <- hs_n - 1
total_df <- ls_df + hs_df

ls_ss <- sum((low_social$T_score.STAI.Trail.Anxiety.Score - ls_mean)^2)
hs_ss <- sum((high_social$T_score.STAI.Trail.Anxiety.Score - hs_mean)^2)

## Pooled variance pseudocode: (SS1 + SS2) / (df1 + df2) 
pooled_variance <- (ls_ss + hs_ss) / (ls_df + hs_df)

## Pooled SEM
pooled_SEM <- sqrt((pooled_variance/ls_n) + (pooled_variance/hs_n))

## t-test
t.value <- (ls_mean - hs_mean) / pooled_SEM
## The sign (negative or positive) is irrelevant

## To determine the significant of this value, we will use the ancient method of using a t distribution table
## Google: t-distribution table

## Critical t as per the t distribution table is 1.984. This is the t-value where the p-value is 0.05

## Because our t-value 3.222, which is greater than the critical t-value, we can conclude that our p-value
## is less than 0.05. Consequently, we reject the null hypothesis and find support for the alternative hypothesis. 

means <- c(ls_mean, hs_mean)
sems <- c(pooled_SEM, pooled_SEM) ## better to replace it with the individual SEM calculations

midpoints <- barplot(means,
                     names.arg = c("Low Social Skill", "High Social Skill"), 
                     ylab = "Anxiety Score", 
                     ylim = c(0, 60)
                     )
arrows(
  midpoints, means+sems,
  midpoints, means-sems, 
  angle = 90,
  code = 3, 
  length = 0.1
)


