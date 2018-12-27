# R tutorial about linear transformations.

#first get some data
# you can read data directly from any url which leads to a csv. For the StarCraft dataset use
Data <- read.csv(url("http://summit.sfu.ca/system/files/iritems1/13328/StarCraft2ReplayAnalysis-1.csv"), na.strings='NULL')
#For more info about the variables see http://summit.sfu.ca/item/13328

#here is a recipe for linear transformations. Set the constants a and b and look at what it does to the histogram.
a=1
b=100

#Question 1: what does this linear transformation do to the distribution of APM scores? 
par(mfrow=c(2,1))
#make a hist of untransformed APM
hist(Data$APM, 30,main=paste('Actions per minute (not transformed), standard deviation=',round(sd(Data$APM))))

#create transformed apm variable
Transformed_APM=(a*Data$APM)+b

#plot transformed APM
hist(Transformed_APM, 30, main=paste('Actions per minute (transformed), standard deviation=',round(sd(Transformed_APM))))

#2 Change the values of a and b (try positive and negative values, and values between 0 and 1), then the code to see what the effect of each is. Can you descrie what changing a does versus changing b?

#3 Here is a non linear transformation. You can uncomment the code (remove the hashtags from code with three hashtages). Try to play with the parameters and characterize what changing c does.
###a=5
###b=10
###c=2
###BinNumber=100

###par(mfrow=c(2,1))
#make a hist of untransformed APM
###hist(Data$APM, 30,main=paste('Actions per minute (not transformed), standard deviation=',round(sd(Data$APM))))

#create transformed apm variable
###Transformed_APM=(a*Data$APM)^c+b

#plot transformed APM
###hist(Transformed_APM, BinNumber, main=paste('Actions per minute (transformed), standard deviation=',round(sd(Transformed_APM))))


#4 Hereis another transformation. Guess whether they are linear or non linear from the histogram. Uncomment code by removing anything with three hashtags.

####par(mfrow=c(2,1))
#make a hist of untransformed APM
####hist(Data$APM, 30,main=paste('Actions per minute (not transformed), standard deviation=',round(sd(Data$APM))))

#create transformed apm variable
####Transformed_APM=log(Data$APM)

#plot transformed APM
####hist(Transformed_APM, BinNumber, main=paste('Actions per minute (transformed), standard deviation=',round(sd(Transformed_APM))))
