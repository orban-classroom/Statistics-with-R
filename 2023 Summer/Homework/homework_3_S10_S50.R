##################
### Homework 3 ###
##################

# For the first few weeks, you have been using a vector data object. These are simple, quick and lovely means to represent simple data sets. We played around with the PSYC 1100 exam data for a few weeks. If you imagine loading a vector into a spreadsheet like Excel, you would have the data in one column, running vertically down. You might think of this as a data object with a single variable. 
# In this homework, you will learn to use a more complex data object called a data.frame(). A data frame contains multiple columns, or multiple variables in one object. 

### 1. 
# Create an empty data frame with two variables: one variable that runs numbers sequentially from 1 to 10,000 and a second variable that contains 10,000 random numbers between 0 and 1. Functions you will use are data.frame(), seq() and runif(). Name the first variable "SubjectID" and the second number "ReactionTime". Name this data frame, "MyFirstDataFrame"

### 2.
# Once you create a data frame, you can view the data like it's an Excel spreadsheet by clicking the dataframe's name in your global environment. You can also do things like head() to view the first 6 records. To view just one column of the data, you can use the $ like so: MyFirstDataFrame$ReactionTime or MyFirstDataFrame$SubjectID


### 3.
# Subsetting in a data frame is more complicated. Whereas in a vector you only needed to specify a single number or range of numbers to make a filter, here you have two coordinates: horizontal and vertical. For example, to filter your data for the first cell, type MyFirstDataFrame[1,1]

# Wreck your head on the following problems: 
# (a) Using the subsetting method, select the entire first column.

# (b) Using the subsetting method, select the entire 10th row. 

# (c) Using the subsetting method, select all rows where the random number is greater than 0.5

# (d) Using the subsetting method, select the first 5,000 rows


### 4.
# Now you will learn to import data from the web. One of the reasons we use GitHub is because it enables us to hold data sets there for import into our workspace in R Studio. In order to do this, we need to look up the data on GitHub, and generate a "Raw" link. There is a new folder called "Data" in this semester's GitHub Stats folder. Navigate there: https://github.com/orban-classroom/Statistics-with-R/tree/master/2023-summer
# Next, drill in and click to view the csv file called 2300data.csv
# This is the file to import. When you open it, in the top right area of the file, there is a button called "Raw" - click it and use the URL in your browser's URL bar to copy that string
# Paste it into your code like so: 

mydataframe <- read.csv("THE URL GOES HERE. DON'T LOSE THE DOUBLE QUOTE")

# Info: This raw link expires occasionally and you will need to get a new link. Any time your data load errors out, you go back and hit Raw for a new link. 

# Once you load your data, a data frame is automatically created as long as you assign it to a variable. 

### 5. 
# Execute the manual mean calculation on the ReactionTime variable using the $ sign notation. 

### 6. 
# Execute the median calculation using the method discussed in class. Specifically: 
# (a) Decide on whether your sample size is odd or even
# (b) Apply the correct subsetting code to find the middle point

### 7. 
# Execute mode the manual method discussed in class. Specifically: 
# (a) Round your value to the nearest 10 as shown in class
# (b) Apply the mode function from the lsr library

# Generate a box plot of the ReactionTime column