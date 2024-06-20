## Lecture Week 8

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/202420_2300_classdata.csv"
psyc2300_df <- read.csv(url)
## na.omit wrapped around read.csv() is simple and effective, but overly "punishing"
## Drops any rows with NA values even if not subject to analysis

## Remove NA values
## 1. compose a new data frame with just the variables of interest
analysis.df <- data.frame(
  hrs.work = psyc2300_df$hrs.work.weekly,
  hrs.study = psyc2300_df$hrs.study.weekly
)
## remove NA values
analysis.df <- na.omit(analysis.df)

## What is the correlation between hours of work and hours of study?

## Covariance
## 1. Sample size - a new more efficient way to calculate sample size: nrow()
## 2. Mean - can use built-in calculation
## 3. Deviation Scores

n <- nrow(analysis.df) ## nrow uses dataframe to calculate sample size
## Does not consider NA values

mean.study <- mean(analysis.df$hrs.study)
mean.work <- mean(analysis.df$hrs.work)

## Deviation scores
dev.study <- analysis.df$hrs.study - mean.study
dev.work <- analysis.df$hrs.work - mean.work

## Diagnostics
round(sum(dev.study))
round(sum(dev.work))

## Covariance

cov.work.study <- sum(dev.study * dev.work) / (n - 1)

## The sign tells us the direction of the relationship
## The number DOES NOT tell us the magnitude of the relationship

## Z-scores

## Standard Deviation
## Get the z-scores

s.work <- sd(analysis.df$hrs.work)
s.study <- sd(analysis.df$hrs.study)

## Get the Z-scores

z.work <- dev.work / s.work
z.study <- dev.study / s.study

## Validate
scale(analysis.df$hrs.work)
scale(analysis.df$hrs.study)

## Correlation coefficient

cor.work.study <- sum(z.study * z.work) / (n - 1)

## Validate
cor(analysis.df$hrs.work, analysis.df$hrs.study)

## Conclusion statements about this value
## This is an inverse relationship
## Depending on your field of psychology, this could be a small or moderate relationship

## Interpretation
## There appears to be a small to medium inverse effect of work on study. Meaning more work means less study or vice versa.
## We cannot make any causal conclusions based on a correlation. 

## Scatter plot to visualize the relationship between the two variables
plot(analysis.df$hrs.work, analysis.df$hrs.study)

## Normality Diagnostics
boxplot(analysis.df$hrs.work, analysis.df$hrs.study, 
        names = c("Work", "Study")
        )

hist(z.work, col = rgb(0,0,1,0.5), xlim = c(-2,5), ylim = c(0,15))
hist(z.study, col = rgb(1,0,0,0.5), xlim = c(-2,5), ylim = c(0,15), add = TRUE)

## Ideally skew of 0, kurtosis of 3

install.packages("moments")
library("moments")

skewness(z.study)
skewness(z.work)
## +/- roughly 1 away from 0.0 is okay

kurtosis(z.study) ## slightly leptokurtic, but fine
kurtosis(z.work) ## slightly leptopkurtic, but fine
## +/- 2 deviation away from 3.0 is okay

## Task: 
## Load the mental health survey, Sheet 1 - Table 1
## Run a correlation between two variables: 
## height vs BMI
## Let's reconvene at 14:34

mentalhealth_url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/studentmentalhealth/Sheet%201-Table%201.csv"
mentalhealth_df <- read.csv(mentalhealth_url)

## Clean data

mentalhealth_analysis <- data.frame(
  height = mentalhealth_df$height..cm.,
  bmi = mentalhealth_df$BMI
)

mentalhealth_analysis <- na.omit(mentalhealth_analysis)
## no data is dropped in this case

mh.n <- nrow(mentalhealth_analysis)
mean.height <- mean(mentalhealth_analysis$height)
mean.bmi <- mean(mentalhealth_analysis$bmi)

## Covariance
dev.height <- mentalhealth_analysis$height - mean.height
round(sum(dev.height))

dev.bmi <- mentalhealth_analysis$bmi - mean.bmi
round(sum(dev.bmi))

cov.height.bmi <- sum(dev.height * dev.bmi) / (mh.n - 1)
cov(mentalhealth_analysis$height, mentalhealth_analysis$bmi)

z.height <- dev.height / sd(mentalhealth_analysis$height)
z.bmi <- dev.bmi / sd(mentalhealth_analysis$bmi)
  
cor.height.bmi <- sum(z.height * z.bmi) / (mh.n - 1)  
cor(mentalhealth_analysis$height, mentalhealth_analysis$bmi)

## Conclusion
## A weak positive relationship between an individual's height and their BMI.

