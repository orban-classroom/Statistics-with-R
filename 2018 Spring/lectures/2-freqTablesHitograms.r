# Load the data we generated in class
siblings = c(1,3,3,1,2,2,1,1,1,1,0,3,1,2,5,2,0,0,2,2,1,1,2,1,6,2,2,2,1,1,2)

# use the rle function, "run length encoding"
# counts the number of times the same value appears in a row. for example, if you data set has a sequence of 
# 1, 1, 1, 2, 2, 1, 1, the rle command will spit out three 1's, two 2's and two 1's.
# However, if you *sort* your values prior to applying rle, it can be used to count the frequency of values
rle(siblings)    # execute this just to see the output of the rle functions
sort(siblings)   # execute this just to see the output of the sort function

# Let's take the frequency values and assign them to a variable
siblings_info = rle(sort(siblings))

# now let's put the rle computations into a data frame
# values, frequencies come from the rle variable, and proportions are calculated on the fly
siblings_data = data.frame(values=siblings_info$values, n=siblings_info$lengths)

# view the data table by typing in the new variable name and pressing enter
siblings_data 

# To compute the sample size, you have multiple options
# 1. Count the number values in your original data set
length(siblings)

# 2. Add up the frequencies in the "n" column of the frequency table
# Use the dollar sign ($) to refer to column names within a data frame
sum(siblings_info$n)

# Generate a Histogram of the datat
# Use the breaks argument to set the bin/grouping size)
# Try different bin sizes 
# Use the main argument to add a title
hist(siblings, breaks=5, main="This is my nice histogram title")
