## R Lab 6: Probabilities

## 1. 
What proportion of a normal distribution is located in the tail beyond a z-score of z = –1.50?
```r
pnorm(-1.50)
```

## 2. 
A vertical line is drawn through a normal distribution at z = –1.00. How much of the distribution is located between the line and the mean?
```r
pnorm(-1,lower.tail=FALSE)-pnorm(0)
# express proportion as a positive value
```

## 3.
For a normal distribution with a mean of μ = 500 and σ = 100, what is the probability of selecting an individual with a score less than 400?
```r
pnorm(400,mean=500,sd=100)
```
or expressed as a percentage
```r
pnorm(400,mean=500,sd=100)*100
```

## 4. 
For a normal distribution with a mean of μ = 40 and σ = 4, what is the probability of selecting an individual with a score greater than 46?
```r
1-pnorm(46,mean=40,sd=4)
```
or
```r
pnorm(46,mean40,sd=4,lower.tail=FALSE)
```

## 5. 
An individual is selected from a normal population with μ = 100 and σ = 10 and a treatment is administered to the individual. After treatment, the individual has a score of X = 125. What is the probability that individual with a score this high or higher would be obtained if the treatment has no effect?
```r
1-pnorm(125,mean=100,sd=10)
```
or
```r
pnorm(125,mean=100,sd=10,lower.tail=FALSE)
```
