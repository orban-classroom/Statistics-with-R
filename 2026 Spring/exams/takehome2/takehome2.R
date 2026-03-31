## TAKE-HOME EXAM 2
##

## Note: You will only receive a grade for this exam if you have successfully defended it 
##   during an oral defence session.
## 
## Rules: 
## Your own effort only. You may not consult classmates, tutors, or other human entities
##   in the preparation of this exam
##
## This is an "open book" exam, which means that you can use the Zoom lecture recordings, 
##   your own lecture notes, R lecture notes, or AI.
## 
## Helper AI: An AI was specifically configured for use during this exam. The helper
##   is made aware of the exam questions and the expectations, but instructed not to
##   give away answers.

## DATA SOURCE: 
## Step 1: Download and consult the publication, filename: "fpubh-14-1733027.pdf"
##   Paper: "Effectiveness of tailored multichannel interventions on weight loss among adolescents: a
##      randomized controlled trial"
## Read the introduction to find out the research questions, and methods of this study. 

## LOAD RELEVANT LIBRARIES HERE (fill in once you find out)
<< Replace this text with your code >>

## PROBLEM 1 of 2 (50% WEIGHT)
## INDEPENDENT SAMPLES T-TEST
## RQ: Read and Examine the PDF publication regarding this component. 
## State the Research Question specified in the publication
## << Enter your answer here >>
##
## Research Hypothesis: 
## << Enter your answer here >>
##
## Statistical Hypothesis
## << Enter your answer here >>

## LOAD THE DATA: baseline_assessment.csv
## Group "1" is intervention, Group "2" is control
<< Replace this text with your code >>

## FILTER + SANITATION
<< Replace this text with your code >>

## ASSSUMPTION CHECKS
##   Independent of Observations
##   << Replace this text with your answer >>

##   Normality
<< Replace this text with your code >>

##   Homogeneity of Variance
<< Replace this text with your code >>


## Interim Calculations
##   Sample size (n), degrees of freedom (degfree), means (m), estimated standard error of means (SEM)
<< Replace this text with your code >>

## Sums of squares (ss), pooled variance (ps), pooled estimated standard error (pSEM)


## t-test
<< Replace this text with your code >>


## p, alpha, t Logic (pick your preference, but must know about all methods)


## Statistical Conclusion


## Research Interpretation


## PROBLEM 2 of 2 (50% WEIGHT)
## REPEATED MEASURES T-TEST
## RQ: Read and Examine the PDF publication regarding the within-groups (or repeated) component. 
## Here, you will SIMPLIFY the RQ to look only at baseline vs 5 months for Control Group only
## State the Research Question based on your interpretation of the PDF, and instruction above
## << Enter your answer here >>
##
## Research Hypothesis: 
## << Enter your answer here >>
##
## Statistical Hypothesis
## << Enter your answer here >>

## LOAD THE DATA: repeatedsamples.csv
## This data set was specially prepared to contain only baseline and 5-month follow-up BMI
## Group "1" is intervention, Group "2" is control

## Filter for "Control" only
## Preserve the two columns of BMI for analysis
## FILTER + SANITATION
<< Replace this text with your code >>

## ASSSUMPTION CHECKS
##   Independent of Observations
##   << Replace this text with your answer >>

##   Normality
<< Replace this text with your code >>

##   Homogeneity of Variance
<< Replace this text with your code >>


## Interim Calculations
##   Sample size (n), degrees of freedom (degfree), Difference scores (D), mean oF D, standard error of D (dSEM)
<< Replace this text with your code >>


## t-test
<< Replace this text with your code >>


## p, alpha, t Logic (pick your preference, but must know about all methods)


## Statistical Conclusion


## Research Interpretation


