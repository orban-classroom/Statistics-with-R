## Lecture 7

## Subsetting data frames

data <- read.csv(url("https://github.com/llorban/KPU-Statistics-2300/raw/master/2019%20Summer/Exams/Exam%201/financialinformationactuals2016.csv"))

## psuedocode
## data[row filtering , column filtering]

data[10,] ## output the first row, and no column filtering
data[,1] ## output is the first column, and no row filtering

head(data)

data[data$Salaries < 40,"FinancialPlanDivision"]
data[data$Salaries < 40,3]

## pick out all columns of data where operating costs exceed 10

data[data$OperatingCosts > 10,]


## pick out all values from the internal services column.

data[,"InternalServices"]

## or

data[,6]

## pick out internal services column values wehere operating costs exceed 10

data[data$OperatingCosts > 10, "InternalServices"]

## pick out the 50th value/row and output the name of that financial division

data[50,"FinancialPlanDivision"]


#####################
##  PROBABILITIES  ##
#####################

## glass definitions: 0: no glasses; 1: with glasses

class.specs <- data.frame(
                    predominant.colour = c("green","blue","black","black","black","blue","black","pink","blue","black","grey","black","grey","green","blue","grey","red","pink","pink","green","black","black","black","grey"),
                    glasses = c(0,1,1,1,0,0,0,0,1,0,1,0,0,0,1,1,0,1,0,1,1,0,1,1)
                )

## what is the probability of picking a grey colour from this population?

all.grey.values <- class.specs[
                        class.specs$predominant.colour == "grey",
                        "predominant.colour"]

grey.count <- length(all.grey.values)
all.values <- length(class.specs$predominant.colour)

probability.grey <- grey.count/all.values
  
## what is the probability of selecting someone with glasses?

all.glasses <- class.specs[
                        class.specs$glasses == 1,
                        "glasses"
                      ]

glasses.count <- length(all.glasses)

probability.glasses <- glasses.count / all.values

## Probability of selecting someone who does not wear glasses **and** is predominantly blue.

noglass.blue <- class.specs[
  class.specs$glasses == 0 & class.specs$predominant.colour == "blue",
]

noglass.blue.count <- length(noglass.blue)

probability.noglass.blue <- noglass.blue.count / all.values

### generate random data

## every time you run this code, it will generate a random value, between 0 and 1
runif(1)

runif(100)

fakedata <- runif(100, min = 10, max = 20)
hist(fakedata, main = "My Fake Data", breaks = 20)
## white noise

## create 1000 values that are between -1 and +1

fakedata2 <- runif(1000, min = -1, max = 1)
hist(fakedata2, main = "My Fake Data 2", breaks = 20, col = "blue")

## how about random normally distributed data?

rnorm(1)

hist(rnorm(100))


fakenormaldata <- rnorm(100, mean = 100, sd = 10)
hist(fakenormaldata,
    main = "My Fake Normal Data",
    col = rgb(0.666, 0.172, 0.172),
    breaks = 15)


## more advanced filtering steps
## you can enter functions and other algorithms as a filter rule
data[data$Salaries == max(data$Salaries),"FinancialPlanDivision"]


## from the class.specs, pick out colours that are not pink

not.pink.values <- class.specs[class.specs$predominant.colour != "pink","predominant.colour"]
not.pink.count <- length(not.pink.values)
prob.not.pink <- not.pink.count/all.values
