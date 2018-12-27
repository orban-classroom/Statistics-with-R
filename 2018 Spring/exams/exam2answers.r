## EXAM 2 (221 points)
## PSYC 2300 S11 2018-10 LLO
## Deadline: March 9th 23:59

#################################################################################
#################################################################################
## PREAMBLE
## You can use your notes, textbook and web during the exam.
## COMMUNICATIONS EMBARGO: Communication either with a classmate, over the phone or over the web is absolutely forbidden. 
## Keep your work concise and clean: add your answer below the headings
## Do not display variable contents or use redundant lines of code
## All of your partial calculations must be done manually. Show your work.
## Do not do unnecessary calculations or create variables not required to answer a question. 
##   Save intermediate variable required for a final computations. 
##   E.g., if the question asks for a mean, save the sum and length variables, but not save a frequency table
## NEW: Show that you have double checked your work
## All of your answers must be supported by calculations for full points. 
## Partial points can be achieved even with errors so do not panic.
## Answer conceptual questions with a hashtag comment. For full marks consider lecture discussions

#################################################################################
#################################################################################
## PART 1 - 55 points
# 1.  What proportion of a normal distribution is located in the tail beyond a z-score of z = –1.96? (5 pts)
{replace this text with your answer}
1-pnorm(-1.96)

# 2.  A vertical line is drawn through a normal distribution at z = +2.00. What proportion of the 
#     distribution is located between the line and the mean? (5 pts)
{replace this text with your answer}
pnorm(2)-pnorm(0)

# 3.  A vertical line is drawn through a normal distribution at z = -3.00. What proportion of the 
#     distribution is located between the line and the mean? (5 pts)
{replace this text with your answer}
(1-pnorm(-3))-pnorm(0)

# 4.  For a normal distribution with a mean of μ = 100 and σ = 10, what is the probability percentage 
#     of selecting an individual with a score less than 190? (5 pts)
{replace this text with your answer}
pnorm(190,mean=100,sd=10)*100

# 5.  For a normal distribution with a mean of μ = 20 and σ = 10, what is the probability proportion 
#     of selecting an individual with a score greater than 46? (5 pts)
{replace this text with your answer}
1-pnorm(46,mean=20,sd=10)

# 6.  An individual is selected from a normal population with μ = 1000 and σ = 200 and a treatment is 
#     administered to the individual. After treatment, the individual has a score of X = 743. 
#     What is the probability proportion that an individual with a score this high or higher (5 pts)
{replace this text with your answer}
1-pnorm(743,mean=1000,sd=200)

## 7.  Conceptual: Explain the meaning of statistically independent random sampling with replacement. (15 pts)
## {replace this text with your answer}
# Statistically independent: each measurement has an equal chance of occurring
# random sampling: each subject has an equal chance of being selected into the study
# with replacement: the subject is returned into the pool for a chance to be selected again

## 8.  Conceptual: Define and explain the differences between random sampling and random assignment. (10 pts)
## {replace this text with your answer}
# random sampling refers to the manner in which subjects are selected into the study
# random assignment refers to the way in which subjects are assigned into conditions of a study.

#################################################################################
#################################################################################
## PART II -- 166 points
## Part 1: http://llorban.net/psyc2300/exam2/2015caprarocococcioni_time_pressure.csv
## Part 2: http://llorban.net/psyc2300/exam2/2015caprarocococcioni_time_delay.csv
## Data description: http://llorban.net/psyc2300/exam2/2015caprarocococcioni.pdf
## Original data source: https://datadryad.org/resource/doi:10.5061/dryad.jk2jm/2
## You are encouraged to read the publication (3rd link) and data description (4th link)
## prior to answering the questions. 

# Import both data sets, assign each to a separate variable (2 pts)
x = read.csv(url("http://llorban.net/psyc2300/exam2/2015caprarocococcioni_time_pressure.csv"))
y = read.csv(url("http://llorban.net/psyc2300/exam2/2015caprarocococcioni_time_delay.csv"))

# We discussed a quick short-hand function to display the names of the variables. 
# Implement the function here for both variables (2 pts)
names(x);names(y)

# Manually calculate the Standard Error of the Mean for the "age" variable on the time_pressure.csv file
# Save the following intermediary variables in your manual calculation: 
# sample size, mean, centred data, sums of squares, variance (20 pts)
n = length(x$age)
agem = sum(x$age) / n
agecc = x$age - agem
agess = sum(agecc^2)
agev = agess/(n-1)
ages = sqrt(agev)
agesem = ages/sqrt(n)

# Generate a histogram of this variable. Describe its shape (10 pts)
hist(x$age, main="histogram of age", xlab="ages", ylab="frequency")
# highly positively skewed, single mode, 

# Show double-checking of your work with built-in functions, wherever available (3 pts)
mean(x$age)
var(x$age)
sd(x$age)

# Find the mean and standard deviation of all variables for each of the data sets at once
# using the apply function; load resulting values into variables (10 pts)
meansx = apply(x, 2, mean)
meansy = apply(y, 2, mean)
sdx = apply(x, 2, sd)
sdy = apply(y, 2, sd)

# Using techniques from Lecture 6, extract the mean and standard deviation of the age variable
# from the previously created variables. (4 pts)
meansx[4]
sdx[4]

# Load the time.pressure and time.delay variables into a simple vector variable using the technique above (5 pts)
means = c(meansx[2],meansy[2])

# Load the 

# Based on the manual calculations you have done earlier, create a general function
# to compute the standard error of the mean. (15 pts)
sem = function(local_variable) {
  sd(local_variable)/sqrt(length(local_variable))
}

# Compute the SEM for all variables in both data sets. Save each resulting vector in a variable (10 pts)
x_sem = apply(x,2,sem)
y_sem = apply(y,2,sem)

# Load the time.pressure and time.delay into a simple vector variable using the variable extraction technique (5 pts)
sems = c(x_sem[2], y_sem[2])

# Create a general function that computes the sums of squares. (15 pts)
cc = function(x){
  n = length(x)
  m = sum(x) / n
  sum((x-m)^2)
}

# Compute the sums of squares for all variables in both data sets. Save each resulting vector in a variable (15 pts)
x_cc = apply(x, 2, cc)
y_cc = apply(y, 2, cc)

# Create a barplot of the "time.pressure" and "time.delay" variable means and add an error bar (25 pts)
# Don't forget to appropriately label and scale the graph
mid = barplot(means,ylim=c(0,50),main="Time Pressure vs Time Delay", ylab="Time (seconds)")
arrows(
  mid,means-sems,
  mid,means+sems,
  length=0.05,
  angle=90,
  code=3
)

## Given the graph with SEM that you generated above, what are the lower and upper bounds within which
## 95% of the data falls, for each of the variables above? (10 pts)
means-sems
means+sems

## Assuming the mean and standard deviation of the time.pressure variable are population parameters, what is
## the probability proportion thaht we obtain a value of the time.delay mean, or greater? (15 pts)
1-pnorm(means[2],sd=sdx[2],means[1])
