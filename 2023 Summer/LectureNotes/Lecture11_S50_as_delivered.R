classdata <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-summer/Data/2300_2023.csv")

# All sections of the present semester: 202320

present.classes <- classdata[classdata$Semester == 202320, ]

# All past section of the course: everything but 202320

past.classes <- classdata[classdata$Semester < 202320, ]


## Do the present classes differ in the amount of time on the screen, relative to past classes?
## Indepent samples t-test to determine the answer

# Alternative
classdata[classdata$Semester != 202320, ]

## Assumption checking

## Normality
par(mfrow = c(2,1))
  hist(present.classes$hrs.screentime.weekly,
    xlim = c(0,100),
    ylim = c(0,25)
     )
  hist(past.classes$hrs.screentime.weekly, 
    xlim = c(0,100),
    ylim = c(0,25))
    )

library(psych)
skew(present.classes$hrs.screentime.weekly)
skew(past.classes$hrs.screentime.weekly)

kurtosi(present.classes$hrs.screentime.weekly)
kurtosi(past.classes$hrs.screentime.weekly)

## Homogeneity
## differences in variances between the groups

# skip until next week

## Independence of observations

# Based on your research methods
# Ask yourself about recruitment methods

## Generate Sums of Squares for each of the groups

ss.present <- sum((present.classes$hrs.screentime.weekly - mean(present.classes$hrs.screentime.weekly))^2)
ss.past <- sum((past.classes$hrs.screentime.weekly - mean(past.classes$hrs.screentime.weekly))^2)

## Pooled Variance
# s_pooled = (SS1 + SS2) / (df1 + df2)

s.pooled <- (ss.present + ss.past) / (nrow(present.classes)-1 + nrow(past.classes)-1)

## SEM (Standard Error of the Mean)
## uncertainty estimate -- how far away we might be from the population mean (the thing that we don't know)
# sem <- sqrt(s.pooled/n1 + s.pooled/n2)

sem <- sqrt(s.pooled/nrow(present.classes) + s.pooled/nrow(past.classes))

## Visualize what we are looking at: 

par(mfrow = c(1,1))
means <-   c(
            mean(present.classes$hrs.screentime.weekly),
            mean(past.classes$hrs.screentime.weekly)
            )
barplot(means)

##
## We will learn to add the SEM as whiskers on the bar plot next weekk


## t-test
## t = (M1 - M2) / sem

t <- (mean(present.classes$hrs.screentime.weekly) - mean(past.classes$hrs.screentime.weekly)) / sem

# t-tests can be positive or negative. It doesn't matter!
t <- (mean(past.classes$hrs.screentime.weekly) - mean(present.classes$hrs.screentime.weekly)) / sem

## Is it significant?

## Using the classic

# What is the critical t-value?
# (We can't actually be bothered to look at the table)

df_total <- (nrow(present.classes)-1) + (nrow(past.classes)-1)
## look at the alpha level of 0.05

## q() will output the critical t-value without actually having to look through the table
qt(p=0.05/2, df = df_total, lower.tail = FALSE)
  ## LOWER.TAIL specifies whether to consider this to be a two-tailed or a one-tailed test

## Statisticaly, 
## we must conclude
## FAIL TO REJECT THE NULL HYPOTHESIS
## aka: there are no meaningful differences between the two groups
## everyday language: Screentime between the present classes and the past classes is the same
## in a publication you report: Our results are not significant (t = 1.0312, p > 0.05)


t.test(present.classes$hrs.screentime.weekly,
       past.classes$hrs.screentime.weekly,
       var.equal = TRUE, 
       paired = FALSE)
 # use only for verification, but not actual

## in a publication you report: Our results are not significant (t = 1.0312, p = 305)