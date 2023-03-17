## Week 11

data2300 <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-spring/data/2300data.csv")

## Designing the graph

spring2019 <- data2300[data2300$Semester == 201910,"hrs.work.weekly"]
spring2023 <- data2300[data2300$Semester == 202310,"hrs.work.weekly"]

spring2019_mean <- mean(spring2019)
spring2023_mean <- mean(spring2023)

means <- c(spring2019_mean,spring2023_mean)

spring2019_sem <- sd(spring2019) / sqrt(length(spring2019))
spring2023_sem <- sd(spring2023) / sqrt(length(spring2023))

sems <- c(spring2019_sem,spring2023_sem)

## bar plot takes mean values, separated by a commai inside a c() function
midpoints <- barplot(
  c(spring2019_mean, spring2023_mean),
  names.arg = c("2019 Spring","2023 Spring"),
  main = "Bar plots of work hours in the PSYC2300 class",
  ylim = c(0,30)
  )

## Output the graph

midpoints

arrows(
  midpoints,means+sems,
  midpoints,means-sems,
  length = 0.05,
  angle = 90,
  code = 3
)


