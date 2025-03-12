## Lecture 10 Probability


my_vector <- c(4,3,3,3,4,4,5,5,6,7,8,9)

## What is the chance of picking a value greater than 5? 

## FILTER RULE
my_vector > 5

## IMPLEMENTED TO SELECT THE RELEVANT DATA
my_probability_1 <- length(my_vector[my_vector > 5]) / length(my_vector)

## What is the chance of picking a value greater than or equal to 5?

my_probability_2 <- length(my_vector[my_vector >= 5]) / length(my_vector)

## What is the chance of picking a 3?

## FILTER RULE
my_vector == 5

my_probability_3 <- length(my_vector[my_vector == 3]) / length(my_vector)

## What is the chance of picking a value that is not a 5?

## FILTER RULE

my_probability_4 <- length(my_vector[my_vector != 5]) / length(my_vector)

## Pseudocode
## probability = number of outcomes classified as x / total number of outcomes


## Effect Size

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/Berger_and_Anaki_disgust_scale_2014.csv"
disgust_data <- na.omit(read.csv(data_link))

mean(disgust_data$Mean_general_ds)

young_folks <- disgust_data[disgust_data$Age < 30,]
old_folks <- disgust_data[disgust_data$Age >= 30, ]



## Effect size - Cohen's d
## What is the chance that any hypothesis test will commit a Type I or Type II error?
## Higher value = lower chance

cohen <- (mean(young_folks$Mean_general_ds) - mean(old_folks$Mean_general_ds)) / sd(young_folks$Mean_general_ds)



