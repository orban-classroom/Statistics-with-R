
df <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Summer/data/2300dataExpanded.csv"))

# Research Question: Is there a significant difference 
# in quantity of exercise hours between the spring and summer semester?

# Way 1
spring_exercise <- df[df$Semester == 201910,"hrs.exercise.weekly"]
spring_exercise

# Way 2
summer_exercise <- df[df$Semester == 201920,]
summer_exercise$hrs.exercise.weekly

## Assumption checking
## Conclude whether or not it's possible to do a t-test

## Assumption 1: Normality
## Histogram - describe its shape
## Mean, Median and Mode -- draw conclusions

hist(spring_exercise, breaks = 20)

hist(summer_exercise$hrs.exercise.weekly, breaks = 30)

mean(spring_exercise)
median(spring_exercise)
table(rle(sort(spring_exercise)))

mean(summer_exercise$hrs.exercise.weekly)
median(summer_exercise$hrs.exercise.weekly)
table(rle(sort(summer_exercise$hrs.exercise.weekly)))

## The data is not normally distribution. There is a violation
## of this assumption. A t-test cannot be done.

## Assumption 2: Homogeneity
## F max test
## F_max = higher_standard_deviation / lower_standard_deviation
## If the value exceeds 3.0, then you have a problem

Fmax <- sd(summer_exercise$hrs.exercise.weekly)/sd(spring_exercise)
Fmax

## There is no violation of homogeneity of variance in this dataset.

## Assumption 3: Independent sampling
## Add some comments about how the data was collected

## I have sampled this data independently.
## The data has been sampled independently.


### WE STOP ON THIS DATASET because of the assumption violation.

## Research question: is there a significant difference
## in the amount of sleep between spring and summer semester
## statistics students?

# Assumption 1: Normality
spring_data <- df[df$Semester == 201910,]
summer_data <- df[df$Semester == 201920,]

hist(spring_data$hrs.sleep.weekly, 
     breaks = 10,
     main = "Histogram of Spring Sleep Data", 
     xlab = "Hours of Sleep")

hist(summer_data$hrs.sleep.weekly,
     breaks = 10,
     main = "Histogram of Summer Sleep Data",
     xlab = "Hours of Sleep")

mean_spring <- mean(spring_data$hrs.sleep.weekly)
median(spring_data$hrs.sleep.weekly)
table(rle(sort(spring_data$hrs.sleep.weekly)))

mean_summer <- mean(summer_data$hrs.sleep.weekly)
median(summer_data$hrs.sleep.weekly)
table(rle(sort(summer_data$hrs.sleep.weekly)))

## The normality of the data meets the minimum requirements for
## t-tests.

## Assumption 2, Homogeneity

Fmax <- sd(spring_data$hrs.sleep.weekly)/sd(summer_data$hrs.sleep.weekly)

## Assumption 3, Sampling independence
## same as before

#############################################################

# Conduct t-test
# Conclude whether or not the differences are significant

# Way 1, applicable to data frames
# Specify the dataframe name only with nrow()
n_spring <- nrow(spring_data)
  ## If you have vectorized your data, nrow will not work
  ## Must use length()

# Way 2, applicable to both data frames and vectors
n_summer <- length(summer_data$hrs.sleep.weekly)

df_spring <- n_spring - 1
df_summer <- n_summer - 1
df_total <- df_spring + df_summer

# pooled variance because we have unequal sample sizes
centered_spring <- spring_data$hrs.sleep.weekly - mean_spring
centered_summer <- summer_data$hrs.sleep.weekly - mean_summer

## verify/double-check centering
## should be a vector of values
## values shold be positive and negative
## sum up to 0
sum(centered_spring)
sum(centered_summer)

squared_vector_spring <- centered_spring^2
squared_vector_summer <- centered_summer^2
## verify/doublecheck
## should be a vector of values
## all values should be positive

ss_spring <- sum(squared_vector_spring)
ss_summer <- sum(squared_vector_summer)
## verify/doublecheck
## should be a single value
## should be a positve value

var_pooled <- (ss_spring + ss_summer) / (df_spring + df_summer)
s_pooled <- sqrt(var_pooled)

# Execute the t-test
sem <- sqrt(var_pooled/n_spring + var_pooled/n_summer)

t <- (mean_spring - mean_summer)/sem

exact_p <- 2*pt(t, df_total)

# Compute the exact probability value


# Conclude significance.

## Conclusion: Fail to reject the null hypothesis. 
## There is no difference in the amount of sleep between
## spring and summer stats students.

# Visualize the results with a bar plot and error bars

## create a vector of group means

group_means <- c(mean_spring, mean_summer)

## save the graph midpoints as a vector

midpoints <- barplot(group_means,
                     main = "Means of Sleep",
                     ylim = c(0,50),
                     names.arg = c("Spring","Summer"))

## calculate something for the error bars
## the something can be either:
##    standard error
##    confidence interval
group_means
sem
arrows(
  midpoints,group_means-sem,
  midpoints,group_means+sem,
  length = 0.05,
  angle = 90,
  code = 3
)

## Confidence Interval
# CI = M + tcrit(sem) and M - tcrit(sem)

## MANUAL WAY
# Find the t critical
df_total
# alpha level: 0.05
tcrit <- 2.00 # (based on t-tale from http://www.sjsu.edu/faculty/gerstman/StatPrimer/t-table.pdf)
# 
mean_spring
mean_summer

## Spring Confidence Intervals. CI95
spring_ci95_upper <- mean_spring + tcrit*sem
spring_ci95_lower <- mean_spring - tcrit*sem

## Summer Confidence Interval. CI95
summer_ci95_upper <- mean_summer + tcrit*sem
summer_ci95_lower <- mean_summer - tcrit*sem
sem

group_means

lower_bounds <- c(spring_ci95_lower, summer_ci95_lower)
upper_bounds <- c(spring_ci95_upper, summer_ci95_upper)

## Reset plot view to a single panel
par(mfrow = c(1,1))

midpoints <- barplot(group_means,
                     main = "Means of Sleep",
                     ylim = c(0,55),
                     names.arg = c("Spring","Summer"))

arrows(
  midpoints,lower_bounds,
  midpoints,upper_bounds,
  length = 0.05,
  angle = 90,
  code = 3
)


## Automated way of getting the critical t
t_critical <- qt(0.025, df_total)

## repeated measures t-test to do:

## mean difference 
diff_values <- df$hrs.work.weekly - df$hrs.screentime.weekly
mean_diffs <- mean(diff_values)
n_diffs <- length(diff_values)
df_diffs <- n_diffs - 1

# variance, sums of squares of the difference values
centered_values <- diff_values - mean_diffs
squared_values <- centered_values^2
ss_diffs <- sum(squared_values)
var_diffs <- ss_diffs/df_diffs
sem_diffs <- var_diffs/n_diffs


t_rep <- mean_diffs / sem_diffs
2*pt(t_rep, df_diffs)
# Fail to reject the null hypothesis. 

