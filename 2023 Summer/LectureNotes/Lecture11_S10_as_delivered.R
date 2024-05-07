## Week 11
## t-tests

classdata.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-summer/Data/2300_2023.csv"
classdata.dataframe <- read.csv(classdata.url)

## caffeine intake for low vs high sleep individuals

## Filter: 
##  1. low sleep

low.sleep <- classdata.dataframe[classdata.dataframe$hrs.sleep.weekly < 56,"cups.caffeine.weekly"]

##  2. high sleep

high.sleep <- classdata.dataframe[classdata.dataframe$hrs.sleep.weekly >= 56,"cups.caffeine.weekly"]

## Assumption #4: sample size difference across groups should not be "too large"
      ## depends on who you talk to: 1/2 is too big, others says 1/10 too big)


# Normality

par(mfrow = c(2,1))
  hist(low.sleep)
  hist(high.sleep)

  ## problematic from a normality perspective
  library(psych)
  skew(low.sleep)  
  skew(high.sleep)  

  kurtosi(low.sleep)
  kurtosi(high.sleep)  

  
# Homogeneity of variance
#    I will show you how to do this next class
  
  
# Let's assume that everything is okay. 
# For practice, let's do a t-test
  
# pooled variance uses SS as the initial calculations
  
ss.low.sleep <- sum(
                    (low.sleep - mean(low.sleep))^2
                  )

ss.high.sleep <- sum(
                    (high.sleep - mean(high.sleep))^2
                  )  
  
n.low.sleep <- length(low.sleep)
n.high.sleep <- length(high.sleep)
df.low.sleep <- n.low.sleep - 1
df.high.sleep <- n.high.sleep - 1
df.total <- df.low.sleep + df.high.sleep

s.pooled <- (ss.low.sleep + ss.high.sleep) / (df.low.sleep + df.high.sleep)  
  
## this is not a covariance
## kind of like a mean variance of two variables


## Standard Error of the Mean
## Estimate of how "off" our sample mean might be from the population mean

sem <- sqrt(s.pooled/n.low.sleep + s.pooled/n.high.sleep)
  

mean(low.sleep)
mean(high.sleep)
  
## Conduct an independent-samples t-test
## t = meandifference / sem

t.sleep = (mean(low.sleep) - mean(high.sleep)) / sem

## Look up the critical t-value so that we can make a decision about the t test result

qt(p = 0.05/2, df = df.total, lower.tail = FALSE)
  ## p = 0.05 / 2 means that we are looking fot the two-tailed variant of the distribution where 2.5% of probability is in each tail
  ## lower.tail specifies for the qt function to look for both tails

# Our t-test result is way below the critical t-value. 
# Consequently: We fail to reject the null hypothesis
# There is no meaningful differences between the low and high sleep groups in relation to caffeine consumption
# Everyday language: Those who sleep at least 8hrs a day on average do not consume more or less caffeine than those who sleep less than 8 hours a day on average. 
# In a publication, you might report: We conclude that the mean differences are not signfiicant (t = 0.14, p < 0.05)

# one liner t-test

t.test(low.sleep, high.sleep, 
       var.equal = TRUE, 
       paired = FALSE)

# In a publication, you might report: We conclude that the mean differences are not signfiicant (t = 0.14, p = .88)


