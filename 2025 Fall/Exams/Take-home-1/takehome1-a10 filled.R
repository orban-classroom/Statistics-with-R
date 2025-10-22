## TAKE-HOME EXAM 1
## PSYC 2300 - APPLIED STATISTICS 1
## INTENDED DURATION: 2 hours (not monitored)

## EXAM REGULATIONS: 
## 1. Do not discuss the exam with anyone.
## 2. You can message Dr. Orban with any questions, including feedback on homework performance to assist with answers on this exam.
## 3. You may use resources such as the textbook, lecture slides, lecture R notes and homework to complete this exam. 
## 4. Do not talk to classmates, tutors or other humans about this exam.
## 5. You can use your textbook, lecture notes, LLM's, AI and online sources to complete this exam.
## 6. IMPORTANT: You grade on this exam is based on ORALLY DEFENDED answers. 
##    This means that if you don't understand your own code at all, it is possible to receive a 0 on a perfect written exam.
## This is an exam. Rule violations will be investigated by the dean's office for academic integrity violation. 

## About the Data Set: game_experiment_results_dryad.csv
## Article Link: https://royalsocietypublishing.org/doi/10.1098/rsos.190991
## The data set describes donation dollar amounts in a game where subjects were
## recruited from "small" or "big" communities.
## File name on GitHub (inside the "Exams" folder): 

## Variables you will use are: "CS", "FreeDonationAmount"

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Fall/Exams/Take-home-1/game_experiment_results_dryad.csv"
experiment.data <- read.csv(url)

library(lsr)
library(moments)
library(psych)

## NORMALITY
## Assess `FreeDonationAmount` for normality. Draw on your of knowledge of normal curves, 
## skew, kurtosis, outliers, variability to make your conclusions. Use technical language (as per textbook) and visualizations.
## to support your arguments. Keep your work clean with headings and comment your code.

hist(experiment.data$FreeDonationAmount)
  ## adding labels, colouring the graph - make it more readable, generally
  ## negatively skewed distribution
  ## skew refers to the symmetry of the distribution
  ## kurtosis - pointiness of the graph

skew(experiment.data$FreeDonationAmount)
skewness(experiment.data$FreeDonationAmount)
  ## when is it a problem level skew?
  ## +/- 2.0 is becoming problem

kurtosi(experiment.data$FreeDonationAmount) # using the psych library
  # this is normalised to 0 (3 -> 0) as the mesokurtosis
  # Your comparison here is 0. Anything above is leptokurtic
  # anything below 0 is platykurtic

kurtosis(experiment.data$FreeDonationAmount) # using the moments library
  # this is not normalised to 0 (so 3 is ideal).
  # Your comparision is 3. Therefore anything over 3 is leptokurtic
  # anything below 3 is platykurtic.

  # +/- 2 as a threshold for problems

boxplot(experiment.data$FreeDonationAmount)
  ## best thought of as a way to split the data into 4
  ## 1st and 4th quadrants are the whiskers
  ## 2nd and 3rd quadrants are the bottom and top side of the box (relative to thick black line)

## CENTRAL TENDENCIESFreeDonationAmount## CENTRAL TENDENCIES
## Where is the middle of the data for `FreeDonationAmount`?
## Justify your answer using concepts of normality, and measures of central tendencies. 
## All calculations using the manual method (but you can use built-in functions for verification)
## Keep your work clean with headings and comment your code.

## CENTRAL TENDENCY IS ABOUT FINDING THE CENTER OF THE DATA 
## is there one value that represent the center?

## it depends ont he shaope of the distribution
## if it's perfectly normal: mean = median = mode
## differences in the mean, median and mode give you a diagnostic about how mis-shapen your data is

sum.donation <- sum(experiment.data$FreeDonationAmount)
sample.size.donation <- length(experiment.data$FreeDonationAmount)
manual.mean <- sum.donation / sample.size.donation

## This below is redundant because the variables are not saved (computations are doubled)
sum(experiment.data$FreeDonationAmount)
length(experiment.data$FreeDonationAmount)
manual.mean <- sum(experiment.data$FreeDonationAmount) / length(experiment.data$FreeDonationAmount)

mean(experiment.data$FreeDonationAmount)


## MEDIAN

sorted.data <- sort(experiment.data$FreeDonationAmount)
sample.size.donation

## Is the sample size an odd or an even number?
## You need execute finding the two middle values and take its average

mid1 <- sorted.data[sample.size.donation/2]
mid2 <- sorted.data[sample.size.donation/2+1]
mean(mid1,mid2)

median(experiment.data$FreeDonationAmount)


## MODE

## Manual way
table(rle(sorted.data)) # run length encoding

modeOf(experiment.data$FreeDonationAmount)

## Concept question: can you imagine any circumstances in which a median is a 
## better metric of central tendencies than the mean?

## Whenever there are extreme values in the data set (highly skewed)


## VARIABILITY
## Compute variance and standard deviation for `FreeDonationAmount`.
## Keep your work clean with headings and comment your code. 
## Compute interim variables (deviation scores, sums of squares)

deviation.score <- experiment.data$FreeDonationAmount - manual.mean
# a list / vector of values
# half of them are negative, half of them are positive
# Diagnostics: 
round(sum(deviation.score))
## Sometimes you will see a very small value, something on the order of x times 10^-10 (or smaller)
## 0.0000000000002966516

