data <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/1100examdata/1100_exam_data.csv"))

names(data)
levels(data$exam_1_122)
unique(data)
head(data)
range(data$exam_1_122)
range(data$exam_2_100)

## standardize the data

exam1.mean <- mean(data$exam_1_122)
exam2.mean <- mean(data$exam_2_100)
exam1.centered <- data$exam_1_122 - exam1.mean
exam2.centered <- data$exam_2_100 - exam2.mean
exam1.s <- sd(data$exam_1_122)
exam2.s <- sd(data$exam_2_100)

## z-scores
exam1.z <- exam1.centered / exam1.s
exam2.z <- exam2.centered / exam2.s

exam1.z
scale(data$exam_1_122)

hist(exam1.z, col = rgb(1,0,0,0.5), breaks = 10, ylim = c(0,30))
hist(exam2.z, col = rgb(0,0,1,0.5), breaks = 10, ylim = c(0,30), add=T)

## compute the z score, assuming that exam 1 is a population data 
## and exam 2 is a sample data
n <- length(data$exam_1_122)
sem2 <- exam2.s/sqrt(n)

ztest <- (exam2.mean - exam1.mean) / sem2
ztest

## effect size

# Cohen's d: mean difference between two groups of data divide by the standard dev


cohens.d <- (exam2.mean - exam1.mean) / exam2.s
cohens.d
