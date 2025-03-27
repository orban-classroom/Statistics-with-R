library(psych) ## skew() kurtosi() mesokurtic is 3.0
## Lecture 11 as delivered to A10

## Mental Health Data
data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/studentmentalhealth.csv"
ment_health <- read.csv(data_link)


## Research Hypothesis
## There are sex differences on the anxiety scale as measured by the T Score. 

## Statistical Hypothesis
## We will detect significant differences between males (1) and females (2) on the T-score of the anxiety scale


## What kind of a t-test is this?
## Independent Samples t-test
## t = M_d / SEM(pooled)

## FILTER
colnames(ment_health)
male_anx <- ment_health[ment_health$male1.female2 == 1, "T_score.STAI.Trail.Anxiety.Score"]
female_anx <- ment_health[ment_health$male1.female2 == 2, "T_score.STAI.Trail.Anxiety.Score"]


## Check out the assumptions before conducting the t-test

## Independence of observatiosn
## Nothing you can do here. But you should find out how the data was collected (recruitment, sampling etc)


## Normality (t-test requires normally distributed data)

hist(male_anx, breaks = 10)
skew(male_anx)
## virtually no skew. very good skew measurement
kurtosi(male_anx)
## quite leptokurtic, -0.3 (relative to mesokurtic which is 3.0).  In third year you might learn about data transformations

hist(female_anx, breaks = 10)
skew(female_anx)
## mild positive skew, nothing to worry about
kurtosi(female_anx)
## fairly significant leptokurtosis. In third year you might learn about data transformations

par(mfrow = c(1,1)) ## this allows you to create a panel of graphs
  hist(male_anx, breaks = 10)
  hist(female_anx, breaks = 10)


## Homogeneity of variance

var(male_anx)
var(female_anx)  

## manually
f_max <- var(male_anx) / var(female_anx)
## very close to one (very far from the threshold of 3.0) therefore this data is homogeneous
## You can assume equal variance in the t-test calculation


## t: Mean Difference
mean_diff <- mean(male_anx) - mean(female_anx)

## t: SEM(pooled)

male_ss <- sum((male_anx - mean(male_anx))^2)
female_ss <- sum((female_anx - mean(female_anx))^2)

male_n <- length(male_anx)
female_n <- length(female_anx)

male_df <- male_n - 1
female_df <- female_n - 1
total_df <- male_df + female_df

pooled_variance <- (male_ss + female_ss) / (male_df + female_df)

pooled_sem <- sqrt((pooled_variance/male_n) + (pooled_variance/female_n))

t_value <- mean_diff / pooled_sem

## A way to calculate the exact p-value
2 * pt(t_value, total_df, lower.tail = TRUE) ## one-tailed p-value calculator
## if t is negative, lower.tail is TRUE, if t is positive, lower.tail is FALSE

## qt - calculates your critical t value

## Research conclusion: 
## We fail to reject the null hypothesis. There is no indication of sex differences in T anxiety score (t = 0.00, p = .999)

t.test(male_anx, female_anx, alternative = "two.sided", paired = FALSE, var.equal = TRUE)

## Problem 2

## Stress Data
stress_data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/stressdata.csv"
stress_data <- read.csv(stress_data_link)

## Research Hypothesis
## Stressed participants will significantly differ in their HRV measurements across their data collection windows. 
## Statistical Hypothesis
## Participants with a stress=1 state will show a significant difference in HRV between data collection window of 0 and data collection window of 1.

## FILTER

time0 <- stress_data[stress_data$Data_collection_window == 0 & stress_data$stress == 1, "hrv_rmssd_ibi"]
time1 <- stress_data[stress_data$Data_collection_window == 1 & stress_data$stress == 1, "hrv_rmssd_ibi"]

## Assumption checks

## 1. Independence of observations
## Refer to research methods

## 2. Normality
hist(time0, breaks = 10)
skew(time0)
## showing a distinct positive skew
kurtosi(time0)
## significant leptokurtosis (relative to 3.0)
## This variable would benefit from a data transformation step (i.e., normalization)

hist(time1, breaks = 10)
skew(time1)
## showing a positive skew, potentially problematic
kurtosi(time1)
## better kurtosis, closer to 3.0 but still distinctly leptokurtic

par(mfrow = c(1,2))
  hist(time0, breaks = 10)
  hist(time1, breaks = 10)

## 3. Homogeneity
  ## In a related-samples (within-groups) design, there is no concern of homogeneity of variance
  ## because the same participant is exposed to both conditions

## t = D / SEM
  
D_score <- time0 - time1
n_D <- length(time0) ## pick either vector since they come as a pair
df_D <- n_D - 1
ss <- sum(D_score^2)
variance_D <- ss/df_D
sem_D <- sqrt(variance_D / n_D)
  
t_val_D <- mean(D_score) / sem_D
  
## Determine significane by computing the corresponding p-value
2 * pt(t_val_D, df_D, lower.tail = FALSE)
  
## Based on these results (t = 0.18, p > 0.05), we fail to reject the null hypothesis.
## There is no evidence of HRV differences between time 0 and time 1 for stressed participants. 

t.test(time0, time1, 
       alternative = "two.sided", 
       paired = TRUE, 
       var.equal = TRUE, 
       conf.level = 0.95)

  
  
  
  
  
  
