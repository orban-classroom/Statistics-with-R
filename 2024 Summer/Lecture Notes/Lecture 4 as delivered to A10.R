## Lecture 4
## Variability

## PSYC 2300 class survey data
url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/202420_2300_classdata.csv"
class.data <- read.csv(url)

## Research question: Is there a difference in number of work hours pre- and post-covid?

## Filters
## Pre-2020-March
colnames(class.data)
pre.covid <- class.data[class.data$Semester < 202010, "hrs.work.weekly"]
pre.covid <- class.data[class.data$Semester < 202010, 7]

post.covid <- class.data[class.data$Semester > 202010, "hrs.work.weekly"]


## Milestone 1: Sums of Squares
pre.covid.n <- length(pre.covid)
pre.covid.mean <- sum(pre.covid) / pre.covid.n
## Verify: 
mean(pre.covid)

centred.scores <- pre.covid - pre.covid.mean ## aka deviation scores
## Diagnostics (How do you know you're on the right track?)
## 1. you should see a vector of values, not a 0, not an NA, and not a single value
## 2. half of the values should be negative, and the other half, positive
## 3. If you sum up this vector, you should get a 0
sum(centred.scores)
## -9.237056e-14 is scientific notation for: 0.000000000000009237056
## eliminate this: 
round(sum(centred.scores))

squared.centred.scores <- centred.scores^2
## Diagnostics: 
## Still a vector of values
## All values should be positive, and bigger than the original centred scores

## SS in one shot
ss.one.shot <- sum((pre.covid - pre.covid.mean)^2)

## Milestone 1: Sums of Squares
pre.covid.ss <- sum(squared.centred.scores)
## Diagnostics
## A single positive large number

## Milestone 2: Find variance
deg.free.pre.covid <- pre.covid.n - 1
pre.covid.variance <- pre.covid.ss / deg.free.pre.covid
## Verify
var(pre.covid)

## Milestone 3: Standard Deviation
pre.covid.sd <- sqrt(pre.covid.variance)
## Verify
sd(pre.covid)

## The answer is: M = 21.18 hours, s = 11.01

## post-covid calculations
post.covid.n <- length(post.covid)
post.covid.mean <- sum(post.covid) / post.covid.n

centred.scores.post.covid <- post.covid - post.covid.mean
squared.centred.scores.post.covid <- centred.scores.post.covid^2
post.covid.ss <- sum(squared.centred.scores.post.covid)

post.covid.df <- post.covid.n - 1
post.covid.variance <- post.covid.ss / post.covid.df
var(post.covid)

post.covid.sd <- sqrt(post.covid.variance)

## The answer is: M = 20.16 hours, s = 14.61

min()
max()
range() ## max - min

## Find the median for the pre-covid data

pre.covid.sorted <- sort(pre.covid)

## Pick out the centre value
## Do we have an even or an odd sample?
length(pre.covid)
## odd number of samples: simply pick out the middle value
pre.covid.sorted[pre.covid.n/2 + 1]

## Method shown in Lecture 3
half.way <- ceiling(pre.covid.n/2) ## ceiling means round-up
## Pick out the median: 
pre.covid.sorted[half.way]

median(pre.covid)

post.covid.sorted <- sort(post.covid)
length(post.covid)
## even number of sample: pick out the two center values and take their average

mid1 <- post.covid.sorted[post.covid.n/2]
mid2 <- post.covid.sorted[post.covid.n/2 + 1]
## put the two middle values into a vector, and compute their mean
mean(
  c(mid1,mid2)
  )





