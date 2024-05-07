# Lecture 4

# Raw GitHub link: https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-spring/data/2300data.csv

classdata <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-spring/data/2300data.csv")

classdata$hrs.sleep.weekly # this behaves like a vectors
length(classdata$hrs.sleep.weekly) # This is the sample size
length(classdata) # This is NOT the sample size. This does not behave like a vector
                  # Tells us how wide the data frame is (i.e., number of columns)

nrow(classdata)   # sample size for data frame
sum(classdata)    # meaningless. Summing up a dataframe sums every cell in every column
sum(classdata$hrs.sleep.weekly)  # apply it to a particular column

# Centering the data set. i.g., producing deviation scores
# You need th mean + measure the distance of each score from the mean

# Mean
# Hours of exercise
sum_ex <- sum(classdata$hrs.exercise.weekly)
n <- nrow(classdata)
mean_ex <- sum_ex / n

centred_score <- classdata$hrs.exercise.weekly - mean_ex

# Verify / double-check your wok
# centred scores should add up to 0

sum(centred_score) # this is zero
# more correctly
round(
  sum(centred_score), 
  digits = 2
  )

# Visualize the raw vs centred scores
boxplot(
  classdata$hrs.exercise.weekly, 
  centred_score
)

# Goalpost: Sum of squares

ss <- sum(centred_score^2)
 # Squared deviation scores: A correctly squared centred score vector should only have bigger positive numbers
 # SS: a single large positive number

var_ex <- ss/(n-1)

# the one liner for variance calculation
var(classdata$hrs.exercise.weekly)


# Standard Deviation

s_ex <- sqrt(var_ex)

# one liner for standard deviation
sd(classdata$hrs.exercise.weekly)


