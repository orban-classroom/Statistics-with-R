## Lecture 4, as delivered to A10

## Tasks

## Load Data

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/studentmentalhealth.csv"
mental_health <- read.csv(data_link)

mental_health$height..cm.


# 1. Calculate the Mean

sum.heights <- sum(mental_health$height..cm.)
n.heights <- length(mental_health$height..cm.)

length(mental_health) ## this is wrong. this tells you how many variables you have, not how many participants
nrow(mental_health) ## this function can be applied just on the data frame

mean.heights <- sum.heights / n.heights

# Verify this answer using the built-in function
mean(mental_health$height..cm.)

# 2. Center the scores (calculate a deviation score from the mean)
## each raw score minus the mean

centred_scores <- mental_health$height..cm. - mean.heights
## Diagnostics to think about:
## is this a list or vector values? It should be
## are there both positive and negative values? There should be
## Verification
sum(centred_scores)
## -6.82121 x 10^-13 = 0.0000000000000682121 ~~ roughly 0

## Digression on why I call it centred scores: 
plot(mental_health$height..cm.)
plot(centred_scores)

# 3 Square the centred or deviation scores (i.e., square all deviation scores)

squared.deviations <- centred_scores^2
## Diagnostics:
## It should be a list of values
## All values should be positive


# 4. Sums of Squares: Sum the centred (aka deviation) & squared scores

ss.heights <- sum(squared.deviations)
## Diagnostics: 
## One large positive number

# 5. Variance: Divide the sum of centred (deviation) scores by sample size
## sums of squares divided by the sample size

var.heights <- ss.heights / n.heights

## Verify: 
var(mental_health$height..cm.)

## Why the difference?
## I failed to tell you about a concept: degrees of freedom
## an artificial distortion of the sample size to inflate the variance calculation
## The calculation is n - 1
df.heights <- n.heights - 1

var.heights <- ss.heights / df.heights

# 6. Standard Deviation: Take its square root

sd.heights <- sqrt(var.heights)

sd(mental_health$height..cm.)

## Let's pick another variable and repeat

# 0. Target Variable is BMI
mental_health$BMI
# 1. Mean
n.bmi <- length(mental_health$BMI)
mean.bmi <- sum(mental_health$BMI) / n.bmi
# 2. Centering# 2. CenteringBMI
# 3. Squaring
# 4. Summing - SS
ss.bmi <- sum((mental_health$BMI-mean.bmi)^2)
# 5. Variance
df.bmi <- n.bmi - 1
var.bmi <- ss.bmi / df.bmi
# 6. Standard Deviation
sd.bmi <- sqrt(var.bmi)



