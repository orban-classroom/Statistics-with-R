population1 <- c("black","black","white","white","white","white","black","black","white","black")
population2 <- c("black","black","black","black","black","black","black","black","black","white")

## number of outcomes classified as black

allblackballs1 <- population1[population1 == "black"]
allblackballs2 <- population2[population2 == "black"]

blackbag1 <- length(allblackballs1)
blackbag2 <- length(allblackballs2)

blackbag1
blackbag2

## the total number of balls in each bag

totalbag1 <- length(population1)
totalbag2 <- length(population2)

## probability of a black ball

prob.black.1 <- blackbag1/totalbag1
prob.black.2 <- blackbag2/totalbag2

prob.black.1
prob.black.2



## simple vector problem

x <- c(1,1,2,3,3,4,4,4,5,6)

vals.greater.than.four <- length(x[x>4])
total.vals <- length(x)

prob.greater.than.four <- vals.greater.than.four / total.vals
prob.greater.than.four


## Random number generation

runif(1)

runif(3)

runif(3, min = 5, max = 10)

## From a normal distribution

rnorm(1)

rnorm(3)

rnorm(3, mean = 10, sd = 2)
