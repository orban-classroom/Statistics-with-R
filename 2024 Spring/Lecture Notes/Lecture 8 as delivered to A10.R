## Week 12

## Plan
## Compute the SEM - Standard Error of the Mean
## Generate a barplot with error bars indicating SEM
## Compute the effect size (Cohen's D)

## Load 2300 data: 
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/202410_2300_classdata.csv"
psyc2300data <- read.csv(url)

## Is there a difference in screentime in two semester's worth of classes pre and post covid?
## The classes selected for this analysis will be 201910, 201920 for pre-covid, and 202410 and 202320 for post-covid.

## Filter the data

pre_covid <- psyc2300data[psyc2300data$Semester == c(201910, 201920),]
post_covid <- psyc2300data[psyc2300data$Semester == c(202410, 202320),]

## Selected Assumption Checking

## Is the data normal?
## histogram - rough visual inspection, not very accurate
## quantify using the functions like skewness() or kurtosi() as described in the Navarro book
## you can also generate a boxplot for added clarity on outliers, and position of the median
hist(pre_covid$hrs.screentime.weekly, 
     main = "Histogram of screentime of pre-covid students", 
     xlab = "Weekly Screentime Hours", 
     breaks = 10)

boxplot(pre_covid$hrs.screentime.weekly)

library(psych)
skew(pre_covid$hrs.screentime.weekly)

## t-tests are robust and not vulnerable to skew. You can have fairly severe skew and still trust the results.

kurtosi(pre_covid$hrs.screentime.weekly)

## Is the data independently sampled?
## This is a methodological question that you need ask the researcher.
## This method is fine if Levente's stats classes are the population. In that case this is not a sample of data. It is a population of data. 
## In every other scenario, the sampling technique is entirely inadequate. 

## Check for homogeneity of variance (You will learn it in week 13)
## Is the the data homogenuous?
## Yes: homogeneity of variance
## No: heterogeneity of variance (you do not want this)

## F Max test: larger variance and divide by the smaller variance
## "Heuristic" interpretation: > 2.5 then you have an issue
## Pseudocode: F_max: greater variance / smaller variance

var(pre_covid$hrs.screentime.weekly)
var(post_covid$hrs.screentime.weekly)

F_max <- var(pre_covid$hrs.screentime.weekly) / var(post_covid$hrs.screentime.weekly)
## We can conclude that this data is homogenous 


## What is the sample size difference? 
## According to conservative scientists it should less than 2x difference, but according liberal scientists, it can be as large as 10x diff.

## Manually determine the greater sample size and put that in the numerator
nrow(post_covid)/nrow(pre_covid)

## Automatically: 
max(c(nrow(post_covid),nrow(pre_covid))) / min(c(nrow(post_covid),nrow(pre_covid)))


## Compute the Standard Error of the Mean
## the estimated discrepancy of the sample in your study from the hypothetical population mean
## Every sample has a measure of uncertainty, and this is one of the most important ones
## Pseudocode: 
##  sem = standard deviation of the variable / square root of the sample size

pre_covid_sem <- sd(pre_covid$hrs.screentime.weekly) / sqrt(nrow(pre_covid))
post_covid_sem <- sd(post_covid$hrs.screentime.weekly) / sqrt(nrow(post_covid))

## Combine the two SEM's into a single vector
sem_values <- c(
                pre_covid_sem, 
                post_covid_sem
                )

## Combine the two means into a single vector
mean_values <- c(
                mean(pre_covid$hrs.screentime.weekly), 
                mean(post_covid$hrs.screentime.weekly)
                )

## Barplot with error bars
## A bar plot should contain the means of each of the two dependent variables. 
## The mean of weekly exercise hours
midpoints <- barplot(
  mean_values,
  ylim = c(0,40), 
  main = "Means of Screentime Pre and Post covid",
  names.arg = c("Pre-covid", "Post-covid")
  )

## Drawing the error bars
arrows(
  midpoints, mean_values - sem_values,
  midpoints, mean_values + sem_values,
  length = 0.1,
  angle = 90,
  code = 3,
)

## In order to draw the error bar on this bar plot, you need to: 
## 1. Put the means into a vector
mean_values
## 2. Put the SEM values into a vector
sem_values
## 3. Save the middle points of each bar on the graph
midpoints
## 3. Draw arrows in the size of the error bars
arrows()

## SEM also goes into the t-test calculation. we'll talk about that in week 13

