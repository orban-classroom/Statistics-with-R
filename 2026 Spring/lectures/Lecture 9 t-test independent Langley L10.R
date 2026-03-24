library(moments)

## Independent samples t-test 

## One score provided by participant (univariate statistics)
## A participant is only providing data for one condition of the experiment

## RQ: Do HRV values differ between stressed and non-stressed individuals?
## Research Hypothesis: We will observe significant difference on the HRV scores (DV) 
##     as a function stress (IV)
## Statistical Hypothesis: 
## H_0: M_stressed = M_nonstressed
## H_1: M_stressed != M_nonstressed

## Load Data
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/stressdata.csv"
stressdata <- read.csv(url)

## Filter + Sanitize the Data
stressed <- na.omit(stressdata[stressdata$Data_collection_window == 0 & stressdata$stress == 1,])
unstressed <- na.omit(stressdata[stressdata$Data_collection_window == 0 & stressdata$stress == 0,])

## Assumption Checks
## Independence of observations
## This means that we cannot use more than one observation per participant
## for the purposes of an independent samples t-test
## Solution: Restrict our analysis to window 0

## Normality: skewness, kurtosis, histogram and boxplots
kurtosis(stressed$hrv_rmssd_ibi) # 3.0 +/ 2.0 (1 - 5 is ok)
skewness(stressed$hrv_rmssd_ibi) # 0 +/ 1.0 (-1 to +1 is ok)

kurtosis(unstressed$hrv_rmssd_ibi) # slightly leptokurtic
skewness(unstressed$hrv_rmssd_ibi) # < 1.0

hist(stressed$hrv_rmssd_ibi,
     main = "HRV as a function of Stress",
     xlab = "HRV Scores",
     col = rgb(0,1,0,1/2))
hist(unstressed$hrv_rmssd_ibi, add = TRUE,
     col = rgb(1,0,0,1/2))

boxplot(
  stressed$hrv_rmssd_ibi,
  unstressed$hrv_rmssd_ibi,
  main = "Boxplots of HRV as a Function of Stress",
  names = c("Stressed", "Unstressed")
)

## Homogeneity of variance
## FMax (Later in 3rd year, you might learn Levene's)

f_max <- var(stressed$hrv_rmssd_ibi) / var(unstressed$hrv_rmssd_ibi)
f_max ## under 2.5 so we say it's okay

var.test(stressed$hrv_rmssd_ibi, unstressed$hrv_rmssd_ibi)

#################################
## Interim calcualtions for t-test
stressed_mean <- mean(stressed$hrv_rmssd_ibi)
unstressed_mean <- mean(unstressed$hrv_rmssd_ibi)
mean_difference <- stressed_mean - unstressed_mean

## Pooling Problem

## Step 1: Sums of Squares for each group
stressed_deviation <- stressed$hrv_rmssd_ibi - stressed_mean
stressed_ss <- sum(stressed_deviation^2)

unstressed_deviation <- unstressed$hrv_rmssd_ibi - unstressed_mean
unstressed_ss <- sum(unstressed_deviation^2)

## Step 2: Variance for each group -- skip
## Step 3: Pool the variances
stressed_df <- nrow(stressed) - 1
unstressed_df <- nrow(unstressed) - 1
total_df <- stressed_df + unstressed_df

pooled_var <- (stressed_ss + unstressed_ss) / (stressed_df + unstressed_df)

## Step 4: Derive the pooled estimated SEM
pooled_sem <- sqrt(pooled_var / stressed_df + pooled_var / unstressed_df)

################
## t-test logic
################
## Pseudocode: t = mean_differences / estimated SEM

## Compute t-value
t_value <- mean_difference / pooled_sem

## Choose alpha level
## alpha = 0.05 (0.01 or 0.001
## two-tailed (in some cases one-tailed))

## Work through the p-value determination
## 3 possibilites: 
##   A) you are in a paper-and-pencil class. open the back of your textbook
##     t-distribution table, which gives some pre-calcualted p-values
##      My critical t-value is 1.684. My actual t-value 0.25 (drop the sign)
##      My actual t-value is less than the critical t-value
##      I fail to reject the null hypothesis. Consequently H_0 is in effect
##      t = 0.25, p > 0.05

##   B) Critical in R
##    qt function thinks in one-tailed terms. Convert your two-tailed 
##    expectations into one-tailed definition. 
##    alpha = 0.05 two-tailed is a alpha = 0.025 one-tailed
qt(0.025,total_df,lower.tail = TRUE)
##      My critical t-value is 2.00. My actual t-value 0.25 (drop the sign)
##      My actual t-value is less than the critical t-value
##      I fail to reject the null hypothesis. Consequently H_0 is in effect
##      t = 0.25, p > 0.05

##    C) Find the actual p-value (my recommended technique)
2*pt(abs(t_value), total_df, lower.tail = FALSE)
##      You can forget about the concept of critical t-values
##      My actual t-value is 0.25.
##      I fail to reject the null hypothesis. Consequently H_0 is in effect
##      t = 0.25, p = 0.796

t.test(stressed$hrv_rmssd_ibi, unstressed$hrv_rmssd_ibi, 
       paired = FALSE, var.equal = TRUE)

## Draw conclusions, link back to research question
## There are no difference in HRV measurements across stressed and unstressed 
## individual, if we look at time window 0.
