
# An addition
5 + 5 

# A subtraction
5 - 5 

# A multiplication
3 * 5

 # A division
(5 + 5) / 2 

# Exponentiation
2^5

# Modulo

28 %% 6

# Assign the value 42 to x
x <- 42
x = 42

# Print out the value of the variable x
x

# Assign the value 5 to the variable my_apples

my_apples <- 5
my.apples
myApples <-4
myapples

##not fine: 
my apples
my-apples
my#apples
my@apples

# Print out the value of the variable my_apples

my_apples

# Assign a value to the variables my_apples and my_oranges
my_apples <- 5
my_oranges <- 6

# Add these two variables together
my_apples + my_oranges

# Create the variable my_fruit
my_fruit <- my_apples + my_oranges

# Change my_numeric to be 42
my_numeric <- 42  #this is an integer
my_float_number <- 42.00 #this can be either a ratio or interval

# Change my_character to be "universe"
my_character <- "universe"  #this is a nominal variable

# Change my_logical to be FALSE
my_logical <- FALSE #booleans


length(my_character)

orange <- x
orange <- y
orange <- "y"
orange
orange <- "orange"
orange <- "apple" 

classlist <- c(1,2,3,4,5,6,7)



drive <- c(10,15,15,15,30,50,20,20,5,10,30,30,10,10,10,10,5,5,5,5,5,20,20,10,10,5,10,30,30,20,25)

# average = the sum of all values divided by the number of values
# mean

# painfully slow
drive_sum <- 10+15+15+15+30 ## etc... for all numbers
drive_numbofvalues <- 31

# regular slow
drive_sum <- sum(drive)
drive_n <- length(drive)
drive_mean <- drive_sum / drive_n

# fast way
mean(drive)


hist(drive, main = "Commute times", breaks = 10)
?hist


