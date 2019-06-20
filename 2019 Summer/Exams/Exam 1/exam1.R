## EXAM 1 
## PSYC 2300 S10 2019-06-20 LLO

#################################################################################
#################################################################################
## PREAMBLE
## You can use your notes, textbook and web during the exam.
## Communication either with a classmate, over the phone or over the web is ***absolutely forbidden***. 
## Suspected copied answers will lead to cheating penalties of 0 for the exam or the course.
## Keep your work concise and clean: use hashtag headings, space your code out
## Write concise code
## All of your calculations must be done manually, the "slow way". 
## Do not do unnecessary calculations or create variables not required to answer a question. 
##   Save intermediate variable required for a final computation. 
##   E.g., if the question asks for a mean, save the sum and length variables
## You are encouraged to double check your work.
## All of your answers must be supported by calculations for full points. Do not hard code final answers (type out values)
## Partial points can be achieved even with errors so do not panic if your code produces an error.
## Answer conceptual questions as a hashtag comment. For full marks include lecture discussions

## Clear all variables in your environment
rm(list = ls())

#################################################################################
#################################################################################
## DATASET 1 
## Data file on GitHub: payparkingstations.csv
## Location: 2019 Summer :: Exams :: Exam 1
## Surrey Data Set
## Data Synposis: This data set was downloaded from the Surrey city website and provides the location of 
## on-street pay parking in Surrey along with the parking rates for each station. For further information 
## please visit the City of Surrey Pay Parking Stations web page. Accessible https://data.surrey.ca/dataset/pay-parking-stations
## There are a variety of columns, but you will work on ly on the hourly parking rate variable.
## What is the sample size? (5 points)

## What is the sum of all scores? (5 points)

## Generate a histogram of the hourly parking rate variable (5 points)

## Describe the histogram's shape (5 points)

## What is the mean, median and mode hourly parking rate?  (9 points, 3 points per calculation)

## What is the range of scores on the hourly parking rate variable?  (10 points)

## Conceptual: Based on your reading of mean, median and mode, do you think this is a normal distribution? (5 points)

#################################################################################
#################################################################################
## DATASET 2
## Data File on GitHub: rainfalljanuary2018.csv
## Location: 2019 Summer :: Exams :: Exam 1
## Surrey Data Set
## Provides concise rainfall statistics from the City of Surrey's six rain gauge stations. Rainfall levels are 
## recorded at 5 minute intervals and are presented in monthly tables for the year 2018. All measurements are 
## in millimeters. For information on comparing rainfall summaries between the current and previous month, 
## Downloaded from see the City's Rainfall Monitoring Site: https://data.surrey.ca/dataset/rainfall-monitoring


## Compute the correlation coefficient between the following districts (50 points): 
## Port Kells and White Rock
## Port Kells and Surrey Kwantlen Park. 
## Comment on the following results: 
##    Interpret the correlation between Port Kells and White Rock
##    Interpret the correlation between Port Kells and Surrey Kwantlen Park
##    Compare the two correlation coefficients. What conclusions can you draw?

## Save all intermediate variable required for the computation of the correlation coefficient.


#################################################################################
#################################################################################
## DATASET 3
## Data file on GitHub: financialinformationactuals2016.csv
## Location: 2019 Summer :: Exams :: Exam 1
## Surrey Data Set
## This file contains summary of the City of Surrey’s budget financial information for 2016

## Standardize the Salaries and OperatingCosts variables, and answer the following questions (35 points)
##    Which Financial Division is the most expensive in terms of Salaries?
##    Which Financial Division is the most expensive in terms of Operating Costs?
