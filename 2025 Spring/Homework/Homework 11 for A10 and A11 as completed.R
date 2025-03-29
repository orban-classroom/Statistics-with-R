## Homework 11
##############

## The data set you will use is called "stressdata.csv"
## Relevant columns: stress, 1: stressed participants, 2: not stressed participant
## hrv_rmssd_ibi: Heart-rate variability is a measure of sympathetic nervous system functioning. Uses the small beat to beat variation of your heart beat to estimate how well your nervous system throttles between parasympathetic and sympathetic nervous system activity. Lower numbers typically mean greater stress. 
## cortisol: Standardized cortisol measures indicating amount of cortisol expression widely considered to be the "Stress hormone"
## Task 1: Compute the correlation between HRV (Heart-Rate Variability) and Cortisol under each stress (1) and no-stress (0) conditions. 
## What is the relationship between heart-rate variability and cortisol? Is the relationship identical while participants are under stress or not stressed?
## Task 2: Create a barplot of mean HRV measures for stress + no stress conditions. Add an error bar indicating SEM
## Task 3: Create a barplot of mean cortisol measures for stress + no stress conditions. Add an error bar indicating SEM
## Task 4: Are the HRV differences between stressed and non-stressed individuals significantly different?

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/stressdata.csv"
stress_data <- read.csv(data_link)

## FILTER
## Create a filter that you can call "analysis_dataframe" or something similar that matches your
## variable naming style, and isolate the two variables in question while also removing potential NA cells.

nostress_analysis_dataframe <- na.omit(stress_data[stress_data$stress == 0,])
stress_analysis_dataframe <- na.omit(stress_data[stress_data$stress == 1,])

## PRE-CHECKS
## Generate box-plots and histograms of hrv_rmssd_ibi and cortisol variables split by stress
## Compute skewness and kurtosis values.
## Comment on normality (as per textbook definitions)
library(psych)

hist(nostress_analysis_dataframe$hrv_rmssd_ibi, breaks = 10)
# appears positively skewed and leptokurtic
skew(nostress_analysis_dataframe$hrv_rmssd_ibi)
# substantial positive skew confirmed (1+)
kurtosi(nostress_analysis_dataframe$hrv_rmssd_ibi)
# substantial leptokurtosis

hist(nostress_analysis_dataframe$cortisol, breaks = 10)
# appears positively skewed, leptokurtic
skew(nostress_analysis_dataframe$cortisol)
# severe positive skew (2+)
kurtosi(nostress_analysis_dataframe$cortisol)
# severe leptokurtosis (7+)

hist(stress_analysis_dataframe$hrv_rmssd_ibi, breaks = 10)
# appears positively skewed, leptokurtic
skew(stress_analysis_dataframe$hrv_rmssd_ibi)
# distinct positive skew
kurtosi(stress_analysis_dataframe$hrv_rmssd_ibi)
# nearly mesokurtic

hist(stress_analysis_dataframe$cortisol, breaks = 10)
# appears positively skewed, leptokurtic and outliers on the positive side. 
# the extreme positive values are triggering me to get a boxplot
boxplot(stress_analysis_dataframe$cortisol)
# confirms several extreme outliers on the positive side. This will do a number on skew...
skew(stress_analysis_dataframe$cortisol)
# Severe skew indeeed, nearly 3
kurtosi(stress_analysis_dataframe$cortisol)
# Severe leptokurtosis, 10+

## QUESTION 1
## Compute the covariance between `hrv_rmssd_ibi` and `cortisol` under no stress, and under stress.
## Show your work manually. Verify using built-in function and run diagnostics along the way.

# No Stress

nostress_hrv <- nostress_analysis_dataframe$hrv_rmssd_ibi - mean(nostress_analysis_dataframe$hrv_rmssd_ibi)
nostress_cort <- nostress_analysis_dataframe$cortisol - mean(nostress_analysis_dataframe$cortisol)
nostress_n <- nrow(nostress_analysis_dataframe)
nostress_df <- nostress_n - 1

nostress_cross_products <- nostress_hrv * nostress_cort
nostress_sum_cp <- sum(nostress_cross_products)
cov_nostress <- nostress_sum_cp / nostress_df

# Verification
cov(nostress_analysis_dataframe$hrv_rmssd_ibi, nostress_analysis_dataframe$cortisol)


# Stress
stress_hrv <- stress_analysis_dataframe$hrv_rmssd_ibi - mean(stress_analysis_dataframe$hrv_rmssd_ibi)
stress_cort <- stress_analysis_dataframe$cortisol - mean(stress_analysis_dataframe$cortisol)
stress_n <- nrow(stress_analysis_dataframe)
stress_df <- stress_n - 1

stress_cross_products <- stress_hrv * stress_cort
stress_sum_cp <- sum(stress_cross_products)
cov_stress <- stress_sum_cp / stress_df

# Verification
cov(stress_analysis_dataframe$hrv_rmssd_ibi, stress_analysis_dataframe$cortisol)

## QUESTION 2
## Standardize the four variables and compute the correlation coefficient manually.
## Describe your findings

# No Stress

z_nostress_hrv <- (nostress_analysis_dataframe$hrv_rmssd_ibi - mean(nostress_analysis_dataframe$hrv_rmssd_ibi)) / sd(nostress_analysis_dataframe$hrv_rmssd_ibi)
z_nostress_cort <- (nostress_analysis_dataframe$cortisol - mean(nostress_analysis_dataframe$cortisol)) / sd(nostress_analysis_dataframe$cortisol)

