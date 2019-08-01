## EXAM 2, 112 points

## YOUR GOAL: Look at the real data problem, and conduct the appropriate tests to draw conclusions. 
## Specifically, you will look at anomalies in a fish's eye symmetry before and after the Deepwater Horizon oil 
## spill off the coast of Florida.

## DATA ABSTRACT: 
## Assessing the impacts of the Deepwater Horizon oil spill with a dependable baseline comparison 
## can provide reliable insight into environmental stressors on organisms that were potentially 
## affected by the spill. Fluctuating asymmetry (small, non-random deviations from perfect bilateral 
## symmetry) is an informative metric sensitive to contaminants that can be used to assess environmental 
## stress levels. For this study, the well-studied and common Gulf of Mexico estuarine fish, Menidia beryllina, 
## was used with pre and post-oil spill collections. Comparisons of fluctuating asymmetry in three traits 
## (eye diameter, pectoral fin length, and pelvic fin length) were made pre and post-oil spill across two sites 
## (Old Fort Bayou and the Pascagoula River), as well as between years of collection (2011, 2012)-one and two 
## years, respectfully, after the spill in 2010. We hypothesized that fluctuating asymmetry [deviations from symmetry] 
## would be higher in post-Deepwater Horizon samples, and that this will be replicated in both study areas along the 
## Mississippi Gulf coast. We also predicted that fluctuating asymmetry would decrease through time after the oil spill 
## as the oil decomposed and/or was removed. Analyses performed on 1135 fish (220 pre and 915 post Deepwater Horizon).

## RULES
## Closed Book, no Internet resources
## 3 hrs
## Allowed support: 
##   1. Provided cheat sheet
##   2. Help pages in R: ?function


# Link to data: 

## Clear your global environment variables (2 points)

## Load your data (2 points)

##
## First glimpse
## 

## Output the variable names (2 points)

## Output the first 10 records in the data (2 points)

##
## Basics
##

## Use the "time" variable to create two dataframes, one for "Pre" and one for "Post" spill. (4 points)

## Compute the sample size, and save the variable for each group (2 points)

## Compute the degrees of freedom and save the variable for each group (2 points)


##
## Assumptions
##

## Draw conclusions about normality using a histogram, means, medians and modes (9 points = 6 points for histograms, 3 points for central tendencies)

## Draw conclusions about homogeneity, compute the Fmax test (6 points)


##
## INTERMEDIATE COMPUTATIONS
## 

## Compute the pooled variance (12 points)


## Compute the Standard Error of the Mean (4 points)


##
## T-TESTING
##


##
## What kind of t-test will you conduct? Add your answer as a comment (5 points)
##


##
## Compute the t-value (12 points)
##

## What is the exact p-value for the computed t-value? (4 points)

## What conclusion can you draw based on your reading of the abstract (at the beginning of this notebeook)
## and in light of the t-value and p-value? (6 points)

## What is the critical t-value? (4 points)


##
## ANCILLARY TESTS
##

## Compute Cohen's d effect size (4 points)

## What conclusions can you draw based on this result? (4 points)

## Compute the lower and upper bounds for the Confidence Interval, at 95% (8 points)

##
## VISUALIZATION
##

## Draw a barplot displaying the means of the pre and post group eye symmetry, and draw error bars
## that represent either the SEM or the CI you computed earlier. (12 points)


##
## Interpret the meaning of these results in context of the study that was conducted (based on your reading of the abstract) (6 points)
##
