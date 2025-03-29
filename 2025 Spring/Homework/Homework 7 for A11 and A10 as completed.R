## Homework 7 for A11

## Building on the lecture content where we correlated dominance and agreeableness, 
## take this one step further and correlate dominance with agreeableness for each sex separately.

## You are permitted to do central tendency calculations using built-in functions. 
## Covariability, standardization and correlation calculations must be done manually. Built-in functions should be used to validate your answers and troubleshoot. 

## LECTURE CONTENT (FOR REFERENCE)
## COMPUTING THE COVARIANCE
data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Exams/Rawlings_et_al_chimp_LT_personality_data.csv"
chimp_data <- read.csv(data_link)

z.agreeableness <- (chimp_data$T1.agreeableness - mean(chimp_data$T1.agreeableness)) / sd(chimp_data$T1.agreeableness)
z.dominance <- (chimp_data$T1.dominance - mean(chimp_data$T1.dominance)) / sd(chimp_data$T1.dominance)
z.cross.product <- z.agreeableness * z.dominance
z.sums <- sum(z.cross.product)
deg.free <- nrow(chimp_data) - 1
z.cov <- z.sums / deg.free

# Verification
cor(chimp_data$T1.agreeableness, chimp_data$T1.dominance)

## HOMEWORK

sex1.chimps <- chimp_data[chimp_data$Sex == 1,]
sex2.chimps <- chimp_data[chimp_data$Sex == 2,]

# SEX 1
sex1.z.agreeableness <- (sex1.chimps$T1.agreeableness - mean(sex1.chimps$T1.agreeableness)) / sd(sex1.chimps$T1.agreeableness)
sex1.z.dominance <- (sex1.chimps$T1.dominance - mean(sex1.chimps$T1.dominance)) / sd(sex1.chimps$T1.dominance)
sex1.z.cross.product <- sex1.z.agreeableness * sex1.z.dominance
sex1.z.sums <- sum(sex1.z.cross.product)
sex1.deg.free <- nrow(sex1.chimps) - 1
z.cov.sex1 <- sex1.z.sums / sex1.deg.free

# Verification
cor(sex1.chimps$T1.agreeableness, sex1.chimps$T1.dominance)

## Moderate correlation between agreeableness and dominance, r = 0.33

# SEX 2

sex2.z.agreeableness <- (sex2.chimps$T1.agreeableness - mean(sex2.chimps$T1.agreeableness)) / sd(sex2.chimps$T1.agreeableness)
sex2.z.dominance <- (sex2.chimps$T1.dominance - mean(sex2.chimps$T1.dominance)) / sd(sex2.chimps$T1.dominance)
sex2.z.cross.product <- sex2.z.agreeableness * sex2.z.dominance
sex2.z.sums <- sum(sex2.z.cross.product)
sex2.deg.free <- nrow(sex2.chimps) - 1
z.cov.sex2 <- sex2.z.sums / sex2.deg.free

# Verification
cor(sex2.chimps$T1.agreeableness, sex2.chimps$T1.dominance)

## Weak correlation between agreeableness and dominance, r = 0.16

## Sex 2's correlation between agreeableness and dominance is half of Sex 1's correlation between agreeableness and dominance
## revealing a sex difference between agreeableness and dominance. 



