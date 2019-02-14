## Lecture 6 as delivered
rm(list=ls())

inspection.reports <- read.csv(url("http://data.surrey.ca/dataset/948e994d-74f5-41a2-b3cb-33fa6a98aa96/resource/30b38b66-649f-4507-a632-d5f6f5fe87f1/download/fraserhealthrestaurantinspectionreports.csv"))
restaurants <- read.csv(url("http://data.surrey.ca/dataset/3c8cb648-0e80-4659-9078-ef4917b90ffb/resource/0e5d04a2-be9b-40fe-8de2-e88362ea916b/download/restaurants.csv"))

## trying to figure out, what are the different hazard rating options?
inspection.reports$HazardRating   ## messy solution
unique(inspection.reports$HazardRating)  ## concise solution

## let's create a data frame for each category type

low.hazard <- inspection.reports[inspection.reports$HazardRating == "Low",]
med.hazard <- inspection.reports[inspection.reports$HazardRating == "Moderate",]
high.hazard <- inspection.reports[inspection.reports$HazardRating == "High",]

## Count the number of low, moderate and high hazard occurrences

low.events <- length(low.hazard$HazardRating)
low.events

medium.events <- length(med.hazard$HazardRating)
medium.events

high.events <- length(high.hazard$HazardRating)
high.events

## NEW PROGRAMMING CONCEPT
## Conditionals

## IF...ELSE

if(inspection.reports$HazardRating == "Low"){
  print("Nothing to worry about.")
}

inspection.reports[1,"HazardRating"]
inspection.reports$HazardRating[1]

## CONCEPT: Loops
n <- length(inspection.reports$HazardRating)
counter <- 0
counter
for(stepper in 1:n){ 
  if(inspection.reports$HazardRating[stepper] == "Low"){
    print("Nothing to worry about.")
    counter <- counter + 1
  }
  ## outside of the if function, but inside the for function
  print(stepper)
}
counter

## Select the tracking numbers associated with High hazard rating reports
## Narrow it down to unique tracking numbers

unique.report <- unique(high.hazard$TrackingNumber) ## most concise
unique.report2 <- unique(inspection.reports[inspection.reports$HazardRating == "High","TrackingNumber"])

unique.report[1]
unique.report <- as.character(unique.report)

## Use subsetting rules to output the names of the restaurants associated with the tracking numbers

restaurant_names <- restaurants[restaurants$TRACKINGNUMBER == unique.report[1],"NAME"]
restaurant_names

## do this for every tracking number

for(i in 1:length(unique.report)){
  restaurant_names <- restaurants[restaurants$TRACKINGNUMBER == unique.report[i],"NAME"]
  print(restaurant_names)
}

