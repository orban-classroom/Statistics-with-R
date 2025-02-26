## Lecture 7 
## Covariance, Standardization


data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Exams/Rawlings_et_al_chimp_LT_personality_data.csv"
chimp_data <- read.csv(data_link)

## Centred scores for two variables
## Dominance vs Agreeableness


## COMPUTING THE COVARIANCE

centred.agreeableness <- chimp_data$T1.agreeableness - mean(chimp_data$T1.agreeableness)

centred.dominance <- chimp_data$T1.dominance - mean(chimp_data$T1.dominance)

cross.product <- centred.agreeableness * centred.dominance

sums.cross.product <- sum(cross.product)

deg.free <- nrow(chimp_data) - 1

covariance.dom.agr <- sums.cross.product / deg.free

## Problem here: 
## the two variables may be on a different scale of measurement
## the covariance is a mixture of these scales - so it's not possible to interpret the value
## a covariance can range from maximum infinity to negative infinity
## a covariance of exactly 0 still means no relationship at all

## To solve the porlbme
## We standardize the scores

## Equation: centre the scores and divide by the standard deviation

z.agreeableness <- (chimp_data$T1.agreeableness - mean(chimp_data$T1.agreeableness)) / sd(chimp_data$T1.agreeableness)

## Properties of z-scores: 
mean(z.agreeableness) ## Check, that's practically 0
sd(z.agreeableness) ## Check, the standard deviation is indeed 1

z.dominance <- (chimp_data$T1.dominance - mean(chimp_data$T1.dominance)) / sd(chimp_data$T1.dominance)

cross.product.z <- z.agreeableness * z.dominance
sums.cross.product.z <- sum(cross.product.z)
z.covariance <- sums.cross.product.z / deg.free
## Weak positive correlation of +0.14 (kind of far from +1.0)

## Validate
cor(chimp_data$T1.agreeableness, chimp_data$T1.dominance)

## The difference between the cor() and the z.covariance indicates a problem



