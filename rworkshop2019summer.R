my.transcript <- read.csv("/Users/llorban/Desktop/transcript.csv")
read.csv(url("http:/ssssss.csv"))

names(my.transcript)
class(my.transcript$Credit.Hours)
class(my.transcript$Quality.Points)
my.transcript$Credit.Hours <- as.integer(my.transcript$Credit.Hours)
my.transcript$Quality.Points <- as.numeric(my.transcript$Quality.Points)
class(my.transcript$Credit.Hours)

class(my.transcript$Subject)
class(my.transcript$semester)

# cGPA calculation
# quality points / credit hours

cGPA <- sum(my.transcript$Quality.Points) / sum(my.transcript$Credit.Hours)

## Psychology GPA

## subsetting, filtering, extracting
psycGPA <- sum(my.transcript[my.transcript$Subject == "PSYC","Quality.Points"]) / sum(my.transcript[my.transcript$Subject == "PSYC", "Credit.Hours"])

## Last two years of GPA

twoGPA <- sum(my.transcript[my.transcript$semester >= 200610,"Quality.Points"]) / sum(my.transcript[my.transcript$semester >= 200610,"Credit.Hours"])

## aesthetically pleasing solution
filter <- my.transcript[my.transcript$semester >= 200610,c("Quality.Points","Credit.Hours")]
sum(filter$Quality.Points)/sum(filter$Credit.Hours)


## aesthetically pleasing solution to PSYC & last two years
filtration <- my.transcript[my.transcript$semester >= 200610 & my.transcript$Subject == "PSYC",c("Quality.Points","Credit.Hours")]
sum(filtration$Quality.Points)/sum(filtration$Credit.Hours)

## just one year of GPA, excluding "E" column values
oneyear <- my.transcript[my.transcript$semester >= 200230 & my.transcript$semester <= 200330 & my.transcript$inclusion != "E",c("Quality.Points","Credit.Hours")]
sum(oneyear$Quality.Points)/sum(oneyear$Credit.Hours)


install.packages("dplyr")
library(dplyr)

tGPA <- my.transcript %>%
  group_by(semester) %>%
  summarise(sumQP = sum(Quality.Points), sumCH = sum(Credit.Hours)) %>%
  mutate(tGPA = sumQP / sumCH)

barplot(tGPA$tGPA,
  ylim = c(0,5),
  col = "red",
  main = "My GPA",
  names.arg = unique(my.transcript$semester),
  cex.names = 0.5)

## Create a barplot of course GPA
courseGPA <- my.transcript$Quality.Points / my.transcript$Credit.Hours

barplot(courseGPA)

## saving data frames and other objects
getwd()
setwd("/Users/llorban/Desktop")
write.csv(tGPA, file = "tgpafile.csv")
