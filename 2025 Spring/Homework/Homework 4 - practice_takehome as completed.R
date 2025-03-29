

## ***PRACTICE*** TAKE-HOME EXAM
## PSYC 2300 - APPLIED STATISTICS 1
## INTENDED DURATION: 2 hours (not monitored)

## EXAM REGULATIONS (IF IT WAS REAL): 
## 1. Do not discuss the exam with anyone.
## 2. You can message Dr. Orban with any questions, including feedback on homework performance to assist with answers on this exam.
## 3. You may use resources such as the textbook, lecture slides, lecture R notes and homework to complete this exam. 
## 4. Do not talk to classmates. 
## 5. Do not talk to tutors, on online forums or any other means
## This is an exam. Rule violations will be investigated by the dean's office for academic integrity violation. 

## About the Data Set: 
## The data set describes chimpanzees' risky behaviours and correlates to their 
## stress levels as measured by the presence of cortisol hormone, and their 
## testosterone levels, among other variables. 

## File name on GitHub: Rosati_etal_ChimpanzeeAdolescence-Data_TaskRelations

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/Rosati_etal_ChimpanzeeAdolescence-Data_TaskRelations.csv"
chimp_data <- read.csv(data_link)

## Variables you will use are: "RiskAffectScore", "Cortisol", "Testosterone"

chimp_data$RiskAffectScore
chimp_data$Cortisol
chimp_data$Testosterone

## NORMALITY
## Assess each of the three variables for normality. Draw on your of knowledge of normal curves, 
## skew, kurtosis, outliers, variability to make your conclusions. Use technical language (as per textbook) and visualizations.
## such as histograms and boxplots to support your arguments. 
## Keep your work clean with headings and comment your code.

library(psych)

hist(chimp_data$RiskAffectScore, breaks = 10)
skew(chimp_data$RiskAffectScore)
## mild positive skew
kurtosi(chimp_data$RiskAffectScore)
## slighly platykurtic

hist(chimp_data$Cortisol, breaks = 10)
skew(chimp_data$Cortisol)
## mild negative skew
kurtosi(chimp_data$Cortisol)
## nearly perfect kurtosis, mesokurtic

hist(chimp_data$Testosterone, breaks = 10)
skew(chimp_data$Testosterone)
## mild negative skew
kurtosi(chimp_data$Testosterone)
## mild platykurtosis

## CENTRAL TENDENCIES
## Where is the middle of the data -- for each of the three variables?
## Justify your answer using concepts of normality, and measures of central tendencies. 
## All calculations using the manual method (but you can use built-in functions for verification)
## Keep your work clean with headings and comment your code.

## RISK AFFECT SCORE
## Mean
sum_risk <- sum(chimp_data$RiskAffectScore)
n_risk <- nrow(chimp_data)
mean_risk <- sum_risk / n_risk

## Median
## even n: mean of two middle values
sorted_risk <- sort(chimp_data$RiskAffectScore)
n1_mid <- sorted_risk[n_risk/2]
n2_mid <- sorted_risk[n_risk/2+1]
middle_values <- c(n1_mid, n2_mid)
median_risk <- mean(middle_values)

## Verification
median(chimp_data$RiskAffectScore)

## Mode
table(rle(sorted_risk))
## 0 is the mode

## Verification
modeOf(chimp_data$RiskAffectScore)

## CORTISOL
sum_cortisol <- sum(chimp_data$Cortisol)
n_cortisol <- nrow(chimp_data)
mean_cortisol <- sum_cortisol / n_cortisol

## Verification
mean(chimp_data$Cortisol)

## Mode
n_cortisol
## n is even 
sorted_cortisol <- sort(chimp_data$Cortisol)
n1_mid_cortisol <- sorted_cortisol[n_cortisol/2]
n2_mid_cortisol <- sorted_cortisol[n_cortisol/2+1]
middle_values_cortisol <- c(n1_mid_cortisol, n2_mid_cortisol)
median_cortisol <- mean(middle_values_cortisol)

# Vertification
median(chimp_data$Cortisol)

# Mode
table(rle(sorted_cortisol))
# Multimodal

modeOf(chimp_data$Cortisol)

## TESTOSTERONE
sum_testo <- sum(chimp_data$Testosterone)
n_testo <- nrow(chimp_data)
mean_testo <- sum_testo / n_testo

# Verification
mean(chimp_data$Testosterone)

# Median
# n is even
sorted_testo <- sort(chimp_data$Testosterone)
n1_mid_testo <- sorted_testo[n_testo/2]
n2_mid_testo <- sorted_testo[n_testo/2+1]
middle_values_testo <- c(n1_mid_testo, n2_mid_testo)
median_testo <- mean(middle_values_testo)

## Verification
median(chimp_data$Testosterone)

# Mode
table(rle(sorted_testo))
# Multimodal

modeOf(sorted_testo)

## Concept question: can the mean, median and mode be identical for a data set?

## Yes it can happen in a perfectly normal distribution

## VARIABILITY
## Compute variance and standard deviation of each of the three variables.
## Keep your work clean with headings and comment your code. 
## Compute interim variables (deviation scores, sums of squares)

## RISK AFFECT SCORE
centred_risk <- chimp_data$RiskAffectScore - mean_risk
squared_risk <- centred_risk^2
ss_risk <- sum(squared_risk)
df_risk <- n_risk - 1
variance_risk <- ss_risk / df_risk
sd_risk <- sqrt(variance_risk)

## Verification
var(chimp_data$RiskAffectScore)
sd(chimp_data$RiskAffectScore)

## CORTISOL
centred_cortisol <- chimp_data$Cortisol - mean_cortisol
squared_cortisol <- centred_cortisol^2
ss_cortisol <- sum(squared_cortisol)
df_cortisol <- n_cortisol - 1
variance_cortisol <- ss_cortisol / df_cortisol
sd_cortisol <- sqrt(variance_cortisol)

## Verification
var(chimp_data$Cortisol)
sd(chimp_data$Cortisol)

## TESTOSTERONE
centred_testosterone <- chimp_data$Testosterone - mean_testo
squared_testosterone <- centred_testosterone^2
ss_testo <- sum(squared_testosterone)
df_testo <- n_testo - 1
var_testo <- ss_testo / df_testo
sd_testo <- sqrt(var_testo)

## Verification
var(chimp_data$Testosterone)
sd(chimp_data$Testosterone)
