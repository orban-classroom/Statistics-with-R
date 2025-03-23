## Homework 10
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



## PRE-CHECKS
## Generate box-plots and histograms of each of the variables 
## Compute skewness and kurtosis values.
## Comment on normality (as per textbook definitions)




## TASK 1
## Standardize the two variables and compute the correlation coefficient manually.
## Describe your findings




## TASK 2
## Compute the covariance between `Age` and `Mean_general_ds`?
## Show your work manually. Verify using built-in function and run diagnostics along the way.





## TASK 3 Generate a scatterplot of the variables.
## Comment on the appearance. 





## TASK 4 Split the data by gender
## 


## TASK 5 Generate a barplot with error bars indicating the mean of Mean_general_ds and SEM.
## Bars should reflect the two genders. 




## end of homework
