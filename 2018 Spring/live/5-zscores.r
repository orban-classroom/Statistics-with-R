## Today we'll continue to use the exam grade data
x=read.csv(url("http://llorban.net/psyc2300/1100_exam_grades.csv"))

## You might remember the column names already, but let's take a peak again to make sure we have the spelling right:
head(x)

## Optional: If you want to make your life a little easier, load the two columns of data into a short variable
## Instead of inserting x$exam_2 throughout the rest of this document, you can just use x2
x2=x$exam_2
x3=x$exam_3

### Calculating the z-scores, or otherwise known as standardizing the data
## Part 1. Calculate the mean for each of the exam score columns
## Note the samplesize variable. Because both exam 2 and exam 3 have the same number of scores
## we can create one variable to store the size of our sample

x2_sum = sum(x2)
samplesize = length(x$exam_2)
x2_mean = x2_sum/samplesize

x3_sum = sum(x$exam_3)
x3_mean = x3_sum/samplesize
  
## Part 2. Calculate the Standard Deviation for each of the Exam Scores
## Later in class, I decided to "gut" the sums of squares calculation and
## create a new variable, "centred2_data" and "centred3_data" 
## This variable is useful because we can use it in the calculation of the ss2 and ss3
## and also useful in generating a plot of the centred data

centred2_data = x$exam_2-x2_mean
ss2=sum(centred2_data^2)
variance2=ss2/(samplesize-1)
stdev2=sqrt(variance2)

centred3_data = x$exam_3-x3_mean
ss3=sum(centred3_data^2)
variance3=ss3/(samplesize-1)
stdev3=sqrt(variance3)

## a quick doublechecking of my work
## Remember, if any of our double checks turn out to be wrong, go backwards
## line by line to pin down the error. As a troubleshooting step, display the contents
## of all the variables you compute and make sure the numbers in there appear to be something you expect
## E.g., variance should be a single value, not a list of values. Variance is almost never 0, etc...
variance2
var(x$exam_2)

## Part 3. Ready to convert...
## According to the textbook, we compute the z-score by taking away the mean from each score and 
## dividing by the standard deviation.
## for a sample: z = (X-M)/s

zscore2=(x$exam_2-x2_mean)/stdev2
zscore3=(x$exam_3-x3_mean)/stdev3

## Visualize the raw scores, the centred 
## scores and the standardized scores in a
## scatterplot

par(mfrow=c(1,3))
# raw scores of exam 2 and exam 3
plot(x$exam_2,x$exam_3,main="Raw Scores",xlab="Exam 2", ylab="Exam 3", xlim=c(-40,80), ylim=c(-45,80), cex=.1)
# centred data of exam 2 and exam 3
plot(centred2_data,centred3_data,main="Raw Scores",xlab="Exam 2", ylab="Exam 3", xlim=c(-40,80), ylim=c(-45,80), cex=.1)
# zscores 2 and 3
plot(zscore2,zscore3,main="Raw Scores",xlab="Exam 2", ylab="Exam 3", xlim=c(-40,80), ylim=c(-45,80), cex=.1)
