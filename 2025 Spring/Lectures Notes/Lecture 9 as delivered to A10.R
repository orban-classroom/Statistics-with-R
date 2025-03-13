## Lecture 9 as delivered to A10
##

my_vector <- c(1,2,2,3,4,4,4,5,5,6,7,8,9,9,9,9)

## filter: my_vector[]
## Probablity = outcome of A / total outcomes

length(my_vector)
my_vector[]

## Find out the probability of picking a value greater than 4

my_vector > 4

prob.greater.4 <- length(my_vector[my_vector > 4]) / length(my_vector)

## Find out the probability of picking a value greater than or equal to 4

my_vector >= 4

prob.greater.equal.4 <- length(my_vector[my_vector >= 4]) / length(my_vector)


## Find out the probability of picking a value smaller than 4

my_vector < 4

prob.smaller.4 <- length(my_vector[my_vector < 4]) / length(my_vector)


## Find out the probability of picking a value that is not 4

my_vector != 4

prob.not.4 <- length(my_vector[my_vector != 4]) / length(my_vector)


## Let's load some data and compute Cohen's d

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/Berger_and_Anaki_disgust_scale_2014.csv"
disgust_data <- na.omit(read.csv(data_link))

gender1 <- disgust_data[disgust_data$Gender == 1,]
gender0 <- disgust_data[disgust_data$Gender == 0,]

gender1.ds <- mean(gender1$Mean_general_ds)
gender0.ds <- mean(gender0$Mean_general_ds)

cohens.d <- (gender0.ds - gender1.ds) / sd(gender0$Mean_general_ds)
cohens.d
## Does not matter which mean goes first in the mean difference calculation
## Consequently, the sign of this value also does not matter

## Strong effect size