z_nostress_cross_products <- z_nostress_hrv * z_nostress_cort
z_nostress_sum <- sum(z_nostress_cross_products)

z_cov <- z_nostress_sum / nostress_df

# Verification
cor(nostress_analysis_dataframe$hrv_rmssd_ibi, nostress_analysis_dataframe$cortisol)

## No meaningful correlation. For unstressed group there is no relationship between HRV and cortisol. 

# Stress
z_stress_hrv <- (stress_analysis_dataframe$hrv_rmssd_ibi - mean(stress_analysis_dataframe$hrv_rmssd_ibi)) / sd(stress_analysis_dataframe$hrv_rmssd_ibi)
z_stress_cort <- (stress_analysis_dataframe$cortisol - mean(stress_analysis_dataframe$cortisol)) / sd(stress_analysis_dataframe$cortisol)

z_stress_cross_products <- z_stress_hrv * z_stress_cort
z_stress_sum <- sum(z_stress_cross_products)

z_cov <- z_stress_sum / stress_df

# Verification
cor(stress_analysis_dataframe$hrv_rmssd_ibi, stress_analysis_dataframe$cortisol)

# Weak/moderate positive correlation: as HRV goes up, cortisol goes up, for those who are stressed.

## Generate two scatterplots of the variables.
## Comment on the appearance. 

plot(nostress_analysis_dataframe$hrv_rmssd_ibi, nostress_analysis_dataframe$cortisol)
## Noisy plot with most data aggregated in the lower left quadrant: HRV values in the 20-40 region, cortisol values in the -1 - 0 region
## Extreme outliers are noted on the cortisol scale especially in the 20-40 HRV region
## High HRV values less likely to see high cortisol values
## Possible non-linear relationship, which cannot be detected by a correlation coefficient

plot(stress_analysis_dataframe$hrv_rmssd_ibi, stress_analysis_dataframe$cortisol)
## Similar to nostress group but much fewer data points
## Curvilinear negative relationship more apparent in this view

## Generate a barplot and add error bars representing SEM.

hrv_means <- c(mean(nostress_analysis_dataframe$hrv_rmssd_ibi), mean(stress_analysis_dataframe$hrv_rmssd_ibi))
cortisol_means <- c(mean(nostress_analysis_dataframe$cortisol), mean(stress_analysis_dataframe$cortisol))

nostress_hrv_sem <- sd(nostress_analysis_dataframe$hrv_rmssd_ibi) / sqrt(nostress_n)
stress_hrv_sem <- sd(stress_analysis_dataframe$hrv_rmssd_ibi) / sqrt(stress_n)

hrv_sems <- c(nostress_hrv_sem, stress_hrv_sem)

nostress_cortisol_sem <- sd(nostress_analysis_dataframe$cortisol) / sqrt(nostress_n)
stress_cortisol_sem <- sd(stress_analysis_dataframe$cortisol) / sqrt(stress_n)

cortisol_sems <- c(nostress_cortisol_sem, stress_cortisol_sem)

# HRV Barplot
hrv_midpoints <- barplot(hrv_means, 
                         names.arg = c("No Stress", "Stress"), 
                         main = "Variation in HRV between Stressed and Non-stressed Subjects", 
                         ylim = c(0, 40))


arrows(hrv_midpoints, hrv_means - hrv_sems,
       hrv_midpoints, hrv_means + hrv_sems, 
       angle = 90, 
       code = 3, 
       length = .05)

# Cortisol Barplot
cortisol_midpoints <- barplot(cortisol_means, 
                         names.arg = c("No Stress", "Stress"), 
                         main = "Variation in Cortisol between Stressed and Non-stressed Subjects", 
                         ylim = c(-2, 2))


arrows(cortisol_midpoints, cortisol_means - cortisol_sems,
       cortisol_midpoints, cortisol_means + cortisol_sems, 
       angle = 90, 
       code = 3, 
       length = .05)

## Compute an independent samples t-test to check whether the HRV (Dependent Variable) of 
## stressed and non-stressed individuals (Independent Variable) is significantly different. 

# Sums of Squares

ss_stress_hrv <- sum((stress_analysis_dataframe$hrv_rmssd_ibi - mean(stress_analysis_dataframe$hrv_rmssd_ibi))^2)
ss_nostress_hrv <- sum((nostress_analysis_dataframe$hrv_rmssd_ibi - mean(nostress_analysis_dataframe$hrv_rmssd_ibi))^2)

# Pooled Variance

pooled_variance <- (ss_stress_hrv + ss_nostress_hrv) / (nostress_df + stress_df)

# Pooled SEM

pooled_sem <- sqrt(pooled_variance/nostress_n + pooled_variance/stress_n)

# Independent t-test value

t_value <- (mean(nostress_analysis_dataframe$hrv_rmssd_ibi) - mean(stress_analysis_dataframe$hrv_rmssd_ibi)) / pooled_sem

# Critical t value from the t-distribution table using a df of 769 and a two-tailed alpha of 0.05: 1.96
df_total <- nostress_df + stress_df


# The obtained t-value is below the critical t-value of 1.96, therefore we fail to reject the null hypothesis. 
# There is no difference in the HRV levels of stressed and non-stressed subjects.  

# Verification
t.test(nostress_analysis_dataframe$hrv_rmssd_ibi, stress_analysis_dataframe$hrv_rmssd_ibi, var.equal = TRUE, alternative = "two.sided", paired = FALSE)




## end of homework