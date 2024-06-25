## Lecture Week 9
## 
library(moments)
## Practice the concepts of covariance, standardization andn correlation
## Introduce the concept of Central Limit Theorem: Standard Error of Mean
## --> Generate barplots with error bars

examdata_url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023%20Summer/Data/2300exam.csv"
examdata_df <- read.csv(examdata_url)

## Is there a correlation between homework grades and exam grades?

## Filter
#### Create a copy of the data frame that contains the relevant variables
analysis_df <- data.frame(
  homework = examdata_df$hwk,
  exam = examdata_df$ex1
)
## Data Sanitization
#### Check for NA values
#### Could also check for impossible values, conceptually irrelevant values, other issues
sanitized_df <- na.omit(analysis_df)

## Normality Check
#### Histogram, boxplot, skewness, kurtosis

hist(sanitized_df$homework, breaks = 15)
skewness(sanitized_df$homework)
kurtosis(sanitized_df$homework)
## Moderate negative skew (-2.01), severely leptokurtic (6.39)

hist(sanitized_df$exam, breaks = 15)
skewness(sanitized_df$exam)
kurtosis(sanitized_df$exam)
## Mild negative skew (-1.02), mesokurtic (2.79)
## Substantial number of 0's

## Covariance
n <- nrow(sanitized_df)

centred.hwk <- sanitized_df$homework - mean(sanitized_df$homework)
round(sum(centred.hwk))

centred.ex1 <- sanitized_df$exam - mean(sanitized_df$exam)
round(sum(centred.ex1))

cov.hwk.ex1 <- sum(centred.hwk * centred.ex1) / (n - 1)
## Positive relationship

## Standardization

z.hwk <- centred.hwk / sd(sanitized_df$homework)
scale(z.hwk)

z.ex1 <- centred.ex1 / sd(sanitized_df$exam)
scale(z.ex1)

## This allows the two variables to be on the same histogram

hist(z.hwk, breaks = 15, col = rgb(0,0,1,.5))
hist(z.ex1, breaks = 15, col = rgb(0,1,0,.5), add = TRUE)

boxplot(z.hwk, z.ex1, names = c("Homework", "Exam"))


## Correlation

cor.hwk.ex1 <- sum(z.hwk * z.ex1) / (n - 1)
cor(sanitized_df$homework, sanitized_df$exam)

## Answer the question
## There is a strong positive correlation between homework and exam marks.

## For this data set, let's visualize the means and draw an error bar representing the SEM

mean.hwk <- mean(sanitized_df$homework)
mean.ex1 <- mean(sanitized_df$exam)
means <- c(mean.hwk, mean.ex1)

midpoints <- barplot(means,
        names.arg = c("Homework", "Exam"),
        ylab = "Mean Grade", 
        ylim = c(0, 100)
)

sem.hwk <- sd(sanitized_df$homework) / sqrt(n)
sem.ex1 <- sd(sanitized_df$exam) / sqrt(n)
sems <- c(sem.hwk, sem.ex1)

arrows(
  midpoints, means - sems, ## starting point of my two arrows
  midpoints, means + sems, ## ending point of my two arrows
  length = 0.1,
  angle = 90,
  code = 3
)


### Use the mental health survey to compare anxiety scores by height
## Tall Male threshold: 170; Tall F threshold: 157

## Draw a barplot of tall people and short people (merge sexes into same data frame)
## Draw SEM on top of it

mhdata_url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/studentmentalhealth/Sheet%201-Table%201.csv"
mhdata_df <- read.csv(mhdata_url)

## Filter after turning data frame into vector
colnames(mhdata_df)
tallmales <- mhdata_df[mhdata_df$male1.female2 == 1 & mhdata_df$height..cm. > 170,"T_score.STAI.Trail.Anxiety.Score"]
tallfemales <- mhdata_df[mhdata_df$male1.female2 == 2 & mhdata_df$height..cm. > 157,"T_score.STAI.Trail.Anxiety.Score"]

shortmales <- mhdata_df[mhdata_df$male1.female2 == 1 & mhdata_df$height..cm. < 170,"T_score.STAI.Trail.Anxiety.Score"]
shortfemales <- mhdata_df[mhdata_df$male1.female2 == 2 & mhdata_df$height..cm. < 157,"T_score.STAI.Trail.Anxiety.Score"]

talls <- c(tallmales, tallfemales)
shorts <- c(shortmales, shortfemales)

## Filter while maintaining all data frame columns
tallmales_df <- mhdata_df[mhdata_df$male1.female2 == 1 & mhdata_df$height..cm. > 170,]
tallfemales_df <- mhdata_df[mhdata_df$male1.female2 == 2 & mhdata_df$height..cm. > 157,]

shortmales_df <- mhdata_df[mhdata_df$male1.female2 == 1 & mhdata_df$height..cm. < 170,]
shortfemales_df <- mhdata_df[mhdata_df$male1.female2 == 2 & mhdata_df$height..cm. < 157,]

talls_df <- rbind(tallmales_df, tallfemales_df)
shorts_df <- rbind(shortmales_df, shortfemales_df)

## Means and SEMs using the vector c() method

means_heights <- c(
  mean(talls),
  mean(shorts)
)

talls_n <- length(talls)
talls_s <- sd(talls)
talls_sem <- talls_s / sqrt(talls_n)

shorts_n <- length(shorts)
shorts_s <- sd(shorts)
shorts_sem <- shorts_s / sqrt(shorts_n)
  
sems_heights <- c(
  talls_sem,
  shorts_sem  
)

midpoints_heights <- barplot(
  means_heights,
  names.arg = c("Talls", "Shorts"),
  ylim = c(0,60),
  ylab = "Mean Height"
)

arrows(
  midpoints_heights, means_heights - sems_heights,
  midpoints_heights, means_heights + sems_heights,
  length = 0.1,
  angle = 90,
  code = 3  
)

## Alternate way to reach correlation

## r = (covariance) / (sd.var1 * sd.var2)

