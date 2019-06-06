disgust.data <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/disgustscale/Berger_and_Anaki_disgust_scale_2014_1_comma_delimited_cleaned.csv"))

## Sizing up the data
names(disgust.data) ## output variable names
head(disgust.data, 5) ## get the first five
tail(disgust.data, 5) ## get the last five

## What are we interested in?
## Question: What is the relationship between age and disgust sensitivity?

## slow mean for age
sum.age <- sum(disgust.data$ï..Age)
n <- length(disgust.data$ï..Age)
mean.age <- sum.age/n

## slow mean for disgust sensitivity (ds)
sum.ds <- sum(disgust.data$Mean_general_ds)
mean.ds <- sum.ds/n

## deviation scores: age
devscore.age <- disgust.data$ï..Age - mean.age
# devscore.age <- disgust.data$ï..Age - mean(disgust.data$ï..Age) ## sloppy

## fancy verification, value rounded to 3 decimals. Produces a TRUE or FALSE
round(sum(devscore.age), 3) == 0

## deviation scores: ds
devscore.ds <- disgust.data$Mean_general_ds - mean.ds
round(sum(devscore.ds), 3) == 0

## squared deviation scores: age
sqdev.scores.age <- devscore.age^2

## squared deviation scores: ds
sqdev.scores.ds <- devscore.ds^2

## SS: age
SS.age <- sum(sqdev.scores.age)

## SS: ds
SS.ds <- sum(sqdev.scores.ds)

## Variance
df <- n - 1
var.age <- SS.age/df
var.ds <- SS.ds/df

var(disgust.data$ï..Age)
var(disgust.data$Mean_general_ds)

## Standard Deviation
sd.age <- sqrt(var.age)
sd.ds <- sqrt(var.ds)

## Covariance of age + disgust sensitivity

cov.age.ds <- sum(devscore.age * devscore.ds)/df
cov.age.ds

## double check
cov(disgust.data$ï..Age,disgust.data$Mean_general_ds)

## correlation coefficient
## technically speaking: standardized covariance

corr.age.ds <- cov.age.ds / (sd.age * sd.ds)

## double-check
cor(disgust.data$ï..Age,disgust.data$Mean_general_ds)

rm(list = ls())


#### 
e.d <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/1100examdata/1100_exam_data.csv"))

names(e.d)

n <- length(e.d$exam_2_100)

sum.ex1 <- sum(e.d$exam_1_122)
sum.ex2 <- sum(e.d$exam_2_100)

mean.ex1 <- sum.ex1/n
mean.ex2 <- sum.ex2/n

## This is the point of departure for variance and covariance calculation
## deviation scores or centred data
cc.ex1 <- e.d$exam_1_122 - mean.ex1
cc.ex2 <- e.d$exam_2_100 - mean.ex2

## squared scores (list)
sqscores.ex1 <- cc.ex1^2
sqscores.ex2 <- cc.ex2^2

## ss
ss.ex1 <- sum(sqscores.ex1)
ss.ex2 <- sum(sqscores.ex2)

## variance
df <- n-1
var.ex1 <- ss.ex1/df
var.ex2 <- ss.ex2/df

## standard deviation
sd.ex1 <- sqrt(var.ex1)
sd.ex2 <- sqrt(var.ex2)

## covariance
cov.ex1.ex2 <- sum(cc.ex1 * cc.ex2)/df

## correlation coefficient
corr.ex1.ex2 <- cov.ex1.ex2/(sd.ex1*sd.ex2)

