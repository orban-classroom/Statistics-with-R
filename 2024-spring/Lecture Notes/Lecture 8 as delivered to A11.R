## Lecture 8

## Is there a significant difference in body weight between highly anxious and not anxious individuals?

url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/master/2024-spring/Data/studentwellbeing_nice.csv"
nice.wellbeing <- read.csv(url)

colnames(nice.wellbeing)
head(nice.wellbeing)

## Filter

high.anxiety <- nice.wellbeing[!is.na(nice.wellbeing$Weight..kg.) & nice.wellbeing$Anxiety.symptoms == "yes",]
low.anxiety <- nice.wellbeing[!is.na(nice.wellbeing$Weight..kg.) & nice.wellbeing$Anxiety.symptoms == "no",]

## Check assumptions

## Normality
par(mfrow = c(1,2))
  hist(high.anxiety$Weight..kg.)
  hist(low.anxiety$Weight..kg.)

  par(mfrow = c(1,1))
  boxplot(high.anxiety$Weight..kg., 
          low.anxiety$Weight..kg.,
          names = c("High Anxiety", "Low Anxiety")
          )

library(psych)
  skew(high.anxiety$Weight..kg.)
  skew(low.anxiety$Weight..kg.)    

  kurtosi(high.anxiety$Weight..kg.)
  kurtosi(low.anxiety$Weight..kg.)  

## Sample size difference
  nrow(low.anxiety) / nrow(high.anxiety)
  ## Very significant difference in sample size

## Homogeneity of Variance
  ## There is an assumption that the sample for each of your groups of data
  ## are drawn from the same population. 
  ## If they are drawn from the same population, their variance should be equivalent / similar
  ## If the two variances are very different, it is assumed that they are not drawn from the same population
  ## Pseudocode: f_max <- larger variance / smaller variance
  ## Heuristic: If the value is greater than 2.5, than you have a problem
  
  f_max <- var(low.anxiety$Weight..kg.) / var(high.anxiety$Weight..kg.)
  f_max  
  ## very ideal - conclude that we have homogeneity of variance
  
  
## Independence of observations
  ## we can't comment on this since we did not collect the data
  
## Standard Error of the Mean (SEM)
  
  sd.high.anxiety <- sd(high.anxiety$Weight..kg.)
  sem.high.anxiety <- sd.high.anxiety / sqrt(nrow(high.anxiety))
  
  sd.low.anxiety <- sd(low.anxiety$Weight..kg.)
  sem.low.anxiety <- sd.low.anxiety / sqrt(nrow(low.anxiety))

  sem.vector.anxiety <- c(sem.high.anxiety, sem.low.anxiety)
  
  mean.vector.anxiety <- c(mean(high.anxiety$Weight..kg.), mean(low.anxiety$Weight..kg.))
  
  midpoints <- barplot(mean.vector.anxiety,
          main = "Bar Plot of Body Weight",
          names.arg = c("High Anxiety", "Low Anxiety"),
          ylim = c(0,65))

  arrows(
    midpoints, mean.vector.anxiety + sem.vector.anxiety,
    midpoints, mean.vector.anxiety - sem.vector.anxiety, 
    length = .1,
    code = 3,
    angle = 90
  )  
  
  ## Find the t-test and the p-value corresponding to the t-test
  ## Pseudocode for t-test: t = mean differences / pooled_sem
  
  ## Pooled Standard Error Calculation
  
  ss.high.anxiety <- sum((high.anxiety$Weight..kg. - mean(high.anxiety$Weight..kg.))^2)
  ss.low.anxiety <- sum((low.anxiety$Weight..kg. - mean(low.anxiety$Weight..kg.))^2)
  
  ## Pooled Variance
  
  df.high.anxiety <- nrow(high.anxiety) - 1
  df.low.anxiety <- nrow(low.anxiety) - 1
  df.total <- df.high.anxiety + df.low.anxiety
  
  s2.pooled <- (ss.high.anxiety + ss.low.anxiety) / 
               (df.high.anxiety + df.low.anxiety)
  
  ## Pooled Standard Error
  sem.pooled <- sqrt(
                    (s2.pooled / nrow(high.anxiety)) + 
                    (s2.pooled / nrow(low.anxiety))
                  )
  
  t.test.anxiety <- (mean.vector.anxiety[1] - mean.vector.anxiety[2]) / sem.pooled
  
  ## What does this mean? This value needs to have an accompanying p-value to determine significant
  
  ## Method 1: Manually
  ## Looking up the Student's t test table, we find that a df = 3992 (closest df in the table is 1000)
  ## and a two-tailed significant test, the critical t-value is 1.962
  ## If your actual t test value is greater than 1.962, then you conclude that the test is significant, p < 0.05
  ## IF the actual t test is less than 1.962, you "fail to reject the null hypothesis" - there is no meaningful difference in the groups (p > 0.05)
  ## Our conclusion in this case (this is how you report it in a Results section of a paper): 
  ## (the sign of a t-test does not matter, ignore it)
  ## We found a significant difference between the two groups (t = 2.02, p < 0.05). 
  ## Body weight is significantly different in participants of low and high anxiety status. 
  
  ## Method 2: R User
  ## Step 1, Determine the critical t-value (programmatically)
  crit.t.value <- qt(
    p = 0.05/2, ## two-tailed test puts 2.5% of chance in each tail of the distribution
    df = df.total, ## the total df is going to be (total n - 2) or (df1 + df2)
    lower.tail = FALSE ## we want two.tailed estimation
  )
  crit.t.value  
  
  ## Step 2, Determine the exact p-value
  p.value <- 2 * pt(
    q = abs(t.test.anxiety), ## does not care about the sign, so take the absolute value
    df = df.total,
    lower.tail = FALSE
  )
  p.value  

  ## Our conclusion in this case (this is how you report it in a Results section of a paper): 
  ## We found a significant difference between the two groups (t = 2.02, p = 0.043). 
  ## Body weight is significantly different in participants of low and high anxiety status. 
  
  ## Validate calculations
  
  t.test(high.anxiety$Weight..kg., low.anxiety$Weight..kg.,
         alternative = "two.sided",
         paired = FALSE,
         var.equal = TRUE
         )
  
  
