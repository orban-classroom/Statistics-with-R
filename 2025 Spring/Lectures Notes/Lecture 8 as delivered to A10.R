## Lecture 8

## Goals today
## Compute SEM
## Introduce you to a new visualization: barplot
## Learn about error bars and how to display the SEM as an error bar

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/202510_2300_classdata.csv"
stats_data <- read.csv(data_link)

## Estimate the differences between caffeine and sleep
## Prediction: Less sleep means more coffee drinking

n_coffee <- nrow(stats_data)
sd_coffee <- sd(stats_data$cups.caffeine.weekly)

sem <- sd_coffee / n_coffee
mean(stats_data$cups.caffeine.weekly)

## Split the file in such a way that you have a data frame that contains 
## caffeine data of those who are in the lower half of the sleep distribution
## and a data frame containing the upper half of the sleep distribution

## Filtering threshold

sleep_median <- median(stats_data$hrs.sleep.weekly)

## Implementation of filter

lower_sleep <- stats_data[stats_data$hrs.sleep.weekly < sleep_median, ]
upper_sleep <- stats_data[stats_data$hrs.sleep.weekly > sleep_median, ]

## Implement the SEM calculation for each group on caffeine intake

n_lower_sleep <- nrow(lower_sleep)
sd_lower_sleep <- sd(lower_sleep$cups.caffeine.weekly)
sem_lower_sleep <- sd_lower_sleep / n_lower_sleep
mean(lower_sleep$cups.caffeine.weekly)

n_upper_sleep <- nrow(upper_sleep)
sd_upper_sleep <- sd(upper_sleep$cups.caffeine.weekly)
sem_upper_sleep <- sd_upper_sleep / n_upper_sleep
mean(upper_sleep$cups.caffeine.weekly)

## How to generate bar plot
## 1. Combine your means into a vector
sleep.means <- c(mean(upper_sleep$cups.caffeine.weekly), mean(lower_sleep$cups.caffeine.weekly))

## 2. Generate the barplot
halfway_point <- barplot(sleep.means,
        names.arg = c("Oversleeping", "Insomniacs"),
        main = "Caffeine intake by sleep duration", 
        ylab = "Cups of Caffeine", 
        ylim = c(0, 9)
        )

sleep.sems <- c(sem_upper_sleep, sem_lower_sleep)

arrows(halfway_point, sleep.means - sleep.sems,
       halfway_point, sleep.means + sleep.sems,
       angle = 90, 
       length = .15, 
       code = 3)


