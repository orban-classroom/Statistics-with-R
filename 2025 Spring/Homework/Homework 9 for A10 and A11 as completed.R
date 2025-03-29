## Homework 8
##############

## You will use a new data set for this homework, dealing with disgust sensitivity
## The data package and description if doung in the Data/disgustsensitivity folder.
## Read about the data set by looking at the "10-91-1-PB.pdf" file.

## Load the disgust sensitivity data from the GitHub folder:
## Load the data file: Berger_and_Anaki_disgust_scale_2014_1_comma_delimited_cleaned.csv

## You will deal with two variables: `Age`, `Mean_general_ds`
## Note: Mean_general_ds refers to disgust sensitivity

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/Berger_and_Anaki_disgust_scale_2014.csv"
ds_data <- read.csv(url)

## FILTER
## Create a filter to isolate the two variables in question while also removing potential NA cells.

ds_data_clean <- na.omit(ds_data)

## PRE-CHECKS
## Generate box-plots and histograms of each of the variables 
## Compute skewness and kurtosis values.
## Comment on normality (as per textbook definitions)
library(psych)

hist(ds_data_clean$Age)
# Appears positively skewed, quite pointy (leptokurtic)
skew(ds_data_clean$Age)
# Confirms significant positive skew
kurtosi(ds_data_clean$Age)
# Confirms slight leptokurtosis

hist(ds_data_clean$Mean_general_ds)
# looks fairly symmetrical, slightly negative if anything. definitely leptokurtic
skew(ds_data_clean$Mean_general_ds)
# Confirms mild negative skew
kurtosi(ds_data_clean$Mean_general_ds)
# Confirms mild leptokurtosis

## TASK 1 & TASK 2
## TASK 1: Standardize the two variables and compute the correlation coefficient manually.
## Describe your findings

## TASK 2: Compute the covariance between `Age` and `Mean_general_ds`?
## Show your work manually. Verify using built-in function and run diagnostics along the way.

age.z <- (ds_data_clean$Age - mean(ds_data_clean$Age)) / sd(ds_data_clean$Age)
disgust.z <- (ds_data_clean$Mean_general_ds - mean(ds_data_clean$Mean_general_ds)) / sd(ds_data_clean$Mean_general_ds)

age.disgust.cross.product <- age.z * disgust.z

age.disgust.cp.sum <- sum(age.disgust.cross.product)
age.disgust.df <- nrow(ds_data_clean)

age.disgust.z.cov <- age.disgust.cp.sum / age.disgust.df

# Verification
cor(ds_data_clean$Age, ds_data_clean$Mean_general_ds)

# Weak negative correlation between age and disgust sensitivity: older people have less disgust sensitivity. 

## TASK 3 Generate a scatterplot of the variables.
## Comment on the appearance. 

plot(ds_data_clean$Age, ds_data_clean$Mean_general_ds)

## No clear linear pattern
## Most data aggregates in the lower quadrant of age: far more 20-30 year olds than any other age group
## Most disgust sensitivity data falls within 2-3 points. 
## Looking at outliers, more people have very low disgust sensitivity than very high disgust sensitivity

## TASK 4 Split the data by gender
## 

sex0 <- ds_data_clean[ds_data_clean$Gender == 0,]
sex1 <- ds_data_clean[ds_data_clean$Gender == 1,]

## TASK 5 Generate a barplot with error bars indicating the mean of Mean_general_ds and SEM.
## Bars should reflect the two genders. 

sex0mean <- mean(sex0$Mean_general_ds)
sex1mean <- mean(sex1$Mean_general_ds)

means <- c(sex0mean, sex1mean)


sex0sem <- sd(sex0$Mean_general_ds) / sqrt(nrow(sex0))
sex1sem <- sd(sex1$Mean_general_ds) / sqrt(nrow(sex1))

sems <- c(sex0sem, sex1sem)


midpoints <- barplot(means,
        names.arg = c("Sex 0", "Sex 1"), 
        main = "Sex Differences in Mean Disgust Sensitivity", 
        ylim = c(0,3) ## create a bit of padding on the y-axis top to make space for the error bars
        )

arrows(midpoints, means-sems,
      midpoints, means+sems,
      angle = 90, 
      code = 3,
      length = .05)


## end of homework## eMean_general_dsnd of homework