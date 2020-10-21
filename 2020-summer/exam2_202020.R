# Statistics Final Exam

#############################
##### About the Data ########
#############################
# Title: Data from: A carbohydrate-rich diet increases social immunity in ants
# Data source: https://datadryad.org/stash/dataset/doi:10.5061/dryad.865s4
# Raw GitHub link: https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2020-summer/Kay_et_al_RSPB_2013_2374_worker_survival_metapleural_blockage_experiment_solitary.csv
# Column/variable definitions: 
# "Diet Treatment" = colonies were reared either on a 1 part protein: 3 part carbohydrate diet (1P:3C) or a 3:1C diet
# "Grouping" = this analysis was restricted to ants that were maintained alone (solitary)
# "blocked" = whether or not metapleural glands were blocked experimentally
# "time" = number of days since metapleural treatments were applied
# "frequency" = number of ant deaths recorded at that time period
# "censor" = number of ants that were censored at that time period

##### EXAM RULES
##### No discussions about the exam with anyone. Cheating meets 0 on the exam. 
##### Using textbook and R Help is okay
##### Save calculations as variables and **reuse them** throughout


#### Load the data into a data frame
df <- read.csv("https://raw.githubusercontent.com/llorban/KPU-Statistics-2300/master/2020-summer/Kay_et_al_RSPB_2013_2374_worker_survival_metapleural_blockage_experiment_solitary.csv")

### Output the first five rows of the data frame

head(df)

### You will conduct an independent samples t-test. 
### Your Independent Variable is "blocked" and your Dependent Variable is "frequency"
### Answer the questions below
######################################################

### What is the total sample size?
n <- nrow(df)

### What is the degrees of freedom?
degfree <- n - 1

### Create a filter for the blocked - yes group
filter.yes <- df[df$blocked == "yes",]

### Create a filter for the blocked - no group
filter.no <- df[df$blocked == "no",]

### What is the group size / sample size of the blocked - yes group?
n.yes <- nrow(filter.yes)

### What is the degrees of freedom for this group?
df.yes <- n.yes - 1

### What is the group size / sample size of the blocked - no group?
n.no <- nrow(filter.no)

### What is the degrees of freedom for this group?
df.no <- n.no - 1

### What is the mean of the frequency of the blocked - yes group, fast way?
mean.yes <- mean(filter.yes$frequency)

### What is the mean of the frequency of the the blocked - no group, fast way?
mean.no <- mean(filter.no$frequency)

### Display a histogram of the frequency variable of the blocked - yes group
### Must have title, axis labels for legibility
### Use styling to make it fancy for bonus marks. 
hist(filter.yes$frequency)

### Display a histogram of the frequency variable of the blocked - no group
### Must have title, axis labels for legibility
### Use styling to make it fancy for bonus marks.
hist(filter.no$frequency)

### Make comments about the normality of each group


### Compute the variance of the frequency variable of the blocked - yes group the manual way
deviation.scores.yes <- filter.yes$frequency - mean.yes
squared.deviation.scores.yes <- deviation.scores.yes^2
ss.yes <- sum(squared.deviation.scores.yes)
var.yes <- ss.yes / df.yes

### Compute the variance of the frequency variable of the blocked - yes group the fast way
var(filter.yes$frequency)

### Compute the variance of the frequency variable of the blocked - no group the manual way
deviation.scores.no <- filter.no$frequency - mean.no
squared.deviation.scores.no <- deviation.scores.no^2
ss.no <- sum(squared.deviation.scores.no)
var.no <- ss.no / df.no

### Compute the variance of the frequency variable of the blocked - no group the fast way
var(filter.no$frequency)

### Compute the pooled variance frequency variable
pooled.variance <- (ss.yes + ss.no) / (degfree)

### Compute the standard deviation of the frequency variable of the blocked - no group, any way
sd(filter.no$frequency)

### Compute the standard deviation of the frequency variable of the blocked - yes group, any way
sd(filter.yes$frequency)

### Compute Hartley's F-Max test for homogeneity of variance using the min/max technique described in the tutorial
### Remember to reuse variables from earlier
variances <- c(var.yes, var.no)
fmax <- max(variances) / min(variances)

### Interpret the meaning of the F-Max value you obtained

### Compute the standard error of the mean (SEM) for the frequency variable of the blocked - no group
sem.no <- mean.no / sqrt(n.no)

### Compute the standard error of the mean (SEM) for the frequency variable of the blocked - no group
sem.yes <- mean.yes / sqrt(n.yes)

### Combined the SEM values into a single column, c()
combined_sem <- c(sem.no, sem.yes)

### Compute the t-test using any way (manual technique, t.test() or independentSamplesTTest() )
t.test(filter.yes$frequency,filter.no$frequency)

### Display a bar plot with error bars indicating SEM
barplot(c(mean.yes, mean.no))
arrow(combined_sem,)

### Interpret the t-test results, state a conclusion about the data