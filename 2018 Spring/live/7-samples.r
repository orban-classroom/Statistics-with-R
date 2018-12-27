## Lecture 7
## SAMPLES & VARIABILITY

# Loading a couple of data sets
x=read.csv(url("http://llorban.net/psyc2300/1100_exam_grades.csv"))
y=read.csv(url("http://llorban.net/psyc2300/Berger_and_Anaki_disgust_scale_2014_1_comma_delimited_cleaned.csv"))

# New trick: Output just the column names without any data
names(x)

# A more powerful way to apply a function to your data set. 
# All columns get affected at once
# First argument: the data on which to apply the function
# Second argument: An undescriptive code on how to apply the function
# 		2 means to do it by column (1 means to do it by row)
# Third argument: specifies which function to apply to the data
# The line below computes the mean for all three columns of data: student id, exam 2 and exam 3
apply(x,2,mean)

# Challenge: compute standard deviation using the apply function
apply(x,2,sd)

# Let's learn to create a brand new function. A new function will work
# very similarly to built-in functions. 
# Here is a new function that duplicates the calculation of the mean:
mymean = function(local_variable){
  sum(local_variable)/length(local_variable)
}

# Verify that the function works:
apply(x,2,mymean)
apply(x,2,mean)

##### 
# Challenge: Compute the SEM for exam 2
# sem = stdev/square root of sample size

sem = sd(x$exam_2)/sqrt(length(x$exam_2))

# Challenge: Convert this this computation into a function
# that can be used with any data set:
sem = function(local_variable) {
  sd(local_variable)/sqrt(length(local_variable))
}

# The "local_variable" can be anything. The purpose of this variable is to 
# be used within the function to pass around the data that was fed into it 
# using the "apply" function"

# Use the "apply" function to call up our self-made SEM function
apply(x,2,sem)
# Show that this function works for any data set: 
apply(y,2,sem)

##### PLOTTING SEM ON ERROR BARS
# Load the means into a variable
# One way
# Step 1: Clean up the data. There is no need for student_id (Mean or SEM of student ID is meaningless)
examdata=data.frame(exam2=x$exam_2,exam3=x$exam_3)
# Step 2: Compute the mean for all columns, and save them in a variable
exammeans=apply(examdata,2,mean)
# Step 3: Compute the SEM using a call to our self-made SEM function, and save them in a variable
examsem=apply(examdata,2,sem)
# Draw a barplot with the means of the exams. Saving the barplot in a variable will save the 
# position of the mid-points of each graph on the x-axis.
x_midpoint=barplot(exammeans,ylim=c(0,70))
# Draw arrows on the graph with a special styling that makes them look like error bars:
arrows(
  x_midpoint,exammeans-examsem, ## starting point of arrow
  x_midpoint,exammeans+examsem, ## end point of arrow
  length=0.05, ## styling the arrow
  angle=90, ## styling the arrow
  code=3  ## styling the arrow
)

# The other way to do this is using an R module called ggplot2, which we will learn later on.
