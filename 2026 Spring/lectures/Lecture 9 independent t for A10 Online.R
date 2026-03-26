library(moments)

## Independent samples t-test

## Definition: one participant one score (as long as we are in the univariate world -- meaning one Dependent Variable)

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/stressdata.csv"
stressdata <- read.csv(url)

## RQ: Does Heart Rate Variability (HRV) change as a function of stress levels?
## Research Hypothesis: HRV will be significant different as a function of stress levels (0 vs 1)
## Statistical Hypothesis: 
## H_0: HRV-Mean_stress = HRV-Mean_unstress
## H_1: H_0: HRV-Mean_stress != HRV-Mean_unstress

#########################
## Filter + Sanitization of the Data

stressed <- na.omit(stressdata[stressdata$Data_collection_window == 0 & stressdata$stress == 1,])
unstressed <- na.omit(stressdata[stressdata$Data_collection_window == 0 & stressdata$stress == 0,])

#####################
## Assumption Checks
## Normality: kurtosis, skewness, generate histograms and boxplots
kurtosis(stressed$hrv_rmssd_ibi) ## Mesokurtic is 3.0 +/- 2.0. Slightly platykurtic but within range 
skewness(stressed$hrv_rmssd_ibi) ## Symmetric is 0 +/- 1. On the edge of okay, positive skew

kurtosis(unstressed$hrv_rmssd_ibi) ## Perfectly mesokurtic
skewness(unstressed$hrv_rmssd_ibi) ## Noticeable positive skew

hist(stressed$hrv_rmssd_ibi, 
     col = rgb(0,1,0,1/2),
     main = "Histogram of HRV Scores as a function of Stress",
     xlab = "Scores of HRV")
hist(unstressed$hrv_rmssd_ibi, 
     add = T,
     col = rgb(0,0,1,1/2))

boxplot(stressed$hrv_rmssd_ibi,unstressed$hrv_rmssd_ibi,
        main = "Boxplot of HRV as a function of Stress",
        names = c("Stressed", "Unstressed"),
        ylab = "HRV Scores (ms)")

## Independence of Observations
## Is the data properly filtered in this case?
## We restricted our analysis to time window 0, in order to meet this assumption (avoid pseudoreplication).

## Homogeneity of Variance
## F Max
var(stressed$hrv_rmssd_ibi)
var(unstressed$hrv_rmssd_ibi)

f_max <- var(stressed$hrv_rmssd_ibi) / var(unstressed$hrv_rmssd_ibi)
f_max
## Since the variance ratio is 1.65 and less than ~2.5, homogeneity is certain

var.test(stressed$hrv_rmssd_ibi, unstressed$hrv_rmssd_ibi)
## F_Max = 1.65, p = 0.1995, therefore we have homogeneity of variance

##########################
## Interim Calculation (stuff we need before we can do the t-test)
## sample size, degrees of freedom, means
n_stressed <- nrow(stressed)
n_unstressed <- nrow(unstressed)

degfree_stressed <- n_stressed - 1
degfree_unstressed <- n_unstressed - 1
degree_total <- degfree_stressed + degfree_unstressed

m_stressed <- mean(stressed$hrv_rmssd_ibi)
m_unstressed <- mean(unstressed$hrv_rmssd_ibi)
mean_difference <- m_stressed - m_unstressed

## Pooled variance, pooled standard error

ss_stressed <- sum((stressed$hrv_rmssd_ibi - m_stressed)^2)
ss_unstressed <- sum((unstressed$hrv_rmssd_ibi - m_unstressed)^2)

pooled_variance <- (ss_stressed + ss_unstressed) / (degfree_stressed + degfree_unstressed)

pooled_sem <- sqrt((pooled_variance / n_stressed) + (pooled_variance / n_unstressed))

##########################
## Implement an independent samples t-test
## t, mean differences + standard error
## t = mean_diff / standard error
t_ind <- mean_difference / pooled_sem
## ignore the sign of the value (doesn't matter if it's positive or negative)

## What is my alpha value??
## The alpha is based ona convention that sometimes varies between scientific fields. 
## Most commonly in Psychology, it's alpha = 0.05

## t-value distribution helps determine what the p-value associated with this actual t-value is going to be

## OPTION A: Before R, before computers, in the paper and pencil world, statistics textbooks included 
## a t-distribution table in the back of the textbook
## Look up the table with total df + your alpha, and find the critical t-value
## The p-value is exactly 0.05 when the critical t-value is 1.69
## Logic: If my actual t-value is greater than 1.69, then I have a situation p < 0.05
## On converse: if my actual t-value is less than 1.69, then I have situation with p > 0.05
## If p > 0.05, then I fail to reject the null (Wanna say that null is true)
## If p < 0.05, then I reject the null (wanna say that my hypothesis is true)
## t = 0.258, p > 0.05 (critical t-value is 1.69), so I must fail to reject the null. 
## Conclusion: There are no deteacble or statistical significant differences between the two groups

## OPTION B: You can calcualte the exact p-value, since in R it's trivially easy. 
## You can forget about the idea of a critical t-value

## Set it up for right tail 
2 * pt(abs(t_ind), degree_total, lower.tail = FALSE)
## Is my p less than or greater than 0.05?
## p = 0.79
## I conclude that t = 0.25, p = 0.79 leads to a conclusion of a fail to reject the nul. 
## Conclusion: There are no deteacble or statistical significant differences between the two groups

## Logic of Determining Significant
## Need to know your pre-set alpha level
## Estimate or actually calculate your p-level
## Draw some kind of a conclusion (research conclusion)


## Automatic built-in
t.test(stressed$hrv_rmssd_ibi, unstressed$hrv_rmssd_ibi, paired = FALSE, var.equal = TRUE)


