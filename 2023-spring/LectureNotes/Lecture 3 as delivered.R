# Previous concepts
# - Variable assignments
my.minimum.value <- min(3,4,5)

# - Operators
# 1+1 1-1 1/1 1*1 1^1 sqrt(1) 1^(1/2)

# - Creating a variable with a list of items. Also called a vector
my.variable <- c(3,4,5,6,7,8,3,2,1,1)

# - Variable types in psychology and statistics
# Psychology: Nominal, Rank order / categorical, interval, ratio
# Computing sciences: string(in R: character), integer, boolean, float

my.variable2 <- c("red", "yellow", "purple", "blue", "green")

# Central Tendency
# Look for the center of the data set -- find the one number that represents the entire data set
# consists of mean, median and mode

# Functions
# - sum()
# - mean()
# - length()
# - sort()
# - median()
# - hist()


# Today: 
#  - Let’s collect some data 
# - Learn to load a data table

my.stats.classmates <- read.csv("https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2023-spring/data/2300data.csv")

# - head()
head(my.stats.classmates)

# Refer to a column
my.stats.classmates[,2] ## by column number
my.stats.classmates[,"hrs.sleep.weekly"] ## by column name
my.stats.classmates$Semester # using the dollar sign to select a single variable (or one column)

## Examples

my.stats.classmates[my.stats.classmates$Semester == "201910",] ## == means, "is it equal?"

my.stats.classmates[,2] ## get data just for hours of sleep

#Let's combine filtering techniques
my.stats.classmates[my.stats.classmates$Semester == "201910" , 2]

mean(my.stats.classmates[my.stats.classmates$Semester == "201910" , 2])

## Here is your challenge: calculate the mean of sleep hours for this class

mean(my.stats.classmates[my.stats.classmates$Semester == "202310" , 2])

## Turn partial calculations into variables
## Make my filtered data into a variable
precovid <- my.stats.classmates[my.stats.classmates$Semester == "201910" , 2]
postcovid <- my.stats.classmates[my.stats.classmates$Semester == "202310" , 2]

mean(precovid)
mean(postcovid)

# - Variability: min, max, range

min(precovid)
max(precovid)

min(postcovid)
max(postcovid)

range(precovid)
range(postcovid)

# - range = max - min


#- boxplot()

boxplot(precovid,postcovid)


# - Deviation scores

