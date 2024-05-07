# Variable types - Scales of Measurement (Psychology expression)

## Psychology
# Nominal: Not a number; e.g., Animals in the zoo (giraffe, elephant, seal); gender (many otions), children's names, eye colour
# Ordinal / Rank order: unknown difference between options: True/False, Olympic race results, Likert-type scales (How hungry are you on a scale of 1-7)
# Interval: numerical, no true 0 point. voltage, pixel data, reaction time, 
# Ratio: numerical, with true 0 point. Temperature

## Computing Sciences (world R, and other applications)
# Numeric: any kind of number, whole or with a decimal (float)
# Integer: strictly whole numbers
# Character: anything text based. Also known string
# Boolean: TRUE and FALSE values

# Map the Psychology naming scheme to Computing science
# Numeric: interval & ratio based measurements
# Integer: can be some special interval or ratio based measurements. Possibly ordinal
# Character: nominal, ordinal data
# Boolean: some ordinal data

# A vector that contains only characters

zoo_animals <- c("children", "elephants", "penguins")
# not good (having double quotes at the beginning and end of the vector: 
zoo_animals <- c("children, elephants, penguins") # considered to be single element

# A vector with boolean data types

went_to_campus <- c(TRUE, FALSE, TRUE, TRUE, T, F)
# has to be ALL CAPS, but can be written out or type the first letter only

commute_to_campus <- as.integer(c(30, 27, 36, 96))

class(zoo_animals)
class(went_to_campus)
class(commute_to_campus)

class(as.integer(zoo_animals))

class(c("30", "27", "36", "96"))


as.integer(c("30", "children", "36", "elephants")) + 5


## Subsetting or Filtering or sub select
## How to select some of the items in a vector, but not others

messy_data <- c("30", "children", "36", "elephants")

# use a square bracket
messy_data[1] # pick the first one
messy_data[3] # pick the third one
messy_data[1:3] # first through third elements
messy_data[2:4] # second through fourth
messy_data[-2] # remove the second element, show the rest
messy_data[c(1,3)] # select the first and the third elements


# Central Tendencies

# What is the middle of the data set?
# Use any of the following: mean, median, mode
# they all have issues, they are all imperfects of the middle

# Mean is great: it takes all values into consideration, but
# it's too sensitive to outliers / extreme values

caffeine_intake <- c(3, 0, 1, 0, 2, 1, 2, 0, 1, 0, 1, 3.5, 1, 4, 0, 1, 0, 1, 2, 1, 3)

# Pseudocode (writing code like I talk)
# mean = sum of all scores / number of scores

sum_caffeine_intake <- sum(caffeine_intake) ## 3 + 0 + 1 + 0 + 2 + 1 + 2 + 0 + 1 + 0 + 1 + 3.5 + 1 + 4 + 0 + 1 + 0 + 1 + 2 + 1 + 3
sample_size <- length(caffeine_intake)

mean_caffeine_intake <- sum_caffeine_intake / sample_size

# How many zeroes are there in the data?
# Subsetting

nocaffeine <- length(
  caffeine_intake[
    caffeine_intake == 0
    ]
  )

nocaffeine / sample_size

# Median: half-way point in the data set: 
# It's great because it ignore extreme data. But it's problematic
# because it ignores almost all of the data

# Mode: where most of the data lies

