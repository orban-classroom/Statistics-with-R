rm(list=ls())
mydata <- read.csv(url("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2019%20Spring/data/2300classdata/data.csv"))
head(mydata)
summary(mydata)
names(mydata)

workmean <- mean(mydata$hrs.work.weekly)
workcc <- mydata$hrs.work.weekly - workmean
## checking centering
round(sum(workcc),3)
works <- sd(mydata$hrs.work.weekly)

workz <- workcc/works
workz

par(mfrow=c(1,2)) ## this code allows you to output multiple graphs
hist(workz, breaks = 15) ## missing labels of title, axes,breaks (and other goodies)
hist(mydata$hrs.work.weekly, breaks = 15)

## easy way to compute scale

scale(mydata$hrs.work.weekly)


## do the same for caffeine consumption

caffmean <- mean(mydata$cups.caffeine.weekly)
caffs <- sd(mydata$cups.caffeine.weekly)
caffcc <- mydata$cups.caffeine.weekly - caffmean
round(sum(caffcc),3)

caffz <- caffcc/caffs

par(mfrow=c(1,2))
hist(caffz, breaks=10)
hist(mydata$cups.caffeine.weekly, breaks=10)

par(mfrow=c(1,2))
hist(caffz,breaks=10)
hist(workz,breaks=10)
    
caffz[3]
workz[3]

## find the chance level associated with the 3rd person's 
## caffeine and work consumption

1-pnorm(caffz[3])
pnorm(workz[3])

## Compute the SEM for the hrs of work variable

workn <- length(mydata$hrs.work.weekly)
worksem <- works/sqrt(workn)

par(mfrow=c(1,1))
midpoints <- barplot(workmean,ylim = c(0,30))
midpoints
workmean

arrows(
  midpoints,workmean-worksem, ## starting point, horizontal and vertical points
  midpoints,workmean+worksem, ## ending point, horizontal and vertical parameter
  length=.05, ## styling definition
  angle=90, ## styling the arrow
  code=3 ## styling
)

## Compute the caffeine sem

caffsem <- caffs / sqrt(workn)
caffsem

## Create a vector of means for our barplot

means.for.my.barplot <- c(workmean, caffmean)
sem.for.my.barplot <- c(worksem, caffsem)

## daw bar plot

mid.points <- barplot(means.for.my.barplot,
                      ylim = c(0,30),
                      names.arg = c("work hrs","caff intake"),
                      main = "Class data from Week 1"
                      )

## draw the sem on top of this graph

arrows(
    mid.points,means.for.my.barplot - sem.for.my.barplot,
    mid.points,means.for.my.barplot + sem.for.my.barplot,
    length=0.05,
    angle=90,
    code=3
)
