## EXAM 3
## RULES
## - Cannot communicate with anyone during the exam
## - Cannot look-up information in your textbook, or any website
## - Save intermediate calculations as variables. Use them in later calculations
## - Run all calculations manually

## A survey randomly selected a group of Hong Kong residents for a telephone questionnaire.
## The survey was conducted during the H1N1 influenza epidemic. Survey questions
## polled subjects about their anxiety, risk perception, knowledge on modes of transmission,
## and preventative behaviours. 
## For reference (you can check this after the exam -- NOT during the exam)
## Publication: https://academic.oup.com/jid/article/202/6/867/936219
## Original Data (do not use during exam): https://datadryad.org/resource/doi:10.5061/dryad.1485f

## I have selected and cleaned up a version of this questionnaire that has two columns of data: 
## Column 1: questions asked before the H1N1 pandemic, and questions asked during the pandemic
## Column 2: Answer to the following question: What do you think are your chances of getting swine flu 
## (H1N1 influenza A) over the next 1 month compared to others outside your family? 
## 1-Not at all; 2-Much less; 3- Less; 4-Evens; 5-More; 6-Much more; 7-Certain.
## Note that each row represents a different subject in this data set.

## BONUS: Incorporate 3 manually constructed functions in your calculations 
## and use them to arrive at your final answer, 5 points

## EXAM Data URL: 
x=read.csv("~/Desktop/fludata_chances.csv")
before=x[x$condition=="before",]
during=x[x$condition=="during",]

## 1. Check assumptions. Use your knowledge from lectures and the textbook,
## Also, state your conclusion about whether or not assumptions have been met (and why), 15 points

## 2. Run descriptive statistical analyses, 25 points

## 2. Conduct the appropriate t-test analysis, 25 points

## 3. Visualize the results, 15 points

## 4. Interpret the results using everyday language, 10 points

## Run the following commands to verify your work: 5 points
## mean(), sd(), var(), t.test()