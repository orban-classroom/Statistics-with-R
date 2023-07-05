

## TAKE-HOME EXAM 1
## PSYC 2300 - APPLIED STATISTICS 1
## WINDOW: JUNE 20 - 22
## DURATION: 2 hours

## EXAM REGULATIOMS: 
## 1. Do not discuss the exam with anyone.
## 2. You can message Levente with any questions, including feedback on homework performance to assist with answers on this exam.
## 3. You may use resources such as the textbook, lecture slides, lecture R notes and homework to complete this exam. 
## 4. Do not talk to classmates. 
## 5. Do not talk to tutors, online forums or any other means
## This is an exam. Rule violations will be taken to the dean's office for investigations of academic integrity. 

## About the Data Set: 
## The data set describes chimpanzees' risky behaviours and correlates to their 
## stress levels as measured by the presence of cortisol hormone, and their 
## testosterone levels, among other variables. 

## Raw GitHub Link: https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-summer/Data/Rosati_etal_ChimpanzeeAdolescence-Data_TaskRelations.csv
## Pretty GitHub link (in case you need to re-generate the Raw link): https://github.com/orban-classroom/Statistics-with-R/blob/master/2023-summer/Data/Rosati_etal_ChimpanzeeAdolescence-Data_TaskRelations.csv

d <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-summer/Data/Rosati_etal_ChimpanzeeAdolescence-Data_TaskRelations.csv")

## Alternate
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-summer/Data/Rosati_etal_ChimpanzeeAdolescence-Data_TaskRelations.csv"
chimpdata <- read.csv(url)

## Variables you will use are: "Risk", "Cortisol", "Testosterone"

# Method 1 (make no reference to it at all here at this stage)
d$Risk
d$Cortisol
d$Testosterone

# Method 2
riskVector <- d$Risk
cortVector <- d$Cortisol
testoVector <- d$Testosterone

# Method 3 (not so good - works but yucky)
risk.vector <- d[1:40,"Risk"]
cort.vector <- d[1:40,"Cortisol"]
testo.vector <- d[1:40, "Testorine"]

# Method 3b (a better way)
risk.vector <- d[,"Risk"]
cort.vector <- d[,"Cortisol"]
testo.vector <- d[, "Testorine"]


## NORMALITY - 30% 
## Assess each of the three variables for normality. Draw on your of knowledge of normal curves, 
## skew, kurtosis, outliers, variability to make your conclusions. Use technical language and visualizations
## such as histograms and boxpots to support your arguments. 
## Keep your work clean with headings and comment your code.

# Bare minimum
par(mfrow = c(2,2))
  hist(d$Risk)
  hist(d$Cortisol)
  hist(d$Testosterone)

# Comments
#  Risk is very platykurtic, looks skewed (maybe positive), outliers above 0.8
#  Cortisol is decently normal: leptokurtic, very little positive skew, no significant outliers
#  Testosterone is also normalish: leptokurtic, a bit of a negative skew, no visible outliers

par(mfrow = c(1,1))
boxplot(d$Risk, d$Cortisol, d$Testosterone)

library(psych)
skew(d$Risk)
skew(d$Cortisol)
skew(d$Testosterone)
 ## Reference for a normal curve is 0. 

kurtosi(d$Risk)
kurtosi(d$Cortisol)
kurtosi(d$Testosterone)
  ## Reference for mesokurtic shape is 3.0

# mean, median, mode
# if: mean = median = mode -- you have a normal curve
# rudimentary judgement of normality: looking at how these 3 central tendencies compare with each other


## CENTRAL TENDENCIES - 20%
## Where is the middle of the data -- for each of the three variables?
## Justify your answer using concepts of normality, and measures of central tendencies. 
## All calculations using the manual method (but you can use built-in functions for verification)
## Keep your work clean with headings and comment your code.

# mean
n <- length(d$Risk)
sum <- sum(d$Risk)
mean <- sum/n

mean(d$Risk)

colMeans(d[,c(1,3:9)])
apply(d, 2[3:9], sum) ## Fix this


# median

# picking out the middle values and taking their average for even observations
# pick out the middle value

# MANUAL METHOD 1 (PREFERRED)
# Even observations
manual.median <- (d$Risk[n/2] + d$Risk[n/2+1])/2

# If it was an odd number of observations (which it is not)
manual.median <- d$Risk[n/2]

# MANUAL METHOD 2 (OKAY)
table(
  sort(d$Risk)
  )
# hashtag remark with the answer

# rounding was okay to do

# built-in
median(d$Risk)

# Mode
hist(d$Risk)
# a remark on what you saw on the histogram

# built-in

modeOf(d$Risk)

# you can have more than mode in a data set


## VARIABILITY - 30%
## Compute variance and standard deviation of each of the three variables.
## Keep your work clean with headings and comment your code.

cortisol.center <- d$Cortisol - mean(d$Cortisol)

risk.center <- d$Risk - mean
  ## you're looking for: 
      ## a vector
      ## positive and negative values
      ## sum to 0

risk.ss <- sum(risk.center^2)
      ## A single positive value
      ## usually much larger than the range of values in the vector

risk.var <- risk.ss / (n-1)

# verify
var(d$Risk)

risk.s <- sqrt(risk.var)

# verify
sd(d$Risk)

## CORRELATIONS - 20%
## Compute the covariance and correlationship between the following variables: 
## Risk x Cortisol
## Risk x Testosterone
## Describe the relationship between each of those variables





# covariance: an unstandardized correlation value
  ## you can make claims about directionality
  ## you cannot make claims about magnitude

  # manual
  cross.products <- risk.center * cortisol.center
    sum(cross.products)
    # is a non-zero value (as a verification)
    
  cross.product.sum <- sum(cross.products)  
  
  cov.risk.cortisol <- cross.product.sum / (n-1)

  ## built-in
  cov(d$Risk, d$Cortisol)
    # the relationship appears to be negative
    # cov goes from negative infinity to positive infinity (no bounds)
    # no ability to judge how strong the relationship is

# correlation: 
  ## you can make claims about both directionality and magnitude

  r.risk.cortisol <- cov.risk.cortisol / (risk.s * sd(d$Cortisol))
  
  ## bult-in
  cor(d$Risk, d$Cortisol)

    # be aware that correlations run from -1 to +1
    # -1 is a perfect negative or inverse correlation
    # +1 is a perfect positive or direct correlation
    # 0 is no relationship at all

  # Forward looking functions
  cor.test(d$Risk, d$Cortisol)

