# Homework 6

# Last lecture we loaded a real-world data set from the Surrey city website. In this homework, you will continue to work with these data sets. 

# 1. Load the inspection reports data set (http://data.surrey.ca/dataset/948e994d-74f5-41a2-b3cb-33fa6a98aa96/resource/30b38b66-649f-4507-a632-d5f6f5fe87f1/download/fraserhealthrestaurantinspectionreports.csv)

df <- read.csv("http://data.surrey.ca/dataset/948e994d-74f5-41a2-b3cb-33fa6a98aa96/resource/30b38b66-649f-4507-a632-d5f6f5fe87f1/download/fraserhealthrestaurantinspectionreports.csv")

# 2.  Create two filtered vectors (an object with a single column of values, no need for dollar signs) or 
#     dataframes (an object with multiple variables, requires use of dollar sign), one that contains only 
#     "Routine" inspections, and another that contains only "Follow-Up" inspections. 

# df[ <row filter> , <column filter> ]

routine <- df[df$INSPTYPE == "Routine", ]
followup <- df[df$INSPTYPE == "Follow-Up", ]

# 3. How many routine, and how many follow-up inspections does the data set contain?

# 4. Which are the top 5 restaurants (identified by tracking number) that receive the most routine visits?
#    Use head(), see the help for more information

# 5. Which are the top 5 restaurants (identified by tracking number) that receive the most follow-up visits?
#    Use tail(), see the help for more information

# 6. What is the SEM (Standard Error of the Mean) for Routine and Follow-Up inspections?

routine.s <- sd(routine$NUMNONCRITICAL)
routine.n <- nrow(routine)
routine.sem <- routine.s/sqrt(routine.n)

followup.s <- sd(followup$NUMNONCRITICAL)
followup.n <- nrow(followup)
followup.sem <- followup.s/sqrt(followup.n)


# 7. What is the Confidence Interval (CI) at 95% for Routine and Follow-up inspections?

# 8. What is the Confidence Interval (CI) at 99% for Routine and Follow-up inspections?

# 9. What is the Confidence Interval (CI) at 99.99% for Routine and Follow-up inspections?