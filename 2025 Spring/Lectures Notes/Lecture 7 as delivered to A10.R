## Lecture 7 as delivered to A10

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Exams/Rawlings_et_al_chimp_LT_personality_data.csv"
chimp_data <- read.csv(data_link)

## Covariance

## Deviation score for dominance
centred_dominance <- chimp_data$T1.dominance - mean(chimp_data$T1.dominance)

## Deviation score for extraversion
centred_extraversion <- chimp_data$T1.exterversion - mean(chimp_data$T1.exterversion)

cross_product <- centred_dominance * centred_extraversion
## this is the equivalent of sums of squares in variability calculations
sum_cross_product <- sum(cross_product)
## since it's not 0, we can do math with it

deg_free <- nrow(chimp_data) - 1

covariance <- sum_cross_product / deg_free
## we can see that this a slightly positive value
## it's not interpretable. We don't know if this is a strong or weak relationship
## but we can tell that this is a positive relationship - direct proportional relationship

## Validate
cov(chimp_data$T1.dominance, chimp_data$T1.exterversion)


## Standardization

z_score_dominance <- (chimp_data$T1.dominance - mean(chimp_data$T1.dominance)) / sd(chimp_data$T1.dominance)
z_score_extraversion <- (chimp_data$T1.exterversion - mean(chimp_data$T1.exterversion)) / sd(chimp_data$T1.exterversion)

## What is the relationship between the two variables?

z_cross_product <- z_score_dominance * z_score_extraversion
sum_z_cross_products <- sum(z_cross_product)
correlation_coefficient <- sum_z_cross_products / deg_free

## Validate
cor(chimp_data$T1.dominance, chimp_data$T1.exterversion)
## We can use this number to judge the magnitude of the relationship of the two variables
## Perfect direct/positive relationship: +1.0
## Perfect inverse/negative relationship: -1.0
## No relationship / total noise: 0.0

## +0.42 is a moderate strength positive relationship between dominance and extraversion


## Pearson's R -- correlation coefficient is technical a standardized covariance computation.


## Scatterplot

plot(chimp_data$T1.dominance, chimp_data$T1.exterversion)