# Cohen's d
# Effect size - assess the chance of committing either a type I or type II error
# The smaller the value, the greater the chance of a Type I or Type II error
# The greater the value the greater the effect size

## Logical option to merge to standard deviations for the purpose of calculating Cohen's d:
mean(
  c(
    sd(pre_covid$hrs.screentime.weekly), 
    sd(post_covid$hrs.screentime.weekly)
    )
  )

## You need a way to pool standard deviation / variance in such a way that you account for
## sample size differences between the two groups

pooled_sd <- sqrt(
                (var(pre_covid$hrs.screentime.weekly) / nrow(pre_covid)) + 
                (var(post_covid$hrs.screentime.weekly) / nrow(post_covid))  
              )

mean_diff <- mean_values[1] - mean_values[2]
cohens_d <- mean_diff / pooled_sd

## t-test
## Inferential statistics that tells whether or not two groups of data (that meet assumptions) are significantly different or not.
## Always accompanied by a p-value (probability value), which compared against your alpha value
## Alpha is a threshold value set by convention. It can be 0.05, 0.01 or 0.001
## The loosest criterion is 0.05, most commonly used. 
## There are some special circumstances where you need a stricter criterion. 
## If the p-value is equal or less than the alpha value: Reject the null hypothesis (accept your hypothesis)
## If the p-value is greater than the alpha value: Fail to reject the null hypothesis (you study didn't work out)

## INDEPENDENT SAMPLES T-TEST (two unrelated groups) - different set of participants for each group of data
## Pseudocode for t-test: t = (x1 - x2) / SEM

## Sums of Squares

ss_pre_covid <- sum((pre_covid$hrs.screentime.weekly - mean(pre_covid$hrs.screentime.weekly))^2)
ss_post_covid <-  sum((post_covid$hrs.screentime.weekly - mean(post_covid$hrs.screentime.weekly))^2)

## Pooled Variance

df_pre_covid <- length(pre_covid$hrs.screentime.weekly) - 1
df_post_covid <- length(post_covid$hrs.screentime.weekly) - 1

## Path 1 to pooled variance
s2_pooled <- (ss_pre_covid + ss_post_covid) / (df_pre_covid + df_post_covid)

## Path 2 to pooled variance
((df_pre_covid)*var(pre_covid$hrs.screentime.weekly) + (df_post_covid)*var(post_covid$hrs.screentime.weekly)) / (df_pre_covid+df_post_covid)

## Pooled Standard Error of the Mean

sem_pooled <- sqrt((s2_pooled/length(pre_covid$hrs.screentime.weekly)) + (s2_pooled/length(post_covid$hrs.screentime.weekly)))

t.value <- mean_diff / sem_pooled
t.value

## REPEATED SAMPLES T-TEST (related groups) - the same participant provides two data points
## ALSO CALLED PAIRED TEST

## Manual determination of significance
total_n <- length(pre_covid$hrs.screentime.weekly) + length(post_covid$hrs.screentime.weekly)

## Consult the t-table for a df of 100 (based on an df = 151), and a two-tailed 0.05 alpha level

## Critical t-value according to the table is 2.000 (the point where p = 0.05)
## Actual t-value is 1.579, which smaller than the critical t-value
## Conclusion: Fail to reject the hypothesis: No support for the hypothesis that screentime would be 
## significantly different pre-covid vs post-covid. 
## This manual decision process does not involve calculating actual p-values. 
## This is how you report it: We found no support for our hypothesis (t = 1.579, p > 0.05)

## In R, it is trivially easy to determine the exact p-value, and a lot less labour

crit.t.value <- qt(
      p = 0.05/2, ## specify the alpha level and the number of tails
      df = (length(pre_covid$hrs.screentime.weekly) + length(post_covid$hrs.screentime.weekly)) - 2,
      lower.tail = FALSE ## if you want a two-tailed decision
    )
crit.t.value

p.value <- 2 * pt(
    q = abs(t.value),
    df = (length(pre_covid$hrs.screentime.weekly) + length(post_covid$hrs.screentime.weekly)) - 2,
    lower.tail = FALSE
  )
p.value

## This p-value is greater than 0.05 so we still make the exact same conclusion as above
## The report would like this: We found no support for our hypothesis (t = 1.579, p = 1.97)

t.test(pre_covid$hrs.screentime.weekly,
       post_covid$hrs.screentime.weekly,
       alternative = "two.sided",
       var.equal = TRUE,
       paired = FALSE
       )


?t.test
