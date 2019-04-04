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

# 
