# Creating data files for analysis in R
# Use it early on in the course
# Used functions: data.frame, c, colnames

# Define your data file
data = data.frame(c(1,2,3,4,5))

# Name the variable (column)
colnames(data) = "X"

# Add a new variable
# Use dollar sign and whatever you would like the name of the new variable to be
data$Y = c(6,7,8,9,9)
