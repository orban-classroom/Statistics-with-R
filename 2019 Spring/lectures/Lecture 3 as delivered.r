var1 <- c(45,49,46,48,49,42,50,42,20,50,49,56,49,40,56,42,45,49,50,56,46,56,35,38,56,56,53,40,42,50)
var2 <- c(6,10,14,5,1,0,2,6,2,8,2,10,6,6,14,0,28,7,21,21,16,2,8,4,6,0,9,4,5,2)
var3 <- c(3, 0, 2.5, 2, 3, 15, 4, 4, 4,0, 2, 10, 3, 21, 4, 10.5, 5, 0, 10, 10, 3, 10, 10, 6, 7, 4, 3, 10, 3, 5)
var4 <- c(21, 15, 15, 22, 10, 32, 12, 6.5, 24, 40, 12, 16, 24, 4, 39, 20, 20, 40, 25, 15, 16, 24, 27, 35, 28, 17, 27, 25, 24, 25)
var5 <- c(20, 14, 30, 35, 25, 30, 12, 14, 98, 55, 25, 30, 14, 21, 20, 10.5, 20, 28, 30, 14, 20, 14, 12, 25, 30, 42, 38, 30, 35, 25)

# Let's find the length of the vector, aka sample size
length(var1)
length(var2)
length(var3)
length(var4)
length(var5)

# Let's add these vectors into a data frame
data <- data.frame(
  hrs.sleep.weekly = var1,
  cups.caffeine.weekly = var2,
  hrs.exercise.weekly = var3,
  hrs.work.weekly = var4,
  hrs.screentime.weekly = var5
  )

# Means, the very fast way
my.ultra.fast.mean <- colMeans(data)

# Means, the medium fast way
my.fast.mean <- mean(data$hrs.sleep.weekly)
mean(data$cups.caffeine.weekly)
mean(data$hrs.exercise.weekly)
mean(data$hrs.work.weekly)
mean(data$hrs.screentime.weekly)

# Slow way of calculating the mean
# sum of all values / sample size (number of values)
n <- length(data$hrs.sleep.weekly)
my.slow.mean <- sum(data$hrs.sleep.weekly)/n

my.slow.mean == my.fast.mean

# let's find the median, the old fashioned way
sort(data$hrs.sleep.weekly)
## look for the middle value

# let's find the median, the new fashioned way
median(data$hrs.sleep.weekly)

# Mode
# Old fashioned way
# rle(): run length encoding
my.mode <- rle(sort(data$hrs.sleep.weekly))

table(my.mode)

# Mode, the fast way
modeOf(data$hrs.sleep.weekly)
# we are not gonna do it
# but, you can do it if you want, on your computer
# I think you need the "lsr" package

hist(data$hrs.sleep.weekly,
     main = "Histogram of Weekly Sleep Time",
     breaks = 30)

# skewed distribution
skew(data$hrs.sleep.weekly)
# do not worry about this either, 
# unless you want to install the "LSR" addon
install.packages("lsr", "C://Users/lorban/My Documents")
library(lsr)
