## Homework 9
##############

## A new data set has been added to the data folder called "stressdata.csv"
## Relevant columns: stress, 1: stressed participants, 2: not stressed participant
## hrv_rmssd_ibi: Heart-rate variability is a measure of sympathetic nervous system functioning. Uses the small beat to beat variation of your heart beat to estimate how well your nervous system throttles between parasympathetic and sympathetic nervous system activity. Lower numbers typically mean greater stress. 
## cortisol: Standardized cortisol measures indicating amount of cortisol expression widely considered to be the "Stress hormone"
## Task 1: Compute the correlation between HRV (Heart-Rate Variability) and Cortisol under each stress (1) and no-stress (0) conditions. 
## What is the relationship between heart-rate variability and cortisol? Is the relationship identical while participants are under stress or not stressed?
## Task 2: Create a barplot of mean HRV measures for stress + no stress conditions. Add an error bar indicating SEM
## Task 3: Create a barplot of mean cortisol measures for stress + no stress conditions. Add an error bar indicating SEM


## FILTER
## Create a filter that you can call "analysis_dataframe" or something similar that matches your
## variable naming style, and isolate the two variables in question while also removing potential NA cells.

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/stressdata.csv"
raw.data <- read.csv(url)

## Just filtered
stress.df <- raw.data[raw.data$stress == 1, c(3:5)]
no.stress.df <- raw.data[raw.data$stress == 0, c(3:5)]

## Sanitizing the filtered data frame
sanitized.stress.df <- na.omit(stress.df)
sanitized.no.stress.df <- na.omit(no.stress.df)

## PRE-CHECKS
## Generate box-plots and histograms of hrv_rmssd_ibi and cortisol variables split by stress
## Compute skewness and kurtosis values.
## Comment on normality (as per textbook definitions)




## QUESTION 1
## Compute the covariance between `hrv_rmssd_ibi` and `cortisol` under no stress, and under stress?
## Show your work manually. Verify using built-in function and run diagnostics along the way.






## QUESTION 2
## Standardize the four variables and compute the correlation coefficient manually.
## Describe your findings





## Generate two scatterplots of the variables.
## Comment on the appearance. 






## Generate a barplot and add error bars representing SEM.





## end of homework