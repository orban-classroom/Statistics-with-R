#################################################################################
## EXAM 1 
## PSYC 2300: Feb 16, 2023 L.L. ORBAN
#################################################################################
#################################################################################
## RULES
## You can use your notes, textbook and web during the exam.
## Communication with anyone, including classmates is not permitted. Collusion will lead to cheating penalties of 0 for the exam or the course.
##
## Keep your work organized: use hashtag headings, space out your code
## Write concise code (no redundant, unnecessary code)
## All of your calculations must be done manually, the "slow way". 
##
## You are encouraged to double check your work using verifications discussed in lectures
## 
## All of your answers must be supported by calculations for full points. 
## Do not hard code final answers (i.e., do not type out values)
## Partial points can be achieved even with errors so do not panic if your code produces an error.
## Answer conceptual questions as a hashtag comment. For full marks include lecture discussions

## Clear all variables in your environment
rm(list = ls())

#################################################################################
#################################################################################
## DATASET
## Data Description: The dataset contains the data of a large heterogeneous sample of participants who completed the 
## Hebrew version of the Disgust Scale Revised (DS_R), and provided various demographic variables. 
## Participants were chosen from the general population, using a convenience sampling method. They were approached 
## at various locations (e.g., shopping centres, transport hubs, and government buildings) during the period of 
## 2011- 2012.
## Source: https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2019%20Spring/data/disgustscale/Berger%20and%20Anaki%20disgust%20scale%202014_1%20comma%20delimited.csv

## Load the data into a data frame (5 points)

takehomeexam <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2019%20Spring/data/disgustscale/Berger%20and%20Anaki%20disgust%20scale%202014_1%20comma%20delimited.csv")

## Remove NA values and save it as a new variable (5 points)

cleaned_takehomeexam <- na.omit(takehomeexam)

## Make to vectors for each sex that contains that mean disgust sensitivity column, called "Mean_general_ds"

# Method 1:
# Apply sex and column filter in one rule set given in the square brackets (subset instructions)
sex1 <- cleaned_takehomeexam[cleaned_takehomeexam$Gender == 0, "Mean_general_ds"]
sex2 <- cleaned_takehomeexam[cleaned_takehomeexam$Gender == 1, "Mean_general_ds"]

# Method 2: 
# Use dollar sign to extract a single column, then apply the sex filter to the column
sex1 <- cleaned_takehomeexam$Mean_general_ds[cleaned_takehomeexam$Gender == 0]
sex2 <- cleaned_takehomeexam$Mean_general_ds[cleaned_takehomeexam$Gender == 1]

## What is the sample size? (5 points)

n_sex1 <- length(sex1)
n_sex2 <- length(sex2)

## note: nrow only works on dataframes, not on vectors
##       nrow on the dataframe gives total sample size, but not sample size of each sex

## What is the sum of all scores for both males and females? (5 points)

sum_sex1 <- sum(sex1)
sum_sex2 <- sum(sex2)

## Generate a histogram of the mean disgust scale for each sex (5 points)

hist(sex1)
hist(sex2)

## Describe both histograms' shape (5 points)

# slightly skewed, pointy. 
# Sex1 is pointer than sex2

## Based on your reading of the histogram, what is the mode of each variable? (5 points)

# sex1: 2.5
# sex2: 2

## What is the mean disgust sensitivity for each sex? (5 points)

mean_sex1 <- sum_sex1 / n_sex1
mean_sex2 <- sum_sex2 / n_sex2

## What is the median disgust sensitivity for each sex? (5 points)

median(sex1)
median(sex2)

## What is the range of scores each sex?  (5 points)

range(sex1)
range(sex2)

## Create a boxplot and comment on the appearance of the graphs & compare the variables (eyeball it) (5 points)

boxplot(sex1, sex2)

## Compute the variance for each variable (5 points)

deviation_sex1 <- sex1 - mean_sex1
deviation_sex2 <- sex2 - mean_sex2

## verification: should be a vector with positive and negative numbers
## verification: should sum to 0

ss_sex1 <- sum(deviation_sex1^2)
ss_sex2 <- sum(deviation_sex2^2)

## verification: should be a single positive value

df_sex1 <- n_sex1 - 1
df_sex2 <- n_sex2 - 1

variance_sex1 <- ss_sex1/df_sex1
variance_sex2 <- ss_sex2/df_sex2

## verification:
var(sex1)
var(sex2)

## Compute the standard deviation for each variable (5 points)

s_sex1 <- sqrt(variance_sex1)
s_sex2 <- sqrt(variance_sex2)

## verification
sd(sex1)
sd(sex2)

## For the following calculations, you will use the "Education" variable and the mean disgust scale "Mean_general_ds"
## Do not filter by sex

## Create the necessary filtered vectors for the subsequent calculations  (5 points)

education <- cleaned_takehomeexam$Education
meandisgust <- cleaned_takehomeexam$Mean_general_ds

## Create a scatterplot between the two variables.  (5 points)

plot(education,meandisgust)
## or
plot(meandisgust,education)

## Eyeball the type of relationship they have, add describe it  (5 points)

## noisy and random but perhaps slightly negative relationship

## Compute the covariance between the two variables.  (5 points)

n <- length(education)
df <- n - 1

deviation_edu <- education - mean(education)
deviation_disg <- meandisgust - mean(meandisgust)

deviation_product <- sum(deviation_edu * deviation_disg)

covariance <- deviation_product/df

## vertification
cov(education,meandisgust)

## What is the direction of the relationship?  (5 points)

## negative

## What is the magnitude of the relationship?  (5 points)

## impossible to tell

## Compute the correlation between the two variables.  (5 points)

correlation <- covariance / (sd(education) * sd(meandisgust))

## verification
cor(education,meandisgust)

## What is the direction of the relationship?  (5 points)

## negative

## What is the magnitude of the relationship?  (5 points)

## small effect

## THE END
## Submit your take-home exam on Moodle by February 18, 11:59 pm