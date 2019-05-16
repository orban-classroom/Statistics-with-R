y <- c(1,2,3)
colours <- c("red","blue","green")
colours + 5 # not a meaningful computation

class(y)
class(colours)

z <- c(2.1, 4.56, 3.44)
z
class(z)
as.integer(z)

as.integer(colours)

# boolean type
boo <- c(TRUE,FALSE,TRUE,TRUE,FALSE,FALSE)

# a new function to calculate the size of the vector
length(y)
length(colours)

# not the same
departments <- c("A B C D E F")
departments2 <- c("A","B","C","D","E","F")

length(departments)
length(departments2)

# sum
sum(y)
sum(z)
sum(departments2)

sum <- 5
sum[1]    ## using it as a variable
sum(4,5,6)  ## using it as a function

ucb.male.applicants(colours)
ucb.male.applicants[3]
ucb.male.applicants[1:4]

# subsetting, filtering

y[2]
z[2]
colours[2]
colours(2)

## logical operatings in subsetting

2 == 2
2 < 2
2 == 3

ucb.male.applicants[ucb.male.applicants < 500]

library("foreign")
exists("read.spss")
detach("package:foreign", unload=TRUE)
exists("read.spss")

library("ggplot2")
install.packages("ggplot2")


getwd()
setwd("/Users/llorban/Documents")
setwd("C:/Users/llorban/Desktop")
getwd()


# factor type
subjectID <- c(101,102,103,104,105)
subjectID
subjectID * 5
subjectID / subjectID
subjectID <- as.factor(subjectID)
subjectID * 5
subjectID / subjectID


######################
#### WHOA HEADING ####
######################

# Let's put together a data frame

ucb.departments <- c("A","B","C","D","E","F")
ucb.departments <- as.factor(ucb.departments)

ucb.male.applicants <- c(825,560,325,417,191,272)

ucb.female.applicants <- c(108,25,592,375,393,341)

data <- data.frame(
  Department = ucb.departments, 
  Males = ucb.male.applicants, 
  Females = ucb.female.applicants
  )
data

names(data)
head(data)
summary(data)

# encoding the departments as a factor
# Recipe
# as.factor()
# usb.departments
# 

is.factor(data$Department)
is.factor(ucb.departments)
