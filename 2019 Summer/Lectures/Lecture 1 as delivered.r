
# Type anything you want
# Remarks, headings, ways to organize your code
1+1
1-1
1*1
1/1
1^1

10 = 10
10 == 10
5 == 10
5 < 10
5 > 10
10 <= 10

10             +1 ## not technically incorrect, but ugly
10+1
10 + 1

R.Version()
citation()

citation(
  
  
)

citation () ## this okay
cit ation() ## this is just wrong
Citation() ## this is wrong and R is case sensitive don't muck up

## Assigning variables

## naming schemes
x 
hours.of.studying
hrs.study
Hrs.Study
hrs_study
hrsStudy

hrs.Study = 10 # in most programming languages, this is it
hrs.Study <- 10 # this is the preferred method
                # this symbol <- is the assignment operator

hrs.Study
hrs.Study

hrs.Study - 5
hrs.Study * hrs.Study

## watch for brackets to prioritize sequence of operations
hrs.Study * hrs.Study + hrs.Study
hrs.Study * (hrs.Study + hrs.Study)


## vectors: sequence of numbers

craved.Caffeine <- c(500, 0, 20) ## units in mg
craved.Caffeine
craved.Caffeine - 5
craved.Caffeine ^ 2

class(craved.Caffeine) ## the class function tells you the 
                       ## data type of your variable
as.factor(craved.Caffeine) ## code the variable as a factor
class(craved.Caffeine) ## how come it still says numeric?
craved.Caffeine <- as.factor(craved.Caffeine)  ## save the command to itself
craved.factor.caffeine <- as.factor(craved.Caffeine)  ## save the command into another variable
class(craved.Caffeine)

colours.eyes.1 <- c("green", "brown", "blue", "hazel") ## this is  correct
colours.eyes.2 <- c("green, brown, blue, hazel") ## this is  technically correct, but wrong

length(colours.eyes.1) ## tells us how many elements there are in the vector
length(colours.eyes.2)

my.number <- "1.55"
my.number <- as.numeric(my.number)

craved.Caffeine <- as.numeric(craved.Caffeine)
sum(craved.Caffeine)


hrs.Sleep <- c(7,2,9,7,4,8,6,7,7,7,8,7,6,7,8,9,6,7,7,4,8,7,6,8,8,5,8,0,7,6,8,7,5,5)
min.to.KPU <- c(30,5,20,70,40,25,35,120,30,15,7,25,80,20,25,15,40,15,90,90,10,15,5,5,15,5,40,15,20,20,20,30,15,30)

length(hrs.Sleep)
length(min.to.KPU)

sum(hrs.Sleep)
sum(min.to.KPU)

total_min_to_KPU <- sum(min.to.KPU/60)

hist(min.to.KPU)



