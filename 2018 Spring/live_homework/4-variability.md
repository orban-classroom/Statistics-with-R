Let's take a second look at the PSYC 1100 exam data from last summer. The data contains Midterm 2 and Midterm 3 written by two classes of students in Richmond and Surrey campuses. 

**Data**: http://llorban.net/psyc2300/1100_exam_grades.csv

## Problem 1. 
We want to characterize the variability of each set of exam scores. 
* Import the data and assign it to a new variable
* Calculate the range of each exam, using the manual calculations practiced in class
* Calculate the sums of squared deviations, the variance and standard deviation of each exam. Assign them each to a variable, using the manual calculations practiced in class
* Verify your calculations using the built-in functions range() and sd()
## Problem 2. 
Let's look at data visualization. Produce a properly labelled boxplot for each of the exam scores. Answer the following questions are comments in your R Studio file: (1) According to this boxplot, which exam had the higher mean score? (2) According to this boxplot, which exam shows more variability?

*Tip: The boxplot is generated slightly different here. The in-class example used a categorizing variable (gender) and a continuous variable (disgust scale). However, here we want to plot two continuous variables (exam2 and exam3), and there is no categorizing variable. To do this, use the boxplot() function, and insert the two variable and column names separated by a comma. Don't forget the $ notation of selecting the variable and column.*
## Problem 3. 
We are going to explore the curious question of how consistent are students' exam performance. Do students who do well on one exam also do well on the second exam, or is possible that doing well on the exam is just a fluke and good performers on one exam do poorly on the other. 
* Produce a scatterplot, properly labelled, as discussed last class
* As a comment, answer the question described above. Support your explanation with the concept of correlation, as you remember it from PSYC 1100 (feel free to review chapter 1 of your intro textbook)

*Tip: To achieve full marks, be sure to keep your code concise. Don't include calculations that are not necessary, and don't display variable contents. It is a good idea to use hashtag comments as headings to describe what you are doing at each step in your exercise.*
