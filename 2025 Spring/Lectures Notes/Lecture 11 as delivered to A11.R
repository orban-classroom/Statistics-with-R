library(psych)
## Lecture 11

## PSYC 2300 Survey Data
data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/202510_2300_classdata.csv"
psyc2300_data <- read.csv(data_link)

## Does taking the stats course online cause significant differences in screentime?
## In order to answer this question as posed: 
## - each student would have to be randomly assigned into a f2f or online course (not the case here)
## - ideally the courses are taken concurrently so that large macro changes (pandemic) is not affecting values

## Assumption Checks
## 1) Normality: is the data normally distributed?
## What's in your toolbox: 
## skew(), kurtosis() (you can use the library you want: lsr, psych and at least a dozen others)
## hist(), boxplot(), qqplot()
## use any combination of these tools to establish your argument

screentime_vector_f2f <- psyc2300_data[psyc2300_data$Semester == 201910, "hrs.screentime.weekly"]
screentime_vector_online <- psyc2300_data[psyc2300_data$Semester > 201910, "hrs.screentime.weekly"]

hist(screentime_vector_f2f)
skew(screentime_vector_f2f)
## very obvious positive skew. Beyond guidelines of normality
kurtosi(screentime_vector_f2f)
## very leptokurtic, beyond guidelines +/- 2 

hist(screentime_vector_online)
skew(screentime_vector_online)
## Not bad skew, 1.45 probably still within boundaries of what is considered normal
kurtosi(screentime_vector_online)
## Quite good, 3.41 nearly mesokurtic

## 2) Homogeneity 
## Conduct a Hartley's F-Max Test
## If the value is 3.0+ then we have a problem of homogenetiy of variances

var(screentime_vector_f2f)
var(screentime_vector_online)
## Manually observe the variance values, and place the bigger number in the numerator
f_max <- var(screentime_vector_online) / var(screentime_vector_f2f)
## very reasonable, no issues with heterogeneity

## Feeling fancy?
## Place your two variances in a vector: 
variance_vector <- c(var(screentime_vector_f2f), var(screentime_vector_online))
f_max_fancy <- max(variance_vector) / min(variance_vector)

## If you have issues, you might learn about transforming the data to improve the distribution
## Things normalizing the data might help

## 3) Independence of samples
      ## it is what it is.


## Conducting the t-test
## Decision: What kind of t-test is this?
## Indendent samples t-test
## t = M_D / SEM(pooled)

mean_f2f <- mean(screentime_vector_f2f)
mean_online <- mean(screentime_vector_online)

n_f2f <- length(screentime_vector_f2f)
n_online <- length(screentime_vector_online)

## Sidenote: huge differences in sample size. The strict rule of 1:2 is not met so some scientists will complaint about the big difference in sample sizes across the two groups
## Chill scientists are fine with a difference of up to 1:10, and that requirement is met here. 
n_online / n_f2f
## there is a 5x difference in sample sizes
## One of the concerns is that it'll affect homogeneity, but we tested that and it's not issue here. 

df_f2f <- n_f2f - 1
df_online <- n_online - 1
df_total <- df_f2f + df_online

## Calculating the pooled variance

centred_f2f <- screentime_vector_f2f - mean_f2f
ss_f2f <- sum(centred_f2f^2)

centred_online <- screentime_vector_online - mean_online
ss_online <- sum(centred_online^2)

pooled_variance <- (ss_f2f + ss_online) / (df_f2f + df_online)
pooled_sem <- sqrt((pooled_variance/n_f2f) + (pooled_variance/n_online))

t_value <- (mean_f2f - mean_online) / pooled_sem

## Calculate the exact p-value

## Gives us the exact p-value
2 * pt(t_value, df_total, lower.tail = TRUE)
## If the t-value is positive, you must set the lower.tail to be FALSE
## If the t-value is negative, then you must set the lower.tail to be TRUE

