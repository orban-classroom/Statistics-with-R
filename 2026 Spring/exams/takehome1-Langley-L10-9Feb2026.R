## TAKE-HOME EXAM 1
## PSYC 2300 - APPLIED STATISTICS 1
## INTENDED DURATION: 2 hours (not monitored)

## EXAM REGULATIONS: 
## 1. Do not discuss the exam with anyone.
## 2. You can ask me any questions, including feedback on homework performance to assist with answers on this exam. I will
##    check that your issues are not related to an error in the exam, and clarify ambiguities
## 7. IF YOU HIT A SNAG (e.g., can't even load the data), you can ask me a question and I will answer at a cost of -5%.
## 3. You may use resources such as the textbook, lecture slides, lecture R notes and homework to complete this exam. 
## 4. Do not talk to classmates, tutors or other humans about this exam.
## 5. You can use your textbook, lecture notes, LLM's, AI and online sources to complete this exam.
## 6. IMPORTANT: You grade on this exam is based on ORALLY DEFENDED answers. 
##    This means that if you don't understand your own code at all, it is possible to receive a 0 on a perfect written exam.
## This is an exam. Rule violations will be investigated by the dean's office for academic integrity violation. 


## POINT DEDUCTIONS FOR: 
## - Sloppy disorganized work
## - NOT reusing a variable once defined (e.g., sample size)

## About the Data Set: game_experiment_results_dryad.csv
## Article Link: https://royalsocietypublishing.org/doi/10.1098/rsos.190991
## The data set describes donation dollar amounts in a game where subjects were
## recruited from "small" or "big" communities.
## File name on GitHub (inside the "Exams" folder): 

## Variables you will use are: "CS", "FreeDonationAmount"
## LOAD THE DATA


## LOAD ANY EXTERNAL LIBRARIES YOU MAY USE


## NORMALITY
## Assess `FreeDonationAmount` for normality. Draw on your of knowledge of normal curves, 
## skew, kurtosis, outliers, variability to make your conclusions. Use technical language (as per textbook) and visualizations.
## to support your arguments. Keep your work clean with headings and comment your code. No need for calculations here - just visual judgement.




## CENTRAL TENDENCIESFreeDonationAmount
## Where is the middle of the data for `FreeDonationAmount`?
## Justify your answer using concepts of normality, and measures of central tendencies. 
## All calculations using the manual method (but you can use built-in functions for verification)
## Keep your work clean with headings and comment your code.



## Concept Question (answer with hashtag) is there one value that represents the center?



## MEDIAN

## Is the sample size an odd or an even number?


## Which method will you execute?


## MODE (Manual way)


## Concept question: can you imagine any circumstances in which a median is a 
## better metric of central tendencies than the mean?




## VARIABILITY
## Compute variance and standard deviation for `FreeDonationAmount`.
## Keep your work clean with headings and comment your code. 
## Compute interim variables (deviation scores, sums of squares)





## FILTERING / SUBSETTING
## Create one filter (see Homework 4 for similar filtering) where 
## you can see all `FreeDonationAmount` values but only `CS` (community size) that is "small" 



## Create another filter where your can see all `FreeDonationAmount` values 
## but only `CS` that is "big"



## Compute the mean for `FreeDonationAmount` for each community size. 

## small


## big


## Do these means look different? Comment with a hashtag below (Your judgement)



## Now compute the standard deviation for each community size

## small


## big


## Comment on the size of the standard deviation in relation to the size of the mean
## Add your remarks as hashtag comments.




## END OF EXAM