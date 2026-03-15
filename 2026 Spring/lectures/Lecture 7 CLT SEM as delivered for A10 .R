# Lecture 7

library(moments)

## Load our data
data.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/studentmentalhealth.csv"
mental.health.data <- read.csv(data.url)


## Formulated a Research Question
## Does higher anxiety score lead to lower HRV values?


## Filter + Sanitize the data

## We need to select a group of low anxiety participants:
## threshold of 49 and below on the S_score.STAI.State.Anxiety.Score variable

low.anxiety <- na.omit(mental.health.data[mental.health.data$S_score.STAI.State.Anxiety.Score < 49,])

## High anxiety: threshold of 49 and over on the S_score.STAI.State.Anxiety.Score variable

high.anxiety <- na.omit(mental.health.data[mental.health.data$S_score.STAI.State.Anxiety.Score >= 49,])

## Concerning difference in samples sizes between the two groups (vulnerable to crticism)
82/18


## Normality

skewness(low.anxiety$CVRR) ## quite severe positive skew (4.48) (-1 -> +1 is the normal range)
skewness(high.anxiety$CVRR) ## not skewed at all

kurtosis(low.anxiety$CVRR) ## very leptokurtic (mesokurtic region is 2.0 (+/- 2.0))
kurtosis(high.anxiety$CVRR) ## mesokurtic, within range

hist(low.anxiety$CVRR,
     xlim = c(0,35),
     ylim = c(0,20),
     breaks = 30,
     col = rgb(0,0,1,1/2),
     main = "Histogram of HRV as a Function of Anxiety",
     xlab = "Heart Rate Variability Scores")

hist(high.anxiety$CVRR, 
     xlim = c(0,35),
     ylim = c(0,20),
     breaks = 10,
     col = rgb(1,0,0,1/2),
     add=TRUE)

boxplot(
  low.anxiety$CVRR,
  high.anxiety$CVRR,
  names = c("Low Anxiety","High Anxiety"),
  main = "Boxplot of Heart Rate Variability as a Function of Anxiety"
)

## SEM

low.anxiety.sem <- sd(low.anxiety$CVRR) / nrow(low.anxiety)
high.anxiety.sem <- sd(high.anxiety$CVRR) / nrow(high.anxiety)

## Loading the two SEM's into a vector for later use
SEMs <- c(low.anxiety.sem, high.anxiety.sem)

## Load the means into a vector in the same way
means <- c(mean(low.anxiety$CVRR), mean(high.anxiety$CVRR))

## Barplot

midpoints <- barplot(means,
        ylab = "Mean of HRV Scores",
        names = c("Low Anxiety","High Anxiety"),
        main = "Means of HRV Scores as a Function of Anxiety",
        ylim = c(0,7)
        )

## Draw the Error Bars representing the Standard Error of the Mean

arrows(midpoints,means - SEMs,
       midpoints,means + SEMs,
       angle = 90,
       code = 3,
       length = 0.05)









