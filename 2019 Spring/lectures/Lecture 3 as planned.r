# The goal of this exercise is to find the central tendency measures and visualize the data

# Let's generate some data

var1 <- c(0,1,2,3,4,5,6,7,8,9)
var2 <- c(9,8,7,6,5,4,3,2,1,0)
data <- data.frame(var1,var2)

# Mean, the old fashioned way
n <- length(data$var1)
mymean <- sum(data$var1) / n

# Mean, the new fashioned way

mean(data$var1)

# Finding the median

# Old fashioned way
sort(data$var1)

# New fashioned way
median(data$var1)

# Finding the mode

# Old fashioned way
rle(sort(data$var1))

# New fashioned way
modeOf(data$var1) # tells you which values are the mode
maxFreq(data$var1) # tells you the frequency of the mode

# Measures of variability

max(data$var1)
min(data$var1)

range(data$var1)


# quantiles and interquantile range
# 10th quantile or 10th percentile is the smallest number x 
# such that 10% of the data is less than x

quantile(data$var1, probs = .5)  # computes the median (50th quantile)
# same answer as the median()

# Let's say you want to find the 25th and 75th percentiles: 
quantile(data$var1, probs = c(.25, .75))

# If you substract the 25th quantile from the 75% quantile, you get what's called the interquantile range. 

# simpler 
IQR(data$var1)

# spread of the middle half of the data. Neat if you have crazy outlers. 

# Mean Absolute deviation

# 1. Let's get the mean
mymean # calculated earlier

# 2. Subtract the mean from each value
zeroed <- data$var1 - mymean

# 3. Take the absolute of this vector
myabs <- abs(zeroed)

# 4. Let's see the results
mean(myabs)

# New fashioned way

aad(data$var1)

# Variance
# Unlike absolute deviations, squared deviations have different mathematical properties. 
# Squared deviations allow us to find a measure called variance, which has a lot of cool statistical properties
# Variance = 1/N * sum(x - x_bar)^2

sqd <- ((data$var1 - mean(data$var1))^2)/n
msqd <- sum(sqd)  # sum of squared deviations
msqd

table(sqd,msqd)

# new fashioned way
var(data$var1)

# The real formula R is using (1/(N-1)) * (x- xbar)^2

real_sqd <- ((data$var1 - mean(data$var1))^2)/(n-1)
real_sqd
real_msqd <- sum(real_sqd)
real_msqd

# sample vs population??


# skew and kurtosis??
kurtosi() # platykurtic flat, mesokurtic, leptokurtic
skew() # measure of asymmetry negative ...+++, positive skew +++...

# standard deviation
# take its square root

sqrt(var(data$var1))

stdev <- sd(data$var1)

# standard score
# z <- x - xbar / sd

standard_score <- (data$var1 - mymean) / var(data$var1)
standard_score

# Correlation
# scatterplots
plot(data$var1, data$var2)


# Cov(x,y) = 1/(n-1) sum(x-xbar)(y-ybar)      Covariance between two variables

cova <- sum((data$var1 - mean(data$var1))*(data$var2 - mean(data$var2)))
cova <- cova/(n-1)


# r = Cov(x,y)/var(x)var(y)

my.r <- cova/(sd(data$var1)*sd(data$var2))
my.r

# new fashioned way
cor(data$var1,data$var2)

correlate(data)

