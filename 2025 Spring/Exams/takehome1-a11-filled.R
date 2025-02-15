library(lsr) ## optional if calculating skew, kurtosis

## TAKE-HOME EXAM 1
## PSYC 2300 - APPLIED STATISTICS 1
## INTENDED DURATION: 2 hours (not monitored)

## EXAM REGULATIONS: 
## 1. Do not discuss the exam with anyone.
## 2. You can message Dr. Orban with any questions, including feedback on homework performance to assist with answers on this exam.
## 3. You may use resources such as the textbook, lecture slides, lecture R notes and homework to complete this exam. 
## 4. Do not talk to classmates. 
## 5. Do not talk to tutors, on online forums or any other means
## This is an exam. Rule violations will be investigated by the dean's office for academic integrity violation. 

## About the Data Set: 
## The data set describes chimpanzees' personality
## File name on GitHub (inside the "Exams" folder): Rawlings_et_al_chimp_LT_personality_data.csv

## Variables you will use are: "Sex", "T2 dominance"

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Exams/Rawlings_et_al_chimp_LT_personality_data.csv"
chimp_data <- read.csv(data_link)

## NORMALITY
## Assess `T2 dominance` for normality. Draw on your of knowledge of normal curves, 
## skew, kurtosis, outliers, variability to make your conclusions. Use technical language (as per textbook) and visualizations.
## to support your arguments. Keep your work clean with headings and comment your code.

### Histogram
hist(
  chimp_data$T2.dominance,
  main = "Histogram of Chimp Dominance at Time 2",
  xlab = "T2 Dominance",
  col = "darkblue",
  border = "white"
)

### Comments on normality
## No obvious outliers 
## Skewness: level of asymmetry in the distribution.
## There is skew: Negative skew (imagive histogram as the top side of a large invisble arrow -- this arrow is pointing in the negative direction along the x-axis)
## Kurtosis: sharpness of the peak of a frequency distribution
## Accepted range of answers based on eyeballing the graph: 
## Leptokurtic: too pointy
## Mesokurtic: just right
## Platykurtic: too flat

### Boxplot
boxplot(
  chimp_data$T2.dominance,
  main = "Boxplot of Chimp Dominance at Time 2",
  xlab = "T2 Dominance",
  ylab = "Levels of Dominance",
  col = "darkred",
  border = "gray"
)

## CENTRAL TENDENCIES
## Where is the middle of the data for `T2 dominance`?
## Justify your answer using concepts of normality, and measures of central tendencies. 
## All calculations using the manual method (but you can use built-in functions for verification)
## Keep your work clean with headings and comment your code.

##########
### Mean #
##########
sum_of_dominance <- sum(chimp_data$T2.dominance)
participant_numbers <- length(chimp_data$T2.dominance)
dom.mean <- sum_of_dominance / participant_numbers

## Validation
mean(chimp_data$T2.dominance)

############
### Median #
############

## Decision: Does this data have an even or an odd number of observations?
n.dom <- length(chimp_data$T2.dominance)
## 50 is an even number, therefore the 2 middle points need to be picked out

sorted_data <- sort(chimp_data$T2.dominance)
midVal1 <- sorted_data[n.dom/2]
midVal2 <- sorted_data[(n.dom/2)+1]
medianVal <- mean(midVal1, midVal2)

## Validation
median(chimp_data$T2.dominance)


############
### Mode ###
############

table(rle(sorted_data))

### Two modes (bimodal): 5.34, 5.33

## Concept question: can you imagine any circumstances where the mode is a better metric of central tendencies than either the median or mean?

### If the data is "nominal" type
### When the data is not normally distributed, but has multiple peaks

## VARIABILITY
## Compute variance and standard deviation for `T2 dominance`.
## Keep your work clean with headings and comment your code. 
## Compute interim variables (deviation scores, sums of squares)

## Step 1: Deviation Scores
## Use mean calculation from earlier section (bonus points for not replicating your work)
centred.dom <- chimp_data$T2.dominance - dom.mean ## dom.mean calculated on L69

## Verification: Do these values sum to 0?
sum(centred.dom) ### Yes, nearly zero

## Step 2: Square *then* sum values -- called sums of squares
ss.dom <- sum(centred.dom^2)

## Easy mistake, sum then square values
sum(centred.dom)^2 ### results in a value close to 0

## Step 3: Variance
df.dom <- n.dom - 1 ## bonus point for reusing sample size calculation from earlier

variance.dom <- ss.dom / df.dom

## Validation
var(chimp_data$T2.dominance)
## must be identical to manual calculation! "close enough" is not good enough here

## Step 4: Steandard Deviation

sd.dom <- sqrt(variance.dom)
## SQRT brings scale of measurement back to original units (recall exponent introduced on L120)

## Validation
sd(chimp_data$T2.dominance)
## must be identical to manual calculation! "close enough" is not good enough here

## FILTERING / SUBSETTING
## Finally, create one variable where we can see all `T2 dominance` values but only sex "1" 

sex1 <- chimp_data[chimp_data$Sex == 1,]

## results in a smaller dataframe containing just sex 1

## Create another variable where we can see all `T2 dominance` values but only for sex "2"

sex2 <- chimp_data[chimp_data$Sex == 2,]

## results in a smaller dataframe containing just sex 2

## Compute the mean for `T2 dominance` for each of the sexes. Do these means look different?

sex1.mean <- sum(sex1$T2.dominance) / length(sex1$T2.dominance)

sex2.mean <- sum(sex2$T2.dominance) / length(sex2$T2.dominance)

## Speculate on possible dominance differences between the sexes. 
## Add your remarks as hashtag comments.

## Maybe sex 1 represents males and they show more dominance than females.


