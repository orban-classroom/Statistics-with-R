## Homework 8
##############

## You will use a new data set for this homework, dealing with disgust sensitivity
## The data package and description if doung in the Data/disgustsensitivity folder.
## Read about the data set by looking at the "10-91-1-PB.pdf" file.

## Load the disgust sensitivity data from the GitHub folder:
## Load the data file: Berger_and_Anaki_disgust_scale_2014_1_comma_delimited_cleaned.csv

## You will deal with two variables: `Age`, `Mean_general_ds`

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/disgustscale/Berger_and_Anaki_disgust_scale_2014_1_comma_delimited_cleaned.csv"
ds_data <- read.csv(url)

## FILTER
## Create a filter that you can call "analysis_dataframe" or something similar that matches your
## variable naming style, and isolate the two variables in question while also removing potential NA cells.

## Compose a data frame containing variables of interest
analysis_df <- data.frame(
                  age = ds_data$Age,
                  disgust = ds_data$Mean_general_ds
)

## Data sanitization
## Option 1
analysis_df <- na.omit(analysis_df) ## get rid of NA's in any cell
## Drops entire rows where a single NA is detected

## Alternative method to remove NA values
analysis_df <- analysis_df[complete.cases(analysis_df),]

## PRE-CHECKS
## Generate box-plots and histograms of each of the variables 
## Compute skewness and kurtosis values.
## Comment on normality (as per textbook definitions)




## QUESTION 1
## Compute the covariance between `Age` and `Mean_general_ds`?
## Show your work manually. Verify using built-in function and run diagnostics along the way.






## QUESTION 2
## Standardize the two variables and compute the correlation coefficient manually.
## Describe your findings





## Generate a scatterplot of the variables.
## Comment on the appearance. 

plot(ds_data$Age, ds_data$Mean_general_ds)





## end of homework