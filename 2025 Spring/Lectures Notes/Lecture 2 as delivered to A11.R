## Lecture 2 as delivered to A11
## On January 14, 2025


data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2024%20Summer/Data/202420_2300_classdata.csv"
psyc2300_data <- read.csv(data_link)

head(psyc2300_data) ## get a glimpse into the data

## What are the variables in this data frame (or data object)?
colnames(psyc2300_data)

## How many variables are there in this data frame?
length(
  colnames(
    psyc2300_data
    )
  )

## How many data points do we have in this data frame?
nrow(psyc2300_data)

tail() ## the last values of a data frame

## Displaying only the last 3 rows of the data

