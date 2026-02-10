## Lecture 5

url.stats.data <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/202610_2300_data.csv"
df.stats.data <- read.csv(url.stats.data)

## Decide on target variables: 
##  Are there differences in sleep duration between 2026 Spring's Langley vs Online class?

class(df.stats.data$Semester) # any reference to values here are done without a double quote
class(df.stats.data$Section) # any reference to these values must be with double-quotes
colnames(df.stats.data)

langley.class <- df.stats.data[df.stats.data$Semester == 202610 & df.stats.data$Section == "L10","hrs.sleep.weekly" ]

online.class <- df.stats.data[df.stats.data$Semester == 202610 & df.stats.data$Section == "A10","hrs.sleep.weekly" ]

## Overlaid Histogram

hist(langley.class, col = rgb(0,0,1,0.25))
hist(online.class, add = TRUE, col = rgb(0,1,0,0.25))

## Central Tendencies

## Mean, Median and Mode

## Sum of scores
sum.langley <- sum(langley.class)
sum.online <- sum(online.class)

## Sample Sizes
n.langley <- length(langley.class)
n.online <- length(online.class)

## Mean
mean.langley <- sum.langley / n.langley
mean(langley.class)

mean.online <- sum.online / n.online
mean(online.class)

## Median
median.langley <- sort(langley.class)[ceiling(n.langley/2)]
median(langley.class)

median.online <- sort(online.class)[ceiling(n.online/2)] ## more compact, more error prone, harder to diagnose
median(online.class)

## Break out part calculations as separate variables, like so: 
sorted.langley.data <- sort(langley.class)
halfway.point <- ceiling(n.langley/2)
median.langley.data <- sorted.langley.data[halfway.point] ## more verbose, maybe more aesthetic, and more diagnosable, less error prone
  ## you can reuse calculations later on

## Mode

table(rle(sorted.langley.data))
table(
  rle(
    sort(
      online.class
      )
    )
  )

## Variance -- "jitter / noise" within a variable

deviation.langley <- langley.class - mean.langley
squared.deviation.langley <- deviation.langley^2
ss.langley <- sum(squared.deviation.langley)
df.langley <- n.langley - 1
variance.langley <- ss.langley / df.langley
var(langley.class)
sd(langley.class)

deviation.online <- online.class - mean.online
squared.deviation.online <- deviation.online^2
ss.online <- sum(squared.deviation.online)
df.online <- n.online - 1
variance.online <- ss.online / df.online
var(online.class)
sd(online.class)

## Covariance -- jitter / noise between two variables 
## when jitter / noise is low between two variables, you talk of correlation

## We have to switch to a variable where we ahve pairs of scores (same size, same sammple size)
## Is there a relationship between sleep and caffeine?

deviation.all.sleep <- df.stats.data$hrs.sleep.weekly - mean(df.stats.data$hrs.sleep.weekly)
deviation.all.caffine <- df.stats.data$cups.caffeine.weekly - mean(df.stats.data$cups.caffeine.weekly)
cross.product <- deviation.all.sleep * deviation.all.caffine
sum(cross.product) ## We do not have the problem of deviation scores adding up to zero
    ## A nice byproduct of this calculation

sum.cross.product <- sum(cross.product)

## Covariance: sum.cross.product / df.freedom
df.data <- length(df.stats.data$hrs.sleep.weekly) - 1
covariance <- sum.cross.product / df.data
## Double check
cov(df.stats.data$hrs.sleep.weekly, df.stats.data$cups.caffeine.weekly)

## The rudimentary beginnings of the correlation coefficient. 
## This tells you the direction of the relationship: + means direct relationship; - means inverse relationship
## Except: you can't judge the magnitude of the relations from covariance
## That's because right now you're comparing cups to hours (cups of caffeine to hours of sleep)
## Because you're in different units of measurement, you need standardize the data before making a 
## statement about how strong the relationships


