#Joe code 

#R tutorial, four questions to excercise your understanding of frequeny tables and histograms.

#Real data have a variety of types. Take a look at the StarCraft 2 data from my 2013 paper

# you can read data directly from any url which leads to a csv. For the StarCraft dataset use

Data <- read.csv(url("http://summit.sfu.ca/system/files/iritems1/13328/StarCraft2ReplayAnalysis-1.csv"), na.strings='NULL')

#For more info about the variables see http://summit.sfu.ca/item/13328

#1) Look at each variable and decide whether it is pseudo continuous or nominal. To run one line of code at a time highlight it and click 'Run'
#League reflects the skill level of the player
table(Data$LeagueIndex, useNA='ifany')

#age
table(Data$Age, useNA='ifany')

# Action Latency This is analogous to reaciton time
table(Data$ActionLatency, useNA='ifany')

#If you like you can see a histogram of Action Latency, here you go.
hist(Data$ActionLatency)

#complex units per timestamp (these are difficult units to use so better players may avoid them)
table(Data$ComplexUnitsMade, useNA='ifany')

# if you want a histogram of the number of complex units made
hist(Data$ComplexUnitsMade)


#Quesiton 2: Here I will round complex units made. What kind of frequency table have I essentially created?
table(round(Data$ComplexUnitsMade,5))

#hint:
hist(Data$ComplexUnitsMade,66)


# Question 3: Which of the above variables have missing values?

# Question 4: Enter the bins/groups in these histograms. Which do you think is the clearest/most informative?
GroupNumber=????
hist(Data$ComplexUnitsMade)

GroupNumber=2
hist(Data$Age,GroupNumber)
