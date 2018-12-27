# Load the data
# Note that variable names can be almost anything. I'll call mine blablabla, just for fun.
# You just need to remember what it is so you can refer to it in later calculations
blablabla=read.csv(url("http://llorban.net/psyc2300/Berger_and_Anaki_disgust_scale_2014_1_comma_delimited_cleaned.csv"))

# Instead of displaying the whole data by typing the variable name "blablabla" and scrolling through all the data
# we can use the head() function to see the variable names, and a few rows of records.
head(blablabla)

# FINDING THE RANGE
# A crude measure of variability is range. Range takes the minimum and maximum values into account.
# Let's find the range of the mean general disgust scale column in our data. 
# Refer back to the output of head() to find out the exact column name from the disgust scale
# Use the following functions to find the minimum, min(), and maximum, max().
# Be sure to save the minimum and maximum values in a variable
chip = max(blablabla$Mean_general_ds) # the variable "chip" contains the maximum score
dale = min(blablabla$Mean_general_ds)

# Create a new variable that contains the range
range = chip - dale

# Display your new value
range

# FINDING THE STANDARD DEVIATION... THE HARD WAY
# Step 1: get the sum of squared deviations (aka ss, aka2 sum of squares)
# Check the textbook for the definitional formula
# Because the computer is so fast and efficient in calculating, 
# we don't need to bother with the computational formula
somethingfunny = mean(blablabla$Mean_general_ds)
ss = sum((blablabla$Mean_general_ds - somethingfunny)^2)

# Step 2: get the variance (for a sample)
# For the variance, we need to know the sample size, which I am going to call n but you can call anything you like
n = length(blablabla$Mean_general_ds)
variance = ss/(n-1)

# Display the value we just calculated
variance

# step 3: get the standard deviation
# Use the sqrt() function to find the square root of a value
s = sqrt(variance)

# Display the value you just calcualted
s

# Double check your work by applying the built-in sd() standard deviation function to the original data
sd(blablabla$Mean_general_ds)

# If the above two lines match, you've done your job well.

# DATA VISUALIZATION
# You already know how to make a histogram, here you will learn how to make a scatter plot and boxplot.
# Creating Scatterplot and boxplot

# First, I am going to define a grid in which I place the graphics c(1,3) means that I want 1 row and 3 columns
# Change the grid to your liking
# Run this command at the same time as the plot, hist and boxplot commands below.
par(mfrow=c(1,3))

# This is a scatterplot. One of the simplest way to display data. 
# The output displays each value in a graph. 
# Minimum 2 variables are required. We will plot the Disgust Scale by Gender
plot(blablabla$Gender,blablabla$Mean_general_ds)

# The boxplot is a more refined version of a scatterplot -- it displays (1) means, 
# interquartile ranges (i.e., where most of the data is found), 
# minimum and maximum values and outliers
boxplot(Mean_general_ds~Gender,blablabla)

# You already know about histograms and we'll display one here for comparison
hist(blablabla$Mean_general_ds)

# GRAPH RULES
# Going forward, it is required that you add axis labels and graph titles to all of your graphics, like so
par(mfrow=c(1,1))
plot(blablabla$Gender,blablabla$Mean_general_ds,main="This is my pretty graph", xlab="Gender", ylab="Disgust Scale")
