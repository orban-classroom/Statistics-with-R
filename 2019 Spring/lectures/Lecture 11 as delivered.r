rm(list = ls())

d <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/2300classdata/data.csv"))

range(d$cups.caffeine.weekly)
hist(d$cups.caffeine.weekly)
median(d$cups.caffeine.weekly)

high_caff <- d[d$cups.caffeine.weekly >= 6,]
low_caff <- d[d$cups.caffeine.weekly < 6,]

high_caff$hrs.sleep.weekly
low_caff$hrs.sleep.weekly

### Independent Samples t-test

# compute the sample size for each group of data
n_hc <- length(high_caff$hrs.sleep.weekly)
n_lc <- length(low_caff$hrs.sleep.weekly)

# degrees of freedom for each group
df_hc <- n_hc - 1
df_lc <- n_lc - 1
df_total <- df_hc + df_lc

# Compute the mean
m_hc <- mean(high_caff$hrs.sleep.weekly)
m_lc <- mean(low_caff$hrs.sleep.weekly)

# Center the data
centered_hc <- high_caff$hrs.sleep.weekly - m_hc
centered_lc <- low_caff$hrs.sleep.weekly - m_lc

# squared deviation values (or squared centered data)
sqd_hc <- centered_hc^2
sqd_lc <- centered_lc^2

# sums of squares
ss_hc <- sum(sqd_hc)
ss_lc <- sum(sqd_lc)

## Pooled variance calculation (key step)
s_pooled <- (ss_hc + ss_lc)/(df_hc + df_lc)

## Pooled estimated standard error calculation (SEM)
s_sem <- sqrt((s_pooled/n_hc)+(s_pooled/n_lc))

## t-test
t <- (m_hc-m_lc)/s_sem
t

## p-value
## IF the t-value is negative, set the lower.tail to be TRUE
## IF the t-value is positive, set the lower.tail to be FALSE
## IF you don't specify a lower.tail argument, it will assume TRUE
2*pt(t, df_total, lower.tail = FALSE)

# The modern way:

t.test(high_caff$hrs.sleep.weekly,
       low_caff$hrs.sleep.weekly,
       alternative = "two.sided",
       paired = FALSE,
       var.equal = TRUE
       )

## Assumption check (usually done before doing a t-test)

## Boxplot
boxplot(
  high_caff$hrs.sleep.weekly,
  low_caff$hrs.sleep.weekly,
  names = c("High Caff","Low Caff")
)


## Homogeneity of variance
## F-max test, which check for homogeneity of variance

# Divide the larger variance with the smaller variance value

var_hc <- var(high_caff$hrs.sleep.weekly)
var_lc <- var(low_caff$hrs.sleep.weekly)

Fmax <- var_lc/var_hc
Fmax

# Compare F-max value to value in table: 
# http://archive.bio.ed.ac.uk/jdeacon/statistics/table8.htm

# If our Fmax value exceeds the critical value in the table, 
# we conclude that our data is heterogenous, or that it has
# heterogeneity of variance. This is a violation of t-test 
# assumptions

# Levene's test for homogeneity of variance

## Assumption 2: Normality
# If you can load packages, you can load the kurtosi and skew
# functions to check for normality
# Generate a histogram and eyeball it
par(mfrow = c(1,2))

hist(high_caff$hrs.sleep.weekly,
     main = "Histogram of High Caff",
     xlab = "High Caff",
     breaks = 10)
     
hist(low_caff$hrs.sleep.weekly,
     main = "Histogram of Low Caff",
     xlab = "Low Caff",
     breaks = 10)



## Confidence Intervals

means <- c(m_hc,m_lc)

sem_lc <- sd(low_caff$hrs.sleep.weekly) / sqrt(n_lc)
sem_hc <- sd(high_caff$hrs.sleep.weekly) / sqrt(n_hc)

ci_lc_upper <- m_lc + 1.96*sem_lc
ci_lc_lower <- m_lc - 1.96*sem_lc

ci_hc_upper <- m_hc + 1.96*sem_hc
ci_hc_lower <- m_hc - 1.96*sem_hc

## Package up the confidence intervals
## Same order as the means
upper_bounds <- c(ci_hc_upper,ci_lc_upper)
lower_bounds <- c(ci_hc_lower,ci_lc_lower)

midpoints <- barplot(
  means,
  ylim = c(0,60),
  names.arg = c("High Caff","Low Caff"),
  main = "Hours of Sleep",
  sub = "for High vs Low Caffeine Stats Students, with 95% C.I."
)

arrows(
  midpoints,lower_bounds,
  midpoints,upper_bounds,
  length = 0.05, angle = 90, code =3
)
