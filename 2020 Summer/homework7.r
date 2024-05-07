# Homework 7

# 1. Continue with last week's data set. Load it and re-create the two filtered data frames

# 2. Produce a histogram of the NUMNONCRITICAL variable for each of your two categories (Routing and Follow-Up)

# 2. b. What is the shape of the distributions? (kurtosis and skewness)

# 3. Produce a barplot of each group of data (Routine and Follow-Up) based on the means of the NUMNONCTRITICAL column

routine.mean <- mean(routine$NUMNONCRITICAL)
followup.mean <- mean(followup$NUMNONCRITICAL)

graph.midpoints <- barplot(c(routine.mean, followup.mean), ylim = c(0,1.2))

# 3. b. What are your observations of the two means? (which one is bigger? does it look like the difference is big?)

# 4. Create another barplot and add whiskers indicating SEM (watch video on Youtube)

arrows(
  graph.midpoints, c(routine.mean-routine.sem, followup.mean-followup.sem),
  graph.midpoints, c(routine.mean+routine.sem, followup.mean+followup.sem), 
  length = 0.05,
  angle = 90,
  code = 3
)

# 5. Create another barplot and add whiskers indicating CI-99

# 6. Compute the effect size between the two groups