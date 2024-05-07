## t-test Lecture 12


## install.packages("moments") ## to do this one time

library(moments)

dataframe <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-spring/data/2300data.csv")

## Conduct an independent samples t-test

## Assumptions to check
## Is this data structure good for independent-samples or related-samples t-test?

## yes, this data is good for an independent-samples t-tests

## Is the normal?

#### filter
colnames(dataframe)
precovid <- dataframe[dataframe$Semester == 201910, "hrs.exercise.weekly"]
postcovid <- dataframe[dataframe$Semester == 202310, "hrs.exercise.weekly"]

hist(precovid, breaks = 10)
skewness(precovid)
kurtosis(precovid)

hist(postcovid, breaks = 10)
skewness(postcovid)
kurtosis(postcovid)

## Is the variance homogeneous?

var(precovid)
var(postcovid)

#### F-Max test for homogeneity. 
#### Divide the bigger variance with the smaller variance
#### Fast-rule: If the number is more than 3, you have problem

F_max <- var(precovid) / var(postcovid) ## Make sure you put the bigger variance in the numberator

#### There is homogeneity of variance

##################################################

## milestone 1: pooled variance
## variance_pooled = (SS_precovid + SS_postcovid) / (df_precovid + df_postcovid)

#### SS_precovid
deviation_precovid <- precovid - mean(precovid)
sum(deviation_precovid)
ss_precovid <- sum(deviation_precovid^2)

#### SS_postcovid
deviation_postcovid <- postcovid - mean(postcovid)
sum(deviation_postcovid)
ss_postcovid <- sum(deviation_postcovid^2)

df_precovid <- length(precovid) - 1
df_postcovid <- length(postcovid) - 1
df_combined <- df_precovid + df_postcovid

pooled_variance <- (ss_precovid + ss_postcovid) / (df_precovid + df_postcovid)

## milestone 2: pooled SEM
## sqrt(var_pooled / n_precovid + var_pooled / n_postcovid)

n_precovid <- length(precovid)
n_postcovid <- length(postcovid)

sem <- sqrt(pooled_variance / n_precovid + pooled_variance / n_postcovid)

## milestone 3: t-test (independent-samples)

mean_precovid <- mean(precovid)
mean_postcovid <- mean(postcovid)

t_test <- (mean_precovid - mean_postcovid) / sem

## Obtain the critical t-value
qt(p=.05/2, df=df_combined, lower.tail = FALSE)

### Statistical conclusion
## The actual t-test value of 1.51 (ignore the negative sign) is smaller than the critical t-value of 2.02
## We accept the null hypothesis
## There are meaningful differences in exercise levels between the pre-covid and post-covid Statistics classes. 

dataframe_verification <- dataframe[dataframe$Semester == 201910 | dataframe$Semester ==202310,]

t.test(hrs.exercise.weekly ~ Semester, data = dataframe_verification, 
       alternative = "two.sided",
       paired = FALSE,
       var.equal = TRUE)

