# Lecture 2 Exercise 
x = c(1,2,3,4,5,6)
x_info = rle(sort(x))
x_data = data.frame(values=x_info$values, n=x_info$lengths)
hist(x_data$values, breaks=10, main="Hello world, this is my first histogram")


# generating random data
data <- sample(100, size=nrow(data), replace=TRUE)