## Research Question: Is there a significant difference in body weight between those with a learning disability vs those without?
  
yes.ld <- nice.wellbeing[!is.na(nice.wellbeing$Weight..kg.) & nice.wellbeing$Learning.disabilities == "yes",]
no.ld <-  nice.wellbeing[!is.na(nice.wellbeing$Weight..kg.) & nice.wellbeing$Learning.disabilities == "no",]
  
## Assumptions
## Normality
hist(yes.ld$Weight..kg.)
hist(no.ld$Weight..kg.)  
  
boxplot(yes.ld$Weight..kg., no.ld$Weight..kg.,
        names = c("Yes LD", "No LD")
        )

## Homogeneity of Variance

f_max <- var(yes.ld$Weight..kg.) / var(no.ld$Weight..kg.)  
f_max  

## Sample size difference
nrow(no.ld) / nrow(yes.ld)
## Problematic

## Independence of observations
## Cannot comment

sd.no.ld <- sd(no.ld$Weight..kg.)
sem.no.ld <- sd.no.ld / sqrt(nrow(no.ld))

sd.yes.ld <- sd(yes.ld$Weight..kg.)
sem.yes.ld <- sd.yes.ld / sqrt(nrow(yes.ld))

sem.vector.ld <- c(sem.no.ld, sem.yes.ld)
mean.vector.ld <- c(mean(no.ld$Weight..kg.), mean(yes.ld$Weight..kg.))

midpt <- barplot(mean.vector.ld, 
        ylim = c(0,80), 
        main = "Learning Disability and Body Weight", 
        names.arg = c("No LD", "Yes LD"))

arrows(
  midpt, mean.vector.ld - sem.vector.ld,
  midpt, mean.vector.ld + sem.vector.ld,
  angle = 90,
  length = .1,
  code = 3
)


## t-test

## Generate a pooled sem

ss.no.ld <- sum((no.ld$Weight..kg. - mean(no.ld$Weight..kg.))^2)
ss.yes.ld <- sum((yes.ld$Weight..kg. - mean(yes.ld$Weight..kg.))^2)

df.no.ld <- nrow(no.ld) - 1
df.yes.ld <- nrow(yes.ld) - 1
df.total.ld <- df.no.ld + df.yes.ld

s2.pooled.ld <- (ss.no.ld + ss.yes.ld) / (df.no.ld + df.yes.ld)

sem.pooled.ld <- sqrt(
                    (s2.pooled.ld / nrow(no.ld)) + 
                    (s2.pooled.ld / nrow(yes.ld))
                  )

t.test.ld <- (mean.vector.ld[1] - mean.vector.ld[2]) / sem.pooled.ld

## Method 1
## df = 3992, and a two-tailed test at an alpha level set at 0.05
## Critical t-value according to the Student's t table
## Critical t: +/- 1.962
## Actual t-test value: 1.911

## Conclusion: We fail to reject the null hypothesis because the t-test did not reach significance (t = 1.911, p > 0.05)

## Method 2
crit.t.value.ld <- qt(
  p = 0.05/2, ## two-tailed test puts 2.5% of chance in each tail of the distribution
  df = df.total.ld, ## the total df is going to be (total n - 2) or (df1 + df2)
  lower.tail = FALSE ## we want two.tailed estimation
)
crit.t.value.ld  

## Step 2, Determine the exact p-value
p.value <- 2 * pt(
  q = abs(t.test.ld), ## does not care about the sign, so take the absolute value
  df = df.total.ld,
  lower.tail = FALSE
)
p.value  

## Conclusion: We fail to reject the null hypothesis because the t-test did not reach significance (t = 1.911, p = 0.056)
## Learning disability is  not associated with different levels of body weight. 

## Combine the graphics side by side
par(mfrow = c(1,2))

midpt <- barplot(mean.vector.ld, 
                 ylim = c(60,80), 
                 main = "Learning Disability and Body Weight", 
                 names.arg = c("No LD", "Yes LD"))

arrows(
  midpt, mean.vector.ld - sem.vector.ld,
  midpt, mean.vector.ld + sem.vector.ld,
  angle = 90,
  length = .1,
  code = 3
)

midpoints <- barplot(mean.vector.anxiety,
                     main = "Bar Plot of Body Weight",
                     names.arg = c("High Anxiety", "Low Anxiety"),
                     ylim = c(60,80))

arrows(
  midpoints, mean.vector.anxiety + sem.vector.anxiety,
  midpoints, mean.vector.anxiety - sem.vector.anxiety, 
  length = .1,
  code = 3,
  angle = 90
)  

mean.vector.anxiety
mean.vector.ld