## Gives us the critical t-value (for reference only)
?qt
## No need to calculate the critical t-value

## Built-in t-test: 

t.test(screentime_vector_f2f, screentime_vector_online,
       alternative = "two.sided", ## is it a one-tailed or a two-tailed t-test?
       paired = FALSE, ## is it s related samples or an independent samples t-test?
       var.equal = TRUE, ## can you assume homogeneity (as per F-Max or Levene's)?
       conf.level = 0.95) ## what is your alpha level? (1 - 0.05) = 0.95

## Imagine if this data was a repeated measures data: 
t.test(screentime_vector_f2f, screentime_vector_online,
       alternative = "two.sided", ## is it a one-tailed or a two-tailed t-test?
       paired = TRUE, ## is it s related samples or an independent samples t-test?
       var.equal = TRUE, ## can you assume homogeneity (as per F-Max or Levene's)?
       conf.level = 0.95) ## what is your alpha level? (1 - 0.05) = 0.95
## Won't work for this data set, because it's not pairs of observations

## Research conclusion
## Based on these results (t = 1.779, p > 0.05), we fail to reject the null hypothesis. 
## We do not find evidence that screentime is substantially different between f2f and online courses

## Visualize the results

mean_vector <- c(mean_f2f, mean_online)
sem <- c(pooled_sem, pooled_sem)

midpoints <- barplot(mean_vector, 
        names.arg = c("F2F", "Online"), 
        ylim = c(0,40), 
        ylab = "Hours of Screentime", 
        main = "Comparison if Screentime across Teaching Modes")

arrows(midpoints, mean_vector - sem,
       midpoints, mean_vector + sem,
       length = 0.05,
       code = 3,
       angle = 90)


## Let's look at a related-samples t-test problem

stress_data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/stressdata.csv"
stress_data <- read.csv(stress_data_link)

## Is there a significant difference in cortisol levels for stress group 1 between time window 0 and time window 5

## Filters

time0 <- stress_data[stress_data$stress == 1 & stress_data$Data_collection_window == 0,"cortisol"]
time5 <- stress_data[stress_data$stress == 1 & stress_data$Data_collection_window == 5,"cortisol"]

## Assumption Check

## Normality: 
hist(time0)
skew(time0)
## Severe skew of 4.0
kurtosi(time0)
## ouch - very leptokurtic
## Under live conditions, this data probably needs to be transformed.. or something

hist(time5)
skew(time5)
## 1.88, positive skew but acceptable
kurtosi(time5)
## 4.09 (relative to 3.0) is okay, slightly leptokurtic

## Homogeneity of variance is not a problem in related-samples configuration

## Related samples t-test, you need this formula: 
## t = D / SEM

mean_time0 <- mean(time0)
mean_time5 <- mean(time5)

n_pairs <- length(time0) ## Pick any one group of data to determin n pairs

df <- n_pairs - 1

diff_score <- time0 - time5
ss_diff_score <- sum(diff_score^2)
diff_variance <- ss_diff_score / df
diff_sem <- sqrt(diff_variance / n_pairs)

t_val_repeated <- (mean_time0 - mean_time5) / diff_sem

2 * pt(t_val_repeated, df, lower.tail = FALSE)
## If the t-value is positive, you must set the lower.tail to be FALSE
## If the t-value is negative, then you must set the lower.tail to be TRUE

t.test(time0, time5,
       alternative = "two.sided", ## is it a one-tailed or a two-tailed t-test?
       paired = TRUE, ## is it s related samples or an independent samples t-test?
       var.equal = TRUE, ## can you assume homogeneity (as per F-Max or Levene's)?
       conf.level = 0.95) ## what is your alpha level? (1 - 0.05) = 0.95
)

## Conclusion
## Given our results, (t = 0.27, p > 0.05), we fail to reject the null hypothesis. 
## There is no evidence that the time window has an effect on cortisol levels

