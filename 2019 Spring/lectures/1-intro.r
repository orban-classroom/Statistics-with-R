# After starting R, the console is ready for input. You can enter values next to the prompt (>), and press Enter to perform calculations. 
1 + 2

# To square numbers, use the hat (^) sign:
3^2

# Use slash (/) to divide numbers and star (*) to multiply them:
4/4

7*7

# Watch out for typos

10 = 20 # means make 10 equal to 20
10 == 20 # checks to see if 10 is equal to 20

10     + 1 # spaces are ok
10+1 # squish it if you like it
# follow a standard so your code is clean. it's a bit like APA

# You can call on built-in functions to help you accomplish different tasks

citation() # outputs how you can cite the program in your paper assignments

# you can write it like so: 
citation ()
citation( )
citation(
)

# but you can't
cita tion()

# R sometimes decides to wait for more commands from you
# the plus sign means you can continue to add
# this can happen if you didn't close a bracket or didn't complete an operation
citation(
# or 
10-

# + - * / ^

2 * 2 * 2

# same as

2 ^ 2

# square root is another one

sqrt(2)

# same as

2 ^ 0.5

# order of calculation

2 + 5 * 10

# vs 

(2 + 5) * 10

# VARIABLE ASSIGNMENT
# You can assign values to variables using the operator "=". Just typing the variable by itself at the prompt will print out the value. Another form of the operator is "<-" is also good.
x <- 350
x

5 -> z
z

350 * 5

# same as 

x * z

# also can do: 

x + 4000

# An R function is invoked by its name, then followed by the parenthesis, and zero or more arguments. The following applies the function c to combine three numberic values into a vector.
y = c(1,2,3)

# Vectors can contain string values too
colours = c("red","yellow","blue")

# Text after the hastag sign within the samel line is considered a comment: 
1 + 1   # this is a comment

## Data Types
# Numerics
k = 1
k
class(k)    # prints the class name of k, "numeric"
is.integer(k)  # is k an integer?

y = as.integer(1) 
y           # prints the value of y
class(y)    # prints the class name of y, "integer"

as.integer("3.45")   # will convert it to an integer, 3

as.integer("red")   # will produce an error

## Basic vector operations
employmentStatus = c(TRUE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE)
employmentStatus

# Tells you the number of elements in the list
length(employmentStatus)

# Adds up all the values in the list
sum(employmentStatus)

# you can do arithmetics with vector operations:
sum(employmentStatus)/length(employmentStatus)

# Pick out the third element from the list
employmentStatus[3]

# Pick out the third, fourth and fifth elements from the list
employmentStatus[3:5]

## Building a data file
subjectID = c(101,102,103,104,105)
demographics = c("Surrey","Surrey","Delta","Vancouver","Langley")
employmentStatus = c(TRUE,TRUE,FALSE,FALSE,TRUE)
data = data.frame(subjectID, demographics, employmentStatus)
data
