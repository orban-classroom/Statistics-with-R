# Lecture 2 as delivered to L10

# Learn to import data from the web directly (GitHub)
# Learn to deal with data files that have multiple columns
# Class questionnaire

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024%20Summer/Data/202420_2300_classdata.csv"
my.data <- read.csv(url)

head(my.data)
tail(my.data)

# Maybe I want to display one variable in full: 
# Use a dollar sign to step into a variable inside the data frame
my.data$hrs.sleep.weekly

sum(my.data$hrs.sleep.weekly)
diff(my.data$hrs.sleep.weekly)
?diff
sum(-my.data$hrs.sleep.weekly)


hist(my.data$hrs.sleep.weekly, breaks = 15)

## histogram bins the data

hist(rnorm(100000, 100, 1))



my.fake.data <- data.frame(
                      participantNumber = c(1,2,3,4,5,6,7,8,9,10),
                      reactionTime = c(32,35,23,45,32,45,63,34,32,33)
                    )

my.fake.vector <- c(1,2,3,4,5,6,7,8,9,10)
my.reaction.time <- c(32,35,23,45,32,45,63,34,32,33)

sort(my.data$hrs.screentime.weekly)

?sort
