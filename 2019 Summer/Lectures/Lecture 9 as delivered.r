rm(list = ls())

class.data <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Summer/data/2300dataExpanded.csv"))

# figure out how to organize the data into 2 groups -- subsetting
names(class.data)
head(class.data)
class(class.data$Semester)

spring <- class.data[class.data$Semester == 201910,]
summer <- class.data[class.data$Semester == 201920,]

# variance, standard deviation

spring.sc.mean <- mean(spring$hrs.screentime.weekly)
summer.sc.mean <- mean(summer$hrs.screentime.weekly)

spring.n <- nrow(spring)
summer.n <- nrow(summer)

spring.df <- spring.n - 1
summer.df <- summer.n - 1

spring.sc.dev <- spring$hrs.screentime.weekly - spring.sc.mean
summer.sc.dev <- summer$hrs.screentime.weekly - summer.sc.mean
## doublechecking
# values should be a vector and should sum to 0
sum(spring.sc.dev)

spring.sc.dev.sq <- spring.sc.dev^2
summer.sc.dev.sq <- summer.sc.dev^2
## doublechecking
# should be a vector with all positive values

spring.ss.sc <- sum(spring.sc.dev.sq)
summer.ss.sc <- sum(summer.sc.dev.sq)

# pooled variance -- manual variance calculation

pooled_variance <- (spring.ss.sc + summer.ss.sc) / (spring.df + summer.df)
pooled_s <- sqrt(pooled_variance) ## standard deviation

# standard error

sem <- sqrt(pooled_variance/spring.n + pooled_variance/summer.n)


# independent samples t-test

t <- (spring.sc.mean - summer.sc.mean) / sem

total_df <- spring.df + summer.df

## Virtual look-up table
## Returns a one-tailed critical t-value
## If you are using a two-tailed test, you need to half the value
t_critical <- qt(0.025, total_df)

## Because the critical t is smaller than the actual t-test result, we conclude that
## there is a statistically significant difference between screen-time of the spring
## class and screen-time of the summer class. Our results produced a t = -2.93, p < 0.05.
## We reject the null hypothesis

## We can compute the exact p-value
## 1-tailed value, multiply by 2 to get two-tailed result
exact_p <- 2*pt(t, total_df)
## Our results produced a t = -2.93, p = 0.004.


# visualize this with a barplot and error bars
# confidence interval or standard error (or both)

# Organize the means into a vector
means <- c(spring.sc.mean, summer.sc.mean)
midpoints <- barplot(means,
                     ylim = c(0,60),
                     names.arg = c("Spring", "Summer"),
                     main = "Means of Screen Time"
                     )
arrows(
  midpoints,means-sem,
  midpoints,means+sem,
  length = 0.05,
  angle = 90,
  code = 3
)


