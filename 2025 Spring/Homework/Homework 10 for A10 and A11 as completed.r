# Homework 10

# Using the 2025 version of the PSYC 2300 Stats Class data.

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/202510_2300_classdata.csv"
psyc_data <- read.csv(data_link)

# Combine your knowledge of filters/subsetting with the equation shown in class 
# to compute probabilities for the problems below.
# You may use filters using the square bracket sequence [ xxx ], 
# functions such as length, and combining logical operations using &, ==, <, > 

# What is the probability that someone does no exercise at all in a week?

no_exercise <- psyc_data[psyc_data$hrs.exercise.weekly == 0,]
all_n <- nrow(psyc_data)

no_exercise_probability <- nrow(no_exercise) / all_n

# What is the probability that someone is sleep deprived (assuming 8 hours/day x 7 days a week as normal)?

sleep_deprived <- psyc_data[psyc_data$hrs.sleep.weekly < 56,]

sleep_deprived_probability <- nrow(sleep_deprived) / all_n

# What is the probability that someone consumes no caffeine at all in stats courses?

no_caff <- psyc_data[psyc_data$cups.caffeine.weekly == 0,]

no_caff_probability <- nrow(no_caff) / all_n

# ##############
# Define two groups of students: those who are currently enrolled in the course (Semester: 202510), and all those who took the course in the past (less than 202510)

current_cohort <- psyc_data[psyc_data$Semester == 202510,]
past_cohorts <- psyc_data[psyc_data$Semester < 202510,]

# If you find someone who drinks no caffeine at all, are they more likely to be present students or past students?

no_caff_current <- current_cohort[current_cohort$cups.caffeine.weekly == 0,]
no_caff_past <- past_cohorts[past_cohorts$cups.caffeine.weekly == 0,]

nrow(no_caff_current) / nrow(current_cohort)
# 15%

nrow(no_caff_past) / nrow(past_cohorts)
# 19%

# If I find someone from a stats class who is not drinking caffeine at all, they are slightly more likely to be a past student than a current one.

# If you find someone who is exposed to over 56 hours of screen time per week, are they more likely to be present students or past students?

high_screeen_current <- current_cohort[current_cohort$hrs.screentime.weekly > 56,]
high_screen_past <- current_cohort[current_cohort$hrs.screentime.weekly > 56,]

nrow(high_screeen_current) / nrow(current_cohort)
# 9%

nrow(high_screen_past) / nrow(past_cohorts)
# 1%

# If I find someone from a stats class who is exposed to a lot of screentime, it is 9x more likely to be a current student than a past one.


# If you find someone who is sleep deprived (as per earlier definition), are they more likely to be present students or past students?

sleep_deprived_current <- current_cohort[current_cohort$hrs.sleep.weekly < 56,]
sleep_deprived_past <- past_cohorts[past_cohorts$hrs.sleep.weekly < 56,]

nrow(sleep_deprived_current) / nrow(current_cohort)
# 79%

nrow(sleep_deprived_past) / nrow(past_cohorts)
# 75%

# If I find someone from a stats class who is sleep deprived, there is a slightly higher chance that they are from the current cohort.
