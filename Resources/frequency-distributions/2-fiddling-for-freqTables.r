x = c(1,2,3,4,5,6)

# use the rle function, "run length encoding"
# counts the number of times the same value appears in a row. for example, if you data set has a sequence of 1, 1, 1, 2, 2, 1, 1, the rle command will spit out three 1's, two 2's and two 1's.
# However, if you *sort* your values prior to applying rle, it can be used to count the frequency of values

x_info = rle(sort(x))

# put the rle calculations in a data frame
# values, frequencies come from the rle variable, and proportions are calculated on the fly
x_data = data.frame(values=x_info$values, frequencies=x_info$lengths, proportions=x_info$lengths/length(x))

sum(x)
sum(x)^2
sum(x^2)


# Add a new variable
# Use dollar sign and whatever you would like the name of the new variable to be
data$Y = c(6,7,8,9,9)


# other functions
summary(variable)

## reading in a csv file
x <- read.csv(url("URL"))

# generate a histogram
hist(x_data$values, breaks=10, main="Hello world, this is my first histogram")

* * *
Grid of graphs
par(mfrow=c(2,2)) # 2 x 2 grid; mfrow=c(3,1) for 3 graphs on top of each other
hist(x_data$values, breaks=5)
hist(x_data$values, breaks=10)
hist(x_data$values, breaks=20)
hist(x_data$values, breaks=100)

# One figure in row 1 and two figures in row 2
# layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))

# * * * 

# random data
data <- sample(100, size=nrow(data), replace=TRUE)

