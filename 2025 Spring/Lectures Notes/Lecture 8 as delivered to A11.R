######

data_link <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2025%20Spring/Data/202510_2300_classdata.csv"
stats_data <- read.csv(data_link)


## 1. Calculating the SEM (Standard Error of the Mean)
## 2. Display the mean on a bar plot
## 3. Draw the SEM as an error bar on the bar plot

## Pseudocode "conceptually"
## sem = sd / sqrt(n)

n.screen <- nrow(stats_data) ## When using nrow(), do not specify a column. Refer to the data frame only

sem.screen <- sd(stats_data$hrs.screentime.weekly) / sqrt(n.screen)
mean(stats_data$hrs.screentime.weekly)

## This could be reported in a journal as "a mean of 32.93 (SEM = 1.38) ... "
## SEM: Standard Error of the Mean
## Not to be confused with SD - Standard Deviation

32.93+1.38 = 34.31
32.93-1.38 = 31.55

31.55 - 34.31 ## this is where the real population mean might be

## Repeat this calculation on a split data of 201910 and 202510

## Filtering for 201910 "2019 Spring"


stats_data_2019 <- stats_data[stats_data$Semester == 201910, 8]
stats_data_2025 <- stats_data[stats_data$Semester == 202510, 8]

n.screen.2019 <- length(stats_data_2019)
n.screen.2025 <- length(stats_data_2025)

sem.screen.2019 <- sd(stats_data_2019) / sqrt(n.screen.2019)
sem.screen.2025 <- sd(stats_data_2025) / sqrt(n.screen.2025)

## Let's pack the SEM's into a vector so that we can use it for drawing the arrows
sems.screen <- c(sem.screen.2019, sem.screen.2025)

mean(stats_data_2019)
mean(stats_data_2025)

## Visualize the means
## Barplot is a great visualization to display two or more means side by side

## Create a list of values containing the means
screen.means <- c(
                    mean(stats_data_2019),
                    mean(stats_data_2025)
                    )

halfway_point <- barplot(screen.means, 
        names.arg = c("2019", "2025"), 
        ylim = c(0, 40), 
        ylab = "Weekly Hours", 
        main = "Screentime hours spent per week"
        )

## Error bar: is a visualziation of the uncertainty related to any measurement
## Our recipe needs a few dynamically derviced points on the graph: 
## 1) half way point of each bar graph (contained within the barplot function)
## 2) where to start drawing the arrow (mean - SEM)
## 3) where to end drawing the arrow (mean + SEM)


arrows(halfway_point, screen.means-sems.screen,
       halfway_point, screen.means+sems.screen,
       angle = 90,
       length = .25,
       code = 3
       )





