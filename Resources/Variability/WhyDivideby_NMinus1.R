# (CHECK FOR BUGS!) Joe's drafted code that attempts to simulate whether n-1 really gets you a better estimate of the population standard deviation

# it turns out that if you want to get a slightly better estimate of the population standard deviation or covariance, you are, on average, # also see https://en.wikipedia.org/wiki/Bessel%27s_correction and https://math.stackexchange.com/questions/15098/sample-standard-deviation-vs-population-standard-deviation
# but also see https://en.wikipedia.org/wiki/Bessel%27s_correction and https://math.stackexchange.com/questions/15098/sample-standard-deviation-vs-population-standard-deviation

#tutorial: Select values for n, population mean, and population standard deviation (we are sampling from a normal distribution here). This code will then take 100 samples, calculate standard deviation with n and standard deviation with n-1, to see which is closest to the population standard deviation.

UnbiassedBetter=0
for(i in 1:100){
  n=100
PopulationSD=1
PopulationMean=0
X=rnorm(n,PopulationMean,PopulationSD)

deviancex=X=mean(X)

SDx_n=(deviancex^2)/n
SDx_unbiassed=(deviancex^2)/(n-1)


#which is closer to zero?
ClosenesstoPopulationSD_n=abs(SDx_n-PopulationSD)
ClosenesstoPopulationSD_unbiassed=abs(SDx_unbiassed-PopulationSD)
if(ClosenesstoPopulationSD_n>ClosenesstoPopulationSD_unbiassed){
  UnbiassedBetter=UnbiassedBetter+1
}}

paste('The \'unbiassed\' estimate of the standard deviation is closer to the population sd ', UnbiassedBetter, ' times')
