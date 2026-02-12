#################################################################################
## EXAM 1 
## PSYC 2300: Feb 11, 2026 L.L. ORBAN
#################################################################################
#################################################################################
## RULES
## You can use your notes, textbook and web during the exam.
## Communication with anyone, including classmates is not permitted. Collusion will lead to cheating penalties of 0 for the exam or the course.
## If you have a really major issue but it's something you are expected to know, you can ask me to help at a cost of 5%
## 
## Keep your work organized: use hashtag headings, space out your code
## Write concise code (no redundant, unnecessary code)
## All of your calculations must be done manually, the "slow way". 
##
## Double check your work using verification as discussed in lectures
## 
## All of your answers must be supported by calculations for full points. 
## Do not hard code final answers (i.e., do not type out values)
## Partial points can be achieved even with errors so do not panic if your code produces an error.
## Answer conceptual questions as a hashtag comment. For full marks include lecture discussions
## Writen take-home exam marks are subject to oral-defence performance.


#################################################################################
#################################################################################
## DATASET
## Data Description: The dataset contains the data of a large heterogeneous sample of participants who completed the 
## Hebrew version of the Disgust Scale Revised (DS_R), and provided various demographic variables. 
## Participants were chosen from the general population, using a convenience sampling method. They were approached 
## at various locations (e.g., shopping centres, transport hubs, and government buildings) during the period of 
## 2011- 2012.
## Source: disgust_scale_2014.csv

## POINT DEDUCTIONS FOR: 
## - Sloppy disorganized work
## - NOT reusing a variable once defined (e.g., sample size)

## LOAD ANY EXTERNAL LIBRARIES YOU MAY USE


## Load the data into a data frame


## You will work with the disgust sensitivtiy column, Mean_general_ds


## Remove NA values and save it as a new variable (5 points)




## NORMALITY
## Assess `Mean_general_ds` for normality. Draw on your of knowledge of normal curves, 
## skew, kurtosis, outliers, variability to make your conclusions. Use technical language (as per textbook) and visualizations.
## to support your arguments. Keep your work clean with headings and comment your code. No need for calculations here - just visual judgement.




## CENTRAL TENDENCIES
## Where is the middle of the data for `Mean_general_ds`?
## Justify your answer using concepts of normality, and measures of central tendencies. 
## All calculations using the manual method (but you can use built-in functions for verification)
## Keep your work clean with headings and comment your code.

## MEAN (Manuwal way)



## Concept Question (answer with hashtag) is there one value that represents the center?



## MEDIAN (Manual way)

## Is the sample size an odd or an even number?


## Which method of median calculation will you execute?



## MODE (Manual way)


## Concept question: can you imagine any circumstances in which a median is a 
## better metric of central tendencies than the mean?




## VARIABILITY
## Compute variance and standard deviation for `Mean_general_ds`.
## Keep your work clean with headings and comment your code. 
## Compute interim variables (deviation scores, sums of squares)





## FILTERING / SUBSETTING
## Create one filter (see Homework 4 for similar filtering) where 
## you can see all `Mean_general_ds` values but only `Gender` that is "0" 



## Create another filter where your can see all `Mean_general_ds` values 
## but only `Gender` that is "1"



## Compute the mean for `Mean_general_ds` for each community size. 

## Gender 1


## Gender 0


## Do these means look different? Comment with a hashtag below (Your judgement)



## Now compute the standard deviation for each community size

## Gender 1


## Gender 0


## Comment on the size of the standard deviation in relation to the size of the mean
## Add your remarks as hashtag comments.




## END OF EXAM