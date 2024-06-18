## Lecture Week 8

data2300_url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/202420_2300_classdata.csv"
data2300_df <- read.csv(data2300_url)

## Correlate screentime and work

scr.mean <- mean(data2300_df$hrs.screentime.weekly)
wrk.mean <- mean(data2300_df$hrs.work.weekly)

deviation.screentime <- data2300_df$hrs.screentime.weekly - scr.mean
deviation.work <- data2300_df$hrs.work.weekly - wrk.mean

## Sample size, the easier way (for a data frame)
n <- nrow(data2300_df)

cov.screentime.work <- sum(deviation.screentime * deviation.work) / (n - 1)

## Verify
cov(data2300_df$hrs.screentime.weekly, data2300_df$hrs.work.weekly)

## What does this mean??? -71.82
## It's a negative relationship: as one value goes up, the other one goes down
## Inverse relationship
## We cannot judge the magnitude of the relationship
## Unstandardized correlation value

## Graphings

plot(data2300_df$hrs.screentime.weekly, data2300_df$hrs.work.weekly,
     main = "Screentime vs Work",
     pch = 20
     )
abline(lm(hrs.work.weekly~hrs.screentime.weekly, data=data2300_df), col="red")

boxplot(data2300_df$hrs.screentime.weekly, data2300_df$hrs.work.weekly, 
        names = c("Screentime", "Work"))

## Next step, requires a new concept: 
## Standardization

z.screen <- deviation.screentime / sd(data2300_df$hrs.screentime.weekly)

## Verify
scale(data2300_df$hrs.screentime.weekly)

z.work <- deviation.work / sd(data2300_df$hrs.work.weekly)

## Verify
scale(data2300_df$hrs.work.weekly)

## And Now Correlation

cor.screentime.work <- sum(z.screen * z.work) / (n - 1)

## Verify
cor(data2300_df$hrs.screentime.weekly, data2300_df$hrs.work.weekly)


### Task
## Student Mental Health Data set, Sheet 1-Table 1

menthealth_url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/studentmentalhealth/Sheet%201-Table%201.csv"
menthealth_df <- read.csv(menthealth_url)

## Is there an association between BMI and WAIS_FIQ?
## 1. Assess Normality
##    a. Histogram (2 separate histograms)
### PLOTTING TOGETHER CAN ONLY BE DONE ON STANDARDIZED DATA (FUN ONLY)
bmi.hist <- hist(
                scale(menthealth_df$BMI), 
                breaks = 15, 
                col = rgb(0,0,1,.5)
                )
iq.hist <- hist(
                scale(menthealth_df$WAIS_FIQ), 
                breaks = 15, 
                col = rgb(1,0,0,.5), 
                add = T)
## PLOT RAW DATA SEPARATELY 

install.packages("moments")
library("moments")
## If you use libraries lsr or psych, kurtosis reference point for mesokurtic is 0. 
## In moments, reference point for mesokurtic is 3

##    b. Boxplot (2 boxplots on one graph)

boxplot(menthealth_df$BMI)
boxplot(menthealth_df$WAIS_FIQ)

##    c. Skew and kurtosis measurements

bmi.kurtosis <- kurtosis(menthealth_df$BMI) ## 3 is mesokurtic, +/- 2 is okay
bmi.skew <- skewness(menthealth_df$BMI) ## 0 is normal, +/- 1 is okay

iq.kurtosis <- kurtosis(menthealt_df$WAIS_FIQ)
iq.skew <- skewness(menthealth_df$WAIS_FIQ)

## 2. Compute covariance

bmi.deviation <- menthealth_df$BMI - mean(menthealth_df$BMI)
iq.deviation <- menthealth_df$WAIS_FIQ - mean(menthealth_df$WAIS_FIQ)

cov.bmi.iq <- sum(bmi.deviation * iq.deviation) / (nrow(menthealth_df) - 1)

#Verify
cov(menthealth_df$BMI, menthealth_df$WAIS_FIQ)

## 3. Standardize scores

z.bmi <- bmi.deviation / sd(menthealth_df$BMI)
z.iq <- iq.deviation / sd(menthealth_df$WAIS_FIQ)

## Now it's possible to put them side by side: 
boxplot(z.bmi, z.iq)

bmi.hist <- hist(
  z.bmi, 
  breaks = 15, 
  col = rgb(0,0,1,.5)
)
iq.hist <- hist(
  z.iq, 
  breaks = 15, 
  col = rgb(1,0,0,.5), 
  add = T)


## 4. Compute correlation

cor.bmi.iq <- sum(z.bmi * z.iq) / (nrow(menthealth_df) - 1)

cor(menthealth_df$BMI, menthealth_df$WAIS_FIQ)
w



