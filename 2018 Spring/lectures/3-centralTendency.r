# The goal of this exercise is to find the central tendency measures of a data set we generated

# Load the data we generated in the class (age)
age=c(17,27,19,23,25,20,54,21,22,22,20,19,19,28,20,19,20,19,21,59,19,19,20,21,29,21,20,35)

# Let's create a frequency table
# This is an intermediary step that reorganizes the original data (sorts it, and counts how many times each value occurs
# For this data, it is sufficient to refer to the variable "age" because it is just a vector (e.g., a series of numbers). 
# If age was a data frame, we would have to specify a column name using the "$" sign. For data frames the sequence is as follows:
# variableName$columnName. hypothetical Eg. rle(sort(age$myColumnName)
age_info = rle(sort(age))

# This is our frequency table
age_freq = data.frame(values=age_info$values, n=age_info$lengths)

# Display the frequency table and figure out the Mode of the distribution
age_freq

# Generate a histogram to get a better graphical snapshot of the data
# It should become clear that the data is highly skewed in the positive direction
hist(age)

# A partial calculation, needed for the mean is to sum all the scores. We save the result in a variable.
summed_age = sum(age)

# Another partial calculation is to find the sample size (n). We save this in a variable too.
sample_size = length(age)

# Calculate the mean by dividing the sum of scores with the sample size
mymean = summed_age/sample_size
mymean

# You can verify your calculations by using the built-in R function to compute the mean:
mean(age)

# Find the median of the data set
median(age)

# At the end of this exercise you should have a good understanding of how to calculate the central tendency measures of a continuous variable.