squared.deviation <- deviation.score^2
## a list / vector of values
## they are positive values
## all bigger values than the original scale

sums.of.squares <- sum(squared.deviation)
## one big positive number

deg.freedom <- sample.size.donation - 1

variance <- sums.of.squares / deg.freedom

var(experiment.data$FreeDonationAmount)

std.dev <- sqrt(variance)

sd(experiment.data$FreeDonationAmount)

## FILTERING / SUBSETTING
## Create one filter (see Homework 4 for similar filtetring) where 
## you can see all `FreeDonationAmount` values but only `CS` (community size) that is "small" 

small.cs <- experiment.data[experiment.data$CS == "small", ]

## Create another filter where your can see all `FreeDonationAmount` values 
## but only `CS` that is "big"

big.cs <- experiment.data[experiment.data$CS == "big", ]



## Compute the mean for `FreeDonationAmount` for each of the community sizes. 

## small

small.cs.sum <- sum(small.cs$FreeDonationAmount)
small.cs.n <- length(small.cs$FreeDonationAmount)
small.cs.mean <- small.cs.sum / small.cs.n

## big

big.cs.sum <- sum(big.cs$FreeDonationAmount)
big.cs.n <- length(big.cs$FreeDonationAmount)
big.cs.mean <- big.cs.sum / big.cs.n

## Do these means look different? Comment with a hashtag below

# big cs = 7.80
# small cs = 8.57

## Yes, they appear to be different

## Now compute the standard deviation for each community size

## small
small.cs.deviation.score <- small.cs$FreeDonationAmount - small.cs.mean
small.cs.squared.deviation <- small.cs.deviation.score^2
small.cs.squared.deviation <- small.cs.deviation.score * small.cs.deviation.score
small.cs.sums.of.squares <- sum(small.cs.squared.deviation)
## could be rewritten like so: 
small.cs.ss <- sum((small.cs$FreeDonationAmount - small.cs.mean)^2)

small.cs.deg.freedom <- small.cs.n - 1
small.cs.variance <- small.cs.sums.of.squares / small.cs.deg.freedom
small.cs.std.dev <- sqrt(small.cs.variance)

## big
big.cs.deviation.score <- big.cs$FreeDonationAmount - big.cs.mean
big.cs.squared.deviation <- big.cs.deviation.score^2
big.cs.sums.of.squares <- sum(big.cs.squared.deviation)
## could be rewritten like so: 
big.cs.ss <- sum((big.cs$FreeDonationAmount - big.cs.mean)^2)

big.cs.deg.freedom <- big.cs.n - 1
big.cs.variance <- big.cs.sums.of.squares / big.cs.deg.freedom
big.cs.std.dev <- sqrt(big.cs.variance)

## Comment on the size of the standard deviation in relation to the mean
## Add your remarks as hashtag comments.

# big cs = 7.80, s = 2.89
# small cs M = 8.57, s = 2.48
# Diff in means ~ .7 with a s ~ 2.5-2.9

## END OF EXAM.

## LECTURE 7 -- COVARIANCE
## DO TWO VARIABLES IN A DATA SET VARY TOGETHER???

## DiceGameKept - amount of money kept / not donated
## FreeDonationAmount - amount of money given away

## Do these two variables vary together (pre-cursor for correlation)

experiment.data$DiceGameKept
mean.DiceGameKept <- mean(experiment.data$DiceGameKept)
deviation.DiceGameKept <- experiment.data$DiceGameKept - mean.DiceGameKept

experiment.data$FreeDonationAmount
mean.FreeDonationAmount <- mean(experiment.data$FreeDonationAmount)
deviation.scoreFreeDonationAmount <- experiment.data$FreeDonationAmount - mean.FreeDonationAmount

## There is no need to square the values
## because the sum of cross products is not 0
cross.product <- deviation.DiceGameKept * deviation.scoreFreeDonationAmount
sum.cross.product <- sum(cross.product)

deg.freedom

covariance <- sum.cross.product / deg.freedom

## Verify
cov(experiment.data$DiceGameKept, experiment.data$FreeDonationAmount)

## A measure of the relationship between two variables
## Not standardized, meaning this value can be anything -0.45 or -1,000,000, +1,000,000
## The sign of the value indicates the relationship: negative is inverse, positive is direct

## STANDARDIZATION
## Takes a dataset and 
## converts its mean to be 0, and its 
## standard deviation to 1

par(mfrow = c(1,3))
plot(experiment.data$DiceGameKept, cex = 1)
plot(deviation.DiceGameKept, cex = 1)
plot(z.score, cex = 1)

z.score.DiceGameKept <- deviation.DiceGameKept / sd(experiment.data$DiceGameKept)

## The covariance of the z-scores (standardized data) = correlation coefficient (Pearson's)
## Bounded between -1 and +1
## where 0: no relationship at all
## -1: strong / perfect negative or inverse relatioship
## +1: strong / perfect positive or direct relationship

z.score.FreeDonationAmount <- deviation.scoreFreeDonationAmount / sd(experiment.data$FreeDonationAmount)

cov(z.score.DiceGameKept, z.score.FreeDonationAmount)

# -0.05 - a value very close to 0, a negligible / small negative correlation

cor(experiment.data$DiceGameKept, experiment.data$FreeDonationAmount)

# -0.05