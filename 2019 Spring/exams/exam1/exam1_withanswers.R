#########################
##  EXAM 1, 63 points  ##
#########################

## GROUND RULES
## ============
## THIS IS A CLOSED-BOOK / NO-GOOGLE EXAM. 
## AN R-CHEATSHEET and a FORMULA CHEAT ARE THE ONLY SUPPORTS. 
## YOU HAVE THE FULL 3-HOURS TO COMPLETE THE EXAM
## THE SCRIPT YOU WRITE HERE MUST EXECUTE WITHOUT ERRORS FOR FULL MARKS. CHECK YOUR CODE FREQUENTLY AND REMOVE PROBLEM AREAS.
## REMEMBER IF YOU MAKE A MISTAKE, YOU NEED TO RE-RUN ALL LINES OF CODE THAT DEPEND ON THE PROBLEMATIC LINE. 
##

## GENERAL GRADING GUIDELINES
## ==========================
## SAVE ALL LINES OF CODE IN VARIABLES
## REUSE VARIABLES, DO NOT DUPLICATE COMPUTATIONS
## DO NOT LEAVE UNNECESSARY CODE IN THIS FILE
## SAVE INTERMEDIATE VARIABLES
##

## DATA
## YOU WILL USE THE FOLLOWING DATA TO COMPLETE THIS EXAM.
## EXECUTE THE FOLLOWING LINE TO LOAD THE DATA INTO THIS SCRIPT: 
## DATASET
exam.data <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/ubcgarbage/garbage_disposal.csv"))

## 2015 Warneken and Rosati
## ABSTRACT: The transition to a cooked diet represents an important shift in human ecology and evolution. 
## Cooking requires a set of sophisticated cognitive abilities, including causal reasoning, 
## self-control and anticipatory planning. Do humans uniquely possess the cognitive capacities 
## needed to cook food? We address whether one of humans' closest relatives, chimpanzees (Pan troglodytes),
## possess the domain-general cognitive skills needed to cook. The percentage of cooked column in this data set
## indicates the preference of chimpanzees for cooked food over raw food. Subject names refer to individual chimps.

## 1. How many variables are there? (2 points for the code that displays the number of variables)
length(exam.data)

## 2. What are the names of the variabes? (2 points for the code that displays variable names)
names(exam.data)

## 3. What is the sample size? (2 points for the code that displays sample size)
n <- length(exam.data$subject_id) ## it doesn't matter which variable you choose. You only need one definition of n

## 4. What is the sum of all scores on all variables? (6 points for the code that displays the sum of all scores)
# during exam, you were asked to ignore subject_id
sum.condition <- sum(exam.data$condition)
sum.propCorr <- sum(exam.data$proportion_correct)
sum.time <- sum(exam.data$time_at_bin)

## 5. Generate 2 histograms: one for the "proportion correct" and one for time at bin columns (6 points, output formatted histograms)
hist(exam.data$proportion_correct, 
    main = "Proportion Correct", 
    breaks = 10, 
    xlab = "Proportion")
hist(exam.data$time_at_bin, 
    main = "Time at bin", 
    breaks = 10, 
    xlab = "Time (seconds)")

## 7. What is the mean, the old fashioned for both variables? (4 points, display the value)
mean.propCorr <- sum.propCorr / n
mean.time <- sum.time / n

## 7.b. Validate your answer (in other words, use a completely different function to get the same answer) (1 point)
mean(exam.data$proportion_correct)
mean(exam.data$time_at_bin)

## 8. What is the median (use the R function, new fashioned way)? (2 points for the code that displays the value)
median.propCorr <- median(exam.data$proportion_correct)
median.time <- median(exam.data$time_at_bin)

## 9. What is the mode of each variable, using the old fashioned way (4 points for the code that displays the value)
mode.propCorr <- rle(sort(exam.data$proportion_correct))
table(mode.propCorr)
# interpret the value: 1
mode.time <- rle(sort(exam.data$time_at_bin))
table(mode.time)
# interpret the value: uninterpretable in its form. Requires binning (not yet discussed)

## 6. Based on the shape of the histograms, and the locations of the means, medians and modes, 
## what can you conclude about the shape of each distribution? (4 points, add comments as a hashtag remark)
# proportion correct: high negative skew, mesokurtic, mean, median and mode are in different places indicating skew
# time at bin: high positive skew, leptokurtic, mean, median and mode are in different locations, supporting positive skew conclusion

## 9. What is the range of scores of the "percentage of raw percent" variable?  (4 points for the code that displays the value)
range.propCorr <- range(exam.data$proportion_correct)
range.time <- range(exam.data$time_at_bin)

## 10. Center both variables (4 points points for the code that displays the value))
centered.propCorr <- exam.data$proportion_correct - mean.propCorr
centered.time <- exam.data$time_at_bin - mean.time

## 11. Compute the sums of squares for both variables, the old fashioned way (6 points for the code that displays the value)
## Save an intermediate variable for squared scores
sqd.propCorr <- centered.propCorr^2
sqd.time <- centered.time^2

ss.propCorr <- sum(sqd.propCorr) 
ss.time <- sum(sqd.time)

## 12. Compute the variance of each variable, the old fashioned way (4 points for the code that displays the value)
variance.propCorr <- ss.propCorr/(n-1)
variance.time <- ss.time/(n-1)

## 12.b. Validate your answer (in other words, use a completely different function to get the same answer) (2 points)
var(exam.data$proportion_correct) == variance.propCorr
round(var(exam.data$time_at_bin)) == round(variance.time)

## 13. Compute the standard deviation for both variables, the old fashioned way (4 points points for the code that displays the value))
s.propCorr <- sqrt(variance.propCorr)
s.time <- sqrt(variance.time)

## 13.b. Validate your answer (in other words, use a completely different function to get the same answer) (2 points)
sd(exam.data$proportion_correct) == s.propCorr
sd(exam.data$time_at_bin) == s.time

## 14. Compute the covariance of the two variables, the old fashioned way (4 points)
# Possible intermediate variables
variable.product <- centered.propCorr * centered.time

covariance <- sum(variable.product)/(n-1)

## 14.b. Validate your answer (in other words, use a completely different function to get the same answer) (1 point)
round(cov(exam.data$proportion_correct,exam.data$time_at_bin),4) == round(covariance,4)

## 15. Compute the correlation coefficient, r, between the choice delay cooked and choice delay raw variables. (4 points for the code that displays the value)
# Possible intermediate variables
stdev.products <- s.propCorr * s.time

r <- covariance / stdev.products

## 15.b. Validate your answer (in other words, use a completely different function to get the same answer) (1 point)
round(cor(exam.data$proportion_correct, exam.data$time_at_bin),4) == round(r,4)

## 16. What conclusion can you draw from the correlation answer in 15? (6 points, add comments as a haghtag remark)
# There is very low or no correlation between proportion of correct and time at bin variables. 
