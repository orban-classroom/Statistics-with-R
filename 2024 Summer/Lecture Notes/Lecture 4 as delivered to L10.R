## Lecture 4
## Variability

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/studentmentalhealth/Sheet%201-Table%201.csv"
mental.health <- read.csv(url)

## Variables of interest: 
mental.health$male1.female2
mental.health$height..cm.

## Females
## Filter the data for all females
f.height <- mental.health[mental.health$male1.female2 == 2, "height..cm."]
f.height

## Sums of Squares
f.height.n <- length(f.height)
f.height.mean <- sum(f.height) / f.height.n
centred.scores <- f.height - f.height.mean
round(sum(centred.scores))

sq.deviations <- centred.scores^2
ss <- sum(sq.deviations)

variance <- ss / (f.height.n - 1)

##Superfast way
var(f.height)

std.deviation <- sqrt(variance)
sd(f.height)


