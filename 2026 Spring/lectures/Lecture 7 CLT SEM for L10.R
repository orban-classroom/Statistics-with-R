## Estimating Unknown Quantities

library(moments)

## Loading Data
data.url <- "https://raw.githubusercontent.com/orban-classroom/Statistics-with-R/refs/heads/master/2026%20Spring/data/studentmentalhealth.csv"
smart.health.study <- read.csv(data.url)

## Research Question
## Are super intelligent people also healthier, physiologically, as measured by their momentary HRV?

## Filter, Sanitization
superintelligent <- na.omit(
                      smart.health.study[
                          smart.health.study$WAIS_FIQ >= 120 & smart.health.study$CVRR < 20,
                          ]
                      )

pedestrianintlligent <- na.omit(
                          smart.health.study[
                            smart.health.study$WAIS_FIQ < 120,
                          ]
                        )


## Normality
## Superintelligent
skewness(superintelligent$CVRR) ## heavily positively skewed
kurtosis(superintelligent$CVRR) ## very leptokurtic (pointy)

## Pedestrian
skewness(pedestrianintlligent$CVRR) ## heavily positively skewed
kurtosis(pedestrianintlligent$CVRR) ## very leptokurtic (pointy)

hist(superintelligent$CVRR,
     breaks = 20,
     xlim = c(0,35),
     ylim = c(0,20),
     col = rgb(0,1,0,.5),
     main = "Intelligence Groups and their Heart-Rate Variability",
     xlab = "Scores of HRV"
     )
hist(pedestrianintlligent$CVRR,
     breaks = 20, 
     xlim = c(0,35),
     ylim = c(0,20),
     col = rgb(1,0,0,0.5),
     add = TRUE)

boxplot(superintelligent$CVRR, 
        pedestrianintlligent$CVRR,
        names = c("Superintelligent","Pedestrian"),
        ylab = "HRV Scores",
        main = "Boxplots of HRV Measures with levels of Intelligence"
        )

## Estimating Population Characteristics

superintelligent_sem <- sd(superintelligent$CVRR) / sqrt(nrow(superintelligent))
pedestrian_sem <- sd(pedestrianintlligent$CVRR) / sqrt(nrow(pedestrianintlligent))

sems <- c(superintelligent_sem, pedestrian_sem)

superintelligent_mean <- mean(superintelligent$CVRR)
pedestrian_mean <- mean(pedestrianintlligent$CVRR)

intel_means <- c(superintelligent_mean, pedestrian_mean)

bar.mid.points <- barplot(intel_means, 
        ylim = c(0,10))

arrows(
  bar.mid.points, intel_means - sems,
  bar.mid.points, intel_means + sems,
  angle = 90,
  code = 3,
  length = 0.05
)




