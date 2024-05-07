# Variable types

# In Psychology
#
#  Nominal: Male, Female, red, blue, purple
#  Ordinal (Rank order): there is a difference, but we don't what that difference is
#  Interval: continuous numerical variables
#  Ratio: continuous numerical variables, with a true 0 point. Celsius, temperature

# In Computing Science
# 
# Numeric: any decimal number (float values)
# Integers: whole numbers
# Characters: text based values
# Boolean: TRUE or FALSE values (also can be coded as 0's and 1')

# Computing science to Psychology
# Characters -> Nominal, Ordinal
# Numeric -> Interval and Ratio
# Integer -> Interval and Ratio
# Boolean -> Interval and Ratio (if they are all 0's and 1')

# How to create vectors
# vector: a list of values

# Create a vector of a nominal variable: items found in a kitchen
# & assign it to a variable

Kitchen_item <- c("fork", "spoon", "fridge", "plates") ## Correct: 4 items
Kitchen_item <- c("fork, spoon, fridge, plates") ## Incorrect: 1 item
Kitchen_item <- c("fork 23", "12", "fridge 32", "24") # recognized as character, integers cannot be extracted
Kitchen_item <- c("23", "12", "32", "24") # recognized as character, integers can be extracted
Kitchen_item <- c("fork", 12, "fridge", 24) # recognized as character, integers can be extracted

class(Kitchen_item)

as.integer(Kitchen_item)


# Create a vector of a boolean variable: List of whether your like 
# your courses this semester or not. Assign it to a variable

my_courses <- c(TRUE, TRUE, TRUE, TRUE, T, F)

# Create an integer vector: pens and pencils in your view

writing_instruments <- as.integer(
                              c(3, 2)
                              )
class(writing_instruments)

# Subsetting or Filtering
# Super important concept
# Pick out / Select some of the values, but not all from your data object
# Use square brackets [ ]
Kitchen_item[1]
Kitchen_item[2]
first_half <- Kitchen_item[1:2]
second_half <- Kitchen_item[3:4]
Kitchen_item[1:4] # basically, all of them, since the vector is 4 items long
Kitchen_item[c(1,3:4)] # pick out specific elements from the list

# Statistical Concepts: Central Tendencies

# What does the mean mean?
# Capture the center of the data cloud
# A way to summarize / describe the overall shape of the data

# Sensitive to outliers. Outliers are extreme values
# It's not ideal for all data sets
# E.g., salary, Vancouver real estate prices

# Pseudocode: Conceptual code to capture what I want to calcuate
#  mean = sum of all scores / the number of scores
#  number of scores: sample size
#  sum() - adds up all values in a vector
#  length() - counts all values in a vector

# Let's make up some data: 
# How many cups of caffeinated beverages have you had today?
caffeine_intake <- c(1,1,2,2,0,0,1,2,0,3,1,3,2,0,0,0,1)

sum_of_scores <- sum(caffeine_intake) ## essentially: 1+1+2+2+0+0+1+2+0+3+1+3+2+0+0+0+1
sample_size <- length(caffeine_intake)
mean_caffeine_intake <- sum_of_scores / sample_size
mean_caffeine_intake

# Median
# Half-way point: If you count all your values, and you order them, 
# you count out to the half way through your data cloud
# If you have an even number of numbers, you take the mean of the middle two values
# If you have an odd number of numbers, you take the middle value


# Mode
# The most frequently occuring value in the data set